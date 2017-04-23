%% Selecting Feature Vector
clear;
disp('PSD40')

% filename = '../FV_CSV/FFT/FFT_avg/csv_FFT_avg.csv';
% filename = '../FV_CSV/FFT/FFT_mean_32/csv_FFT_mean_32.csv';
% filename = '../FV_CSV/FFT/FFT_mean_64/csv_FFT_mean_64.csv';
% 
 filename = '../FV_CSV/PSD/PSD40/csv_psd40.csv';
% filename = '../FV_CSV/PSD/PSD100/csv_psd100.csv';
% filename = '../FV_CSV/PSD/PSD400/csv_psd400.csv';
% 
% filename = '../FV_CSV/TESPAR/C1/csv_TESPAR_C1.csv';
% filename = '../FV_CSV/TESPAR/SOM/csv_TESPAR_SOM.csv';
% 
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

%%  SVM Classification

% Polynomial Kernel Function

sumPolynomialResults = 0;

for i=1:10
    disp(i)
    SVMModelPolynomial = fitcsvm(fv, classes, 'Standardize', true, 'KernelFunction', 'polynomial');

    CVSVMModelPolynomial = crossval(SVMModelPolynomial);

    classLossPolynomial = kfoldLoss(CVSVMModelPolynomial);

    polynomialRate = 1 - classLossPolynomial;
    
    sumPolynomialResults = sumPolynomialResults + polynomialRate;

end

classificationRatePolynomial = sumPolynomialResults/10


disp('PSD100')

% filename = '../FV_CSV/FFT/FFT_avg/csv_FFT_avg.csv';
% filename = '../FV_CSV/FFT/FFT_mean_32/csv_FFT_mean_32.csv';
% filename = '../FV_CSV/FFT/FFT_mean_64/csv_FFT_mean_64.csv';
% 
% filename = '../FV_CSV/PSD/PSD40/csv_psd40.csv';
 filename = '../FV_CSV/PSD/PSD100/csv_psd100.csv';
% filename = '../FV_CSV/PSD/PSD400/csv_psd400.csv';
% 
% filename = '../FV_CSV/TESPAR/C1/csv_TESPAR_C1.csv';
% filename = '../FV_CSV/TESPAR/SOM/csv_TESPAR_SOM.csv';
% 
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

%%  SVM Classification

% Polynomial Kernel Function

sumPolynomialResults = 0;

for i=1:10
    disp(i)
    SVMModelPolynomial = fitcsvm(fv, classes, 'Standardize', true, 'KernelFunction', 'polynomial');

    CVSVMModelPolynomial = crossval(SVMModelPolynomial);

    classLossPolynomial = kfoldLoss(CVSVMModelPolynomial);

    polynomialRate = 1 - classLossPolynomial;
    
    sumPolynomialResults = sumPolynomialResults + polynomialRate;

end

classificationRatePolynomial = sumPolynomialResults/10

disp('PSD400')

% filename = '../FV_CSV/FFT/FFT_avg/csv_FFT_avg.csv';
% filename = '../FV_CSV/FFT/FFT_mean_32/csv_FFT_mean_32.csv';
% filename = '../FV_CSV/FFT/FFT_mean_64/csv_FFT_mean_64.csv';
% 
% filename = '../FV_CSV/PSD/PSD40/csv_psd40.csv';
% filename = '../FV_CSV/PSD/PSD100/csv_psd100.csv';
 filename = '../FV_CSV/PSD/PSD400/csv_psd400.csv';
% 
% filename = '../FV_CSV/TESPAR/C1/csv_TESPAR_C1.csv';
% filename = '../FV_CSV/TESPAR/SOM/csv_TESPAR_SOM.csv';
% 
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

%%  SVM Classification

% Polynomial Kernel Function

sumPolynomialResults = 0;

for i=1:10
    disp(i)
    SVMModelPolynomial = fitcsvm(fv, classes, 'Standardize', true, 'KernelFunction', 'polynomial');

    CVSVMModelPolynomial = crossval(SVMModelPolynomial);

    classLossPolynomial = kfoldLoss(CVSVMModelPolynomial);

    polynomialRate = 1 - classLossPolynomial;
    
    sumPolynomialResults = sumPolynomialResults + polynomialRate;

