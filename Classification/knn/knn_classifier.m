clear;

%% Selecting Feature Vector
% Uncomment to select feature to be classified.
disp('New Feature')
% FFT based FV
%
% filename = '../FV_CSV/FFT/FFT_avg/csv_FFT_avg.csv';
% filename = '../FV_CSV/FFT/FFT_mean_32/csv_FFT_mean_32.csv';
% filename = '../FV_CSV/FFT/FFT_mean_64/csv_FFT_mean_64.csv';
% filename = '../FV_CSV/FFT/FFT_mean_128/csv_FFT_mean_128.csv';
%
% PSD based FV
% filename = '../FV_CSV/PSD/PSD40/csv_psd40.csv';
% filename = '../FV_CSV/PSD/PSD100/csv_psd100.csv';
% filename = '../FV_CSV/PSD/PSD400/csv_psd400.csv';
% 
% TESPAR based FV
 filename = '../FV_CSV/TESPAR/C1/csv_TESPAR_C1.csv';
% filename = '../FV_CSV/TESPAR/SOM/csv_TESPAR_SOM.csv';
% 
% WPT based FV
% filename = '../FV_CSV/WPT/WPT16/wpt16.csv';
% filename = '../FV_CSV/WPT/WPT32/wpt32.csv';
% filename = '../FV_CSV/WPT/WPT64/wpt64.csv';
% filename = '../FV_CSV/WPT/WPT128/wpt128.csv';
% filename = '../FV_CSV/WPT/WPT256/wpt256.csv';
% filename = '../FV_CSV/WPT/WPT512/wpt512.csv';

%% Reading Data

data = csvread(filename);
[rows, columns] = size(data); 

fv = data(2:rows, 1:columns-1);
classes = data(2:rows,columns);

%% K-NN Classification
results = zeros(1,5);

% k = 1 
sum_k1 = 0;
for i=1:10
    
    knn_Mdl = fitcknn(fv, classes, 'NumNeighbors', 11, 'Standardize', 1, 'Distance', 'euclidean');
    CVKNNMdl = crossval(knn_Mdl);
    classError = kfoldLoss(CVKNNMdl);
    
    sum_k1 = sum_k1 + (1-classError);
    
end

rate_k1 = sum_k1 / 10
results(1) = rate_k1;

% k = 3 
sum_k3 = 0;
for i=1:10
    
    knn_Mdl = fitcknn(fv, classes, 'NumNeighbors', 13, 'Standardize', 1, 'Distance', 'euclidean');
    CVKNNMdl = crossval(knn_Mdl);
    classError = kfoldLoss(CVKNNMdl);
    
    sum_k3 = sum_k3 + (1-classError);
    
end

rate_k3 = sum_k3 / 10
results(2) = rate_k3;
%k = 5 
sum_k5 = 0;
for i=1:10
    
    knn_Mdl = fitcknn(fv, classes, 'NumNeighbors', 15, 'Standardize', 1, 'Distance', 'euclidean');
    CVKNNMdl = crossval(knn_Mdl);
    classError = kfoldLoss(CVKNNMdl);
    
    sum_k5 = sum_k5 + (1-classError);
    
end

rate_k5 = sum_k5 / 10
results(3) = rate_k5;
% k = 7 
sum_k7 = 0;
for i=1:10
    
    knn_Mdl = fitcknn(fv, classes, 'NumNeighbors', 17, 'Standardize', 1, 'Distance', 'euclidean');
    CVKNNMdl = crossval(knn_Mdl);
    classError = kfoldLoss(CVKNNMdl);
    
    sum_k7 = sum_k7 + (1-classError);
    
end

rate_k7 = sum_k7 / 10
results(4) = rate_k7;

% k = 1 MANHATTAN DISTANCE 
% sum_k1_c = 0;
% for i=1:10
%     
%     knn_Mdl = fitcknn(fv, classes, 'NumNeighbors', 3, 'Standardize', 1, 'Distance', 'cityblock');
%     CVKNNMdl = crossval(knn_Mdl);
%     classError = kfoldLoss(CVKNNMdl);
%     
%     sum_k1_c = sum_k1_c + (1-classError);
%     
% end
% 
% rateCityblock_k1 = sum_k1_c / 10
% results(5) = rateCityblock_k1;


