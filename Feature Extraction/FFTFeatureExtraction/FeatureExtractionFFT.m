load('YourDataFileName.mat');

RavMedianDataSet = zeros(103, 64);
%% Preprocessing
for rawSignalIndex = 1:7
    dataReduced = YourDataFileName(:, rawSignalIndex);
    %Remove bias
    sumBeforeRemove = sum(dataReduced);
    dataReduced = dataReduced - (1/length(dataReduced))*sumBeforeRemove;
    
    fftFrames = 6;
    %Converting to 2D
    dataReduced2D = zeros(512, fftFrames);
    index = 1;
    
    for i=1:fftFrames
        for j=1:512
            dataReduced2D(j, i) = dataReduced(index);
            index = index + 1;
        end
    end
    
    %Perform fft on each column
    fftData = fft(dataReduced2D);
    fftData = abs(fftData);
    
    hammingWindow = hamming(512);
    for col=1:fftFrames
        fftData(:, col) = hammingWindow.*fftData(:, col);
    end
    
    
    % Get single sided fft
    singleFFT = fftData;
    singleFFT = singleFFT(1:256, :);
    
    normalisedFFT = zeros(256, fftFrames);
    %Normalising
    sumOfColumns = sum(singleFFT);
    for i=1:fftFrames
        for j=1:256
            normalisedFFT(j, i) = singleFFT(j, i)/sumOfColumns(i);
        end
    end
    
    %converts to 1D
    singleFFTVector = normalisedFFT(:);
    sortedFFTVector = sort(singleFFTVector);
    featureVectorMedian = sortedFFTVector(1:64);
    
    RavMedianDataSet(rawSignalIndex, :) = featureVectorMedian;
end
