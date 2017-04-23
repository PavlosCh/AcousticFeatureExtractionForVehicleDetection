load('../Data/YourDataName.mat');
size = 21;
MeanDataSet = zeros(size, 6);
%% Preprocessing
for rawSignalIndex = 1:size
    dataReduced = YourDataName(:, rawSignalIndex);
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
    
    check = fftData;
    
    hammingWindow = hamming(512);
    for col=1:fftFrames
        fftData(:, col) = hammingWindow.*fftData(:, col);
    end
    
    
    % Get single sided fft
    singleFFT = fftData;
    singleFFT = singleFFT(1:256, :);
    
    featureVectorMean = mean(singleFFT);
    
    MeanDataSet(rawSignalIndex, :) = featureVectorMean;
end
