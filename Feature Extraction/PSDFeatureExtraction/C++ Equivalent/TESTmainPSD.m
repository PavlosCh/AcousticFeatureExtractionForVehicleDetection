%% Receiving Signal
clear;

%read data into array from txt file
filename = '../data.csv';
dataReduced = csvread(filename);

x = 1:1:length(dataReduced);
% sound(dataReduced,5000)

%% Performing PSD
Fs = 5000;
N = length(dataReduced);
xdft = fft(dataReduced, 512);

%%

xdft = xdft(1:N/2+1);

psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1); % multiplying by 2 maintain total energy
freq = 0:Fs/length(dataReduced):Fs/2;

plot(freq(2:end), psdx(2:end));

psdxFV400 = psdx(2:401); %characterising power in frequencies 0-640

% will take average of every non-overlapping 4 adjacent spectral bins
psdxFV100 = zeros(100, 1);
for i=0:99
    sum = 0;
    startingPoint = (i*4);
    for j=1:4
        sum = sum + psdxFV400(startingPoint+j);
    end
    psdxFV100(i+1) = sum/4; 
end

% will take average of every non-overlapping 10 adjacent spectral bins

psdxFV4010 = zeros(10, 40);
index = 1;
for i=1:40
    for j=1:10
        psdxFV4010(j, i) = psdxFV400(index);
        index = index+1;
    end
end
psdxFV40 = mean(psdxFV4010);

