%% Code for obtaining DSpairs, to be used for Featute Creation
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
DSinfo = ones(291, 1);
maxLength = zeros(103, 1);
index = 1;

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
    tempDSinfo = zeros(291, 2);
    
    %filling in column with D characteristic
    for i=1:row
        tempDSinfo(i, 1) = epochs(i, 2)-epochs(i, 1)+1; 
    end
    
    % Calculate S
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
    
    % filtering out values of D greater than 62
    DSindividualSingal = zeros(length(tempDSinfo), 2);
    count = 1;
    for i=1:length(tempDSinfo)
        if (tempDSinfo(i, 1) < 62)
            DSindividualSignal(count,:) = tempDSinfo(i,:);
            count = count+1;
        end
    end
    count = count-1;   
    maxLength(signalIndex) = length(DSindividualSignal);
    
    DSinfo = horzcat(DSinfo, DSindividualSignal);
    
end


DSinfo_Trucks_Horizontal = DSinfo(:,2:65);