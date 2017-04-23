%% Receiving Signal
clear;

%read data into array from txt file
filename = 'data.csv';
data = csvread(filename);

x = 1:1:length(data);
sound(data,5000)


%% Pre-processing

% 5th order LP Butterworth Filter
Wn = 1000/(5000/2); % Normalised cut-off frequency
[B, A] = butter(5, Wn, 'low'); %H(z) = B(z)/A(z) A, B are transfer function coefficients
filteredData = filter(B,A, data);

% Removal of DC component
filteredData = filteredData - mean(filteredData);
% figure;
% plot(x, filteredData); 
% grid on;

%Assuming fundamental frequency is f=40.3 Hz which gives Dmax = 62 & taking
% Smax = 5 giving:
% S = 6; D = 62;

%% Getting D, S characteristics and storing in DSinfo

% For D, need to find the time the sign changes
epochs = zeros(3072, 2);
epochs(1, 1) = 1;
row = 1;
for i = 1:length(filteredData) - 1
    if ( ((filteredData(i) > 0 || filteredData(i) == 0) && filteredData(i+1) < 0 ) || ...
          (filteredData(i) < 0 && (filteredData(i+1) > 0 || filteredData(i+1) == 0)) )
        epochs(row, 2) = i;
        row = row+1;
        epochs(row, 1) = i+1;
    end
end
epochs(row, 2) = length(filteredData); %setting end as last signal
epochs = epochs(1:row, :);
DSinfo = zeros(row, 2);

for i=1:row
    DSinfo(i, 1) = epochs(i, 2)-epochs(i, 1)+1; 
end

% For S, # of minima if positive epoch, # of maxima if negative epoch. 0 if
% none

for i = 1:row
    %create window from epoch start and finish
    epochWindow = filteredData(epochs(i, 1):epochs(i, 2));
    if (length(epochWindow) >= 3)
        if (epochWindow(1) > 0)
            epochWindow = epochWindow*(-1);
        end
        peakVector = findpeaks(epochWindow);
        DSinfo(i, 2) = length(peakVector);
    else
        DSinfo(i, 2) = 0;
    end
end

% Setting max value of S to 5
for i=1:row
    if (DSinfo(i, 2) > 5)
        DSinfo(i, 2) = 5;
    end
end


%% Getting the D/S matrix
% Prior to this need to have epochs from all the signals of car
% D-rows, S-columns 

DSmatrix = zeros(62, 6);

for i=1:255
    DSmatrix(DSinfo(i, 1), (DSinfo(i, 2)+1)) = DSmatrix(DSinfo(i, 1), (DSinfo(i, 2)+1)) + 1;
end


%% Creating alphabet from combined D/S matrix

% Applying Threshold
alpha = 1;
for i=1:62
    for j=1:6
        if (DSmatrix(i,j) <=alpha)
            DSmatrix(i,j) = 0;
        end
    end
end

% Removing rows with only zeros
DSmatrixThresholded = DSmatrix(1,:);

for i=2:62
    if (sum(DSmatrix(i,:)) > 0)
        DSmatrixThresholded = vertcat(DSmatrixThresholded, DSmatrix(i,:));
    end
end