end

classificationRatePolynomial = sumPolynomialResults/10

disp('WPT256')

% filename = '../FV_CSV/FFT/FFT_avg/csv_FFT_avg.csv';
% filename = '../FV_CSV/FFT/FFT_mean_32/csv_FFT_mean_32.csv';
% filename = '../FV_CSV/FFT/FFT_mean_64/csv_FFT_mean_64.csv';
% 
% filename = '../FV_CSV/PSD/PSD40/csv_psd40.csv';
% filename = '../FV_CSV/PSD/PSD100/csv_psd100.csv';
% filename = '../FV_CSV/PSD/PSD400/csv_psd400.csv';
% 
% filename = '../FV_CSV/TESPAR/C1/csv_TESPAR_C1.csv';
% filename = '../FV_CSV/TESPAR/SOM/csv_TESPAR_SOM.csv';
% 
% filename = '../FV_CSV/WPT/WPT16/wpt16.csv';
% filename = '../FV_CSV/WPT/WPT32/wpt32.csv';
% filename = '../FV_CSV/WPT/WPT64/wpt64.csv';
% filename = '../FV_CSV/WPT/WPT128/wpt128.csv';
 filename = '../FV_CSV/WPT/WPT256/wpt256.csv';
% filename = '../FV_CSV/WPT/WPT512/wpt512.csv';

%% Reading Data

data = csvread(filename);
[rows, columns] = size(data); 

fv = data(2:rows, 1:columns-1);
classes = data(2:rows,columns);

%%  SVM Classification

% Polynomial Kernel Function

sumPolynomialResults = 0;

for i=1:10
    disp(i)
    SVMModelPolynomial = fitcsvm(fv, classes, 'Standardize', true, 'KernelFunction', 'polynomial');

    CVSVMModelPolynomial = crossval(SVMModelPolynomial);

    classLossPolynomial = kfoldLoss(CVSVMModelPolynomial);

    polynomialRate = 1 - classLossPolynomial;
    
    sumPolynomialResults = sumPolynomialResults + polynomialRate;

end

classificationRatePolynomial = sumPolynomialResults/10

disp('WPT 512')

% filename = '../FV_CSV/FFT/FFT_avg/csv_FFT_avg.csv';
% filename = '../FV_CSV/FFT/FFT_mean_32/csv_FFT_mean_32.csv';
% filename = '../FV_CSV/FFT/FFT_mean_64/csv_FFT_mean_64.csv';
% 
% filename = '../FV_CSV/PSD/PSD40/csv_psd40.csv';
% filename = '../FV_CSV/PSD/PSD100/csv_psd100.csv';
% filename = '../FV_CSV/PSD/PSD400/csv_psd400.csv';
% 
% filename = '../FV_CSV/TESPAR/C1/csv_TESPAR_C1.csv';
% filename = '../FV_CSV/TESPAR/SOM/csv_TESPAR_SOM.csv';
% 
% filename = '../FV_CSV/WPT/WPT16/wpt16.csv';
% filename = '../FV_CSV/WPT/WPT32/wpt32.csv';
% filename = '../FV_CSV/WPT/WPT64/wpt64.csv';
% filename = '../FV_CSV/WPT/WPT128/wpt128.csv';
% filename = '../FV_CSV/WPT/WPT256/wpt256.csv';
 filename = '../FV_CSV/WPT/WPT512/wpt512.csv';

%% Reading Data

data = csvread(filename);
[rows, columns] = size(data); 

fv = data(2:rows, 1:columns-1);
classes = data(2:rows,columns);

%%  SVM Classification

% Polynomial Kernel Function

sumPolynomialResults = 0;

for i=1:10
    disp(i)
    SVMModelPolynomial = fitcsvm(fv, classes, 'Standardize', true, 'KernelFunction', 'polynomial');

    CVSVMModelPolynomial = crossval(SVMModelPolynomial);

    classLossPolynomial = kfoldLoss(CVSVMModelPolynomial);

    polynomialRate = 1 - classLossPolynomial;
    
    sumPolynomialResults = sumPolynomialResults + polynomialRate;

end

classificationRatePolynomial = sumPolynomialResults/10