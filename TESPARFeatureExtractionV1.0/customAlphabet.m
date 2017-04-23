clear;

%% Load D/S Matrices
load('Data/DSmatrix_Train_Cars.mat');
CarDSmatrix = DSmatrix;

load('Data/DSmatrix_Train_Trucks.mat');
TruckDSmatrix = DSmatrix;

clear DSmatrix;

%% Combine & Normalise Matrices

DSdistribution = CarDSmatrix + TruckDSmatrix;

% Can't use determinant for normalisation.
% Hence will divide every element by the sum of everything
%sumOfAll = sum(sum(DSdistribution));

% DSdistributionNormalised = DSdistribution / sumOfAll;
% Normalisation has to be done by dividing all elements with most frequent
% element, not sum
M = max(DSdistribution);
maxElement = M(1);
DSdistribution = DSdistribution/maxElement;

%% Set threshold
alpha = 1/100;

% For the sake of me being able to understand numbers wont normalise but
% will take an increased alpha
%alpha = floor((1/100) * sumOfAll);
% alpha = 417;
% percentage = (alpha*100)/sumOfAll;

%% Creating alphabet from combined D/S matrix

% Applying Threshold
for i=1:62
    for j=1:6
        if (DSdistribution(i,j) < alpha)
            DSdistribution(i,j) = 0;
        end
    end
end

%% Clearing
% Removing rows with only zeros
DSmatrixThresholded = DSdistribution(1,:);

for i=2:62
    if (sum(DSdistribution(i,:)) > 0)
        DSmatrixThresholded = vertcat(DSmatrixThresholded, DSdistribution(i,:));
    end
end

preAlphabet = DSmatrixThresholded*maxElement;
% WOULD NEED TO APPLY VERTICAL FILTER TOO FOR SMAX

