%% Reading Data
%Need to change to clean data for Matlab requirements

% filename = '../FV_CSV_Matlab/FFT/FFT_avg/csv_FFT_avg.csv';
filename = '../FV_CSV/FFT/FFT_mean_256/csv_FFT_mean_256.csv';
data = csvread(filename);
[rows, columns] = size(data);

fv = data(:, 1:columns-1);
classes = data(:,columns);

%% Applying KNN Classifier

knn_Mdl = fitcknn(fv, classes, 'NumNeighbors', 3, 'Standardize', 1, 'Distance', 'euclidean');

% cross validate model

CVKNNMdl = crossval(knn_Mdl);
classError = kfoldLoss(CVKNNMdl);

ans = 1-classError
