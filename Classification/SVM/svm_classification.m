%% Reading Data
clear;

filename = '../FV_CSV_Matlab/FFT/FFT_mean_32/csv_FFT_mean_32.csv';
data = csvread(filename);
[rows, columns] = size(data); 

fv = data(:, 1:columns-1);
classes = data(:,columns);

%%  SVM Classification

% Linear Kernel Function0
SVMModelLinear = fitcsvm(fv, classes, 'Standardize', true, 'KernelFunction', 'linear');

CVSVMModelLinear = crossval(SVMModelLinear);

classLossLinear = kfoldLoss(CVSVMModelLinear);

classificationRateLinear = 1 - classLossLinear

% Polynomial Kernel Function

SVMModelPolynomial = fitcsvm(fv, classes, 'Standardize', true, 'KernelFunction', 'polynomial');

CVSVMModelPolynomial = crossval(SVMModelPolynomial);

classLossPolynomial = kfoldLoss(CVSVMModelPolynomial);

classificationRatePolynomial = 1 - classLossPolynomial


%% Plots Will be used later
% 
% sv = SVMModel.SupportVectors;
% figure
% gscatter(fv(:,1), fv(:,2), classes);