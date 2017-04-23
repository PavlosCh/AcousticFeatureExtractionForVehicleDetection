%% Reading Data
clear;

filename = 'data.csv';
data = csvread(filename);

[N, numberOfSignals] = size(data);

%% Wavelength Packet Transform Parameters

L = 10; % number of levels
wname = 'db1';
E = 'shannon';
% wpt = wpdec(dataColumn, L, 'db1', 'shannon');
% plot(wpt)
%% Extracting Features

% FV length = 16
wptFV16 = zeros(numberOfSignals, 16);

for i=1:numberOfSignals
    wpt = wpdec(data(:, i), L, wname, E);
    indexFV = 1;
    for indexNode = 15:30
        coefficientVector = wpcoef(wpt, indexNode);
        squaredCoefVector = coefficientVector.^2;
        energy = sum(squaredCoefVector);
        wptFV16(i,indexFV) = energy;
        indexFV = indexFV + 1;
    end
end

% FV length = 32
wptFV32 = zeros(numberOfSignals, 32);

for i=1:numberOfSignals
    wpt = wpdec(data(:, i), L, wname, E);
    indexFV = 1;
    for indexNode = 31:62
        coefficientVector = wpcoef(wpt, indexNode);
        squaredCoefVector = coefficientVector.^2;
        energy = sum(squaredCoefVector);
        wptFV32(i,indexFV) = energy;
        indexFV = indexFV + 1;
    end
end

% FV length = 64
wptFV64 = zeros(numberOfSignals, 64);

for i=1:numberOfSignals
    wpt = wpdec(data(:, i), L, wname, E);
    indexFV = 1;
    for indexNode = 63:126
        coefficientVector = wpcoef(wpt, indexNode);
        squaredCoefVector = coefficientVector.^2;
        energy = sum(squaredCoefVector);
        wptFV64(i,indexFV) = energy;
        indexFV = indexFV + 1;
    end
end

% FV length = 128
wptFV128 = zeros(numberOfSignals, 128);

for i=1:numberOfSignals
    wpt = wpdec(data(:, i), L, wname, E);
    indexFV = 1;
    for indexNode = 127:254
        coefficientVector = wpcoef(wpt, indexNode);
        squaredCoefVector = coefficientVector.^2;
        energy = sum(squaredCoefVector);
        wptFV128(i,indexFV) = energy;
        indexFV = indexFV + 1;
    end
end

% FV length = 256
wptFV256 = zeros(numberOfSignals, 256);

for i=1:numberOfSignals
    wpt = wpdec(data(:, i), L, wname, E);
    indexFV = 1;
    for indexNode = 255:510
        coefficientVector = wpcoef(wpt, indexNode);
        squaredCoefVector = coefficientVector.^2;
        energy = sum(squaredCoefVector);
        wptFV256(i,indexFV) = energy;
        indexFV = indexFV + 1;
    end
end

% FV length = 512
wptFV512 = zeros(numberOfSignals, 512);

for i=1:numberOfSignals
    wpt = wpdec(data(:, i), L, wname, E);
    indexFV = 1;
    for indexNode = 511:1022
        coefficientVector = wpcoef(wpt, indexNode);
        squaredCoefVector = coefficientVector.^2;
        energy = sum(squaredCoefVector);
        wptFV512(i,indexFV) = energy;
        indexFV = indexFV + 1;
    end
end
