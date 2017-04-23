%% Once alphabet it ready, it can be loaded below, as well as the DS information
% of trucks and cars separately to produce the feature vectors.

%% Load DS info and alphabet
clear;

% Need to run all DS pairs to get pairs in appropriate format
% load DSinfo
load('Data/DSinfo_Cars_Horizontal.mat');
DSinfo = DSinfoCars; % For cars
% DSinfo = DSinfo_Trucks_Horizontal;

%load alphabet
load('Data/somAlphabet.mat');
zeroColumn = zeros(62, 1);
alphabet = somAlphabet;
% alphabet = horzcat(somAlphabet, zeroColumn); % only for custom C1

clear DSinfoCars;

%% Add symbol for every DS pair
rows = 585; % cars
% rows = 291; % trucks

samples = 103; % cars
% samples = 32; % trucks

repetitiveness = zeros(rows, samples);
stuffingColumn = ones(rows, 1);
DSinfo = horzcat(stuffingColumn, DSinfo);

for i=1:samples
    for j=1:rows
        Salphabet = DSinfo(j,i*2+1)+1;
        Dalphabet = DSinfo(j,i*2);
        if (Dalphabet>0 && Dalphabet<63)
            repetitiveness(j,i) = alphabet(Dalphabet, Salphabet);
        else
            repetitiveness(j,i) = 10000;
        end
    end
    
end

%% Getting Vector
% numberOfSymbols = 34; % for custom C1 alphabet
numberOfSymbols = 25;
featureVectors = zeros(numberOfSymbols, samples);

sorted = sort(repetitiveness);

for j=1:samples
    for element=1:numberOfSymbols
        for i=1:rows
            if (sorted(i,j) == element)
                featureVectors(element, j) = featureVectors(element, j)+1;
            end
        end
    end
end

featureVectorsCSV = transpose(featureVectors);
