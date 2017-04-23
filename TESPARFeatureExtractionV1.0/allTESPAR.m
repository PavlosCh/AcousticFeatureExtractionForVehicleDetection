%% Code for obtaining D/S matrix
%% Receiving Signal
clear;

%read data into array from txt file
filename = 'data.csv';
data = csvread(filename);

[lengthOfSignal, signals] = size(data);

%% Pre-processing Each Signal

filteredData = data;
% 5th order LP Butterworth Filter
Wn = 1000/(5000/2); % Normalised cut-off frequency
[B, A] = butter(5, Wn, 'low'); %H(z) = B(z)/A(z) A, B are transfer function coefficients

for i=1:signals
    filteredData(:, i) = filter(B,A, data(:,i));
    
    filteredData(:,i) = filteredData(:, i) - mean(filteredData(:,i));
end

%% Getting D, S characteristics and storing in DSinfo

% gets individual DSinfo for every signal individually (tempDSinfo)
DSinfo = zeros(1,2);

for signalIndex=1:signals
    epochs = zeros(3072,2);
    epochs(1, 1) = 1;
    row = 1;
    
    %getting lengthOfSignal of D
    for i = 1:lengthOfSignal - 1
        if ( ((filteredData(i, signalIndex) > 0 || filteredData(i, signalIndex) == 0) && filteredData(i+1, signalIndex) < 0 ) || ...
              (filteredData(i, signalIndex) < 0 && (filteredData(i+1, signalIndex) > 0 || filteredData(i+1, signalIndex) == 0)) )
            epochs(row, 2) = i;
            row = row+1;
            epochs(row, 1) = i+1;
        end
    end
    epochs(row, 2) = lengthOfSignal; %setting end as last signal
    epochs = epochs(1:row, :); %clearing trailing zeros based on # of epochs
    tempDSinfo = zeros(row, 2);
    
    %filling in column with D characteristic
    for i=1:row
        tempDSinfo(i, 1) = epochs(i, 2)-epochs(i, 1)+1; 
    end
    
    for i = 1:row
        %create window from epoch start and finish
        epochWindow = filteredData(epochs(i, 1):epochs(i, 2), signalIndex);
        if (length(epochWindow) >= 3)
            if (epochWindow(1) > 0) 
                epochWindow = epochWindow*(-1); % invert and then perform findPeaks
            end
            peakVector = findpeaks(epochWindow);
            tempDSinfo(i, 2) = length(peakVector);
        else
            tempDSinfo(i, 2) = 0;
        end
    end
    
    % Setting max value of S to 5
    for i=1:row
        if (tempDSinfo(i, 2) > 5)
            tempDSinfo(i, 2) = 5;
        end
    end
    
    DSinfo = vertcat(DSinfo, tempDSinfo);
end
DSinfo = DSinfo(2:length(DSinfo),:);

% filtering out values of D greater than 62
DS = zeros(length(DSinfo), 2);
count = 1;
for i=1:length(DSinfo) 
    if (DSinfo(i, 1) <= 62) 
        DS(count,:) = DSinfo(i,:);
        count = count + 1;
    end
end
count = count-1;
DS = DS(1:count,:);

%% Getting the D/S matrix
% Prior to this need to have epochs from all the signals of car
% D-rows, S-columns 

DSmatrix = zeros(62, 6);

for i=1:count
    DSmatrix(DS(i, 1), (DS(i, 2)+1)) = DSmatrix(DS(i, 1), (DS(i, 2)+1)) + 1;
end

