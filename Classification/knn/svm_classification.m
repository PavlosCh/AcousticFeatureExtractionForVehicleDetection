clear;

%% Selecting Feature Vector
% Uncomment to select feature to be classified.
disp('New Feature')
% FFT based FV
% filename = '../FV_CSV/FFT/FFT_avg/csv_FFT_avg.csv';
% filename = '../FV_CSV/FFT/FFT_mean_32/csv_FFT_mean_32.csv';
% filename = '../FV_CSV/FFT/FFT_mean_64/csv_FFT_mean_64.csv';
% filename = '../FV_CSV/FFT/FFT_mean_128/csv_FFT_mean_128.csv';
filename = '../FV_CSV/FFT/FFT_mean_256/csv_FFT_mean_256.csv';
% filename = '../FV_CSV/FFT/reducedComplexity_FFT_mean_32/2dp_Rcsv_FFT_mean_32.csv';
% filename = '../FV_CSV/FFT/reducedComplexity_FFT_mean_64/Rcsv_FFT_mean_64.csv';
% 

% PSD based FV
% filename = '../FV_CSV/PSD/PSD40/csv_psd40.csv';
% filename = '../FV_CSV/PSD/PSD100/csv_psd100.csv';
% filename = '../FV_CSV/PSD/PSD400/csv_psd400.csv';
% 
% TESPAR based FV
% filename = '../FV_CSV/TESPAR/C1/csv_TESPAR_C1.csv';
% filename = '../FV_CSV/TESPAR/SOM/csv_TESPAR_SOM.csv';
% 
% WPT based FV
% filename = '../FV_CSV/WPT/WPT16/wpt16.csv';
% filename = '../FV_CSV/WPT/WPT32/wpt32.csv';
% filename = '../FV_CSV/WPT/WPT64/wpt64.csv';
% filename = '../FV_CSV/WPT/WPT128/wpt128.csv';
%  filename = '../FV_CSV/WPT/WPT256/wpt256.csv';
% filename = '../FV_CSV/WPT/WPT512/wpt512.csv';

%% Reading Data

data = csvread(filename);
[rows, columns] = size(data); 

fv = data(2:rows, 1:columns-1);
classes = data(2:rows,columns);

%%  SVM Classification

% Linear Kernel Function
sumLinearResult = 0;
for i=1:10
    
    SVMModelLinear = fitcsvm(fv, classes, 'Standardize', true, 'KernelFunction', 'linear');

    CVSVMModelLinear = crossval(SVMModelLinear);

    classLossLinear = kfoldLoss(CVSVMModelLinear);

    linearRate = 1 - classLossLinear;
    
    sumLinearResult = sumLinearResult + linearRate;

end

classificationRateLinear = sumLinearResult/10

% Polynomial Kernel Function

sumPolynomialResults = 0;

for i=1:10
    
    SVMModelPolynomial = fitcsvm(fv, classes, 'Standardize', true, 'KernelFunction', 'polynomial');

    CVSVMModelPolynomial = crossval(SVMModelPolynomial);

    classLossPolynomial = kfoldLoss(CVSVMModelPolynomial);

    polynomialRate = 1 - classLossPolynomial;
    
    sumPolynomialResults = sumPolynomialResults + polynomialRate;

end

classificationRatePolynomial = sumPolynomialResults/10

%% Plots Will be used later
% 
% sv = SVMModel.SupportVectors;
% figure
% gscatter(fv(:,1), fv(:,2), classes);