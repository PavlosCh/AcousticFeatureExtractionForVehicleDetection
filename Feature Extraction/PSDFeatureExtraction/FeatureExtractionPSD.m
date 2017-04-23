%% Receiving Signal
clear;

%read data into array from excelfile
filename = 'data.csv';
dataReduced = csvread(filename);

[N, numberOfSignals] = size(dataReduced);
Fs = 5000;

xdft = fft(dataReduced);


xdft = xdft(1:N/2+1,:); %only take fist half
%%
%getting PSD
absolute = abs(xdft);
psdx = (1/(Fs*N)) * abs(xdft).^2;
for i=1:numberOfSignals
    psdx(2:end-1,i) = 2*psdx(2:end-1,i);
end

freq = 0:Fs/length(dataReduced):Fs/2; %not sure what i need this for

%%
% First 400 elements represent frequencies from 0-650 Hz
psdxFV400 = psdx(2:401,:);

psdxFV100 = zeros(100, numberOfSignals);

for column=1:numberOfSignals
    for i=0:99
        sum = 0;
        startingPoint = (i*4);
        for j=1:4
            sum = sum + psdxFV400(startingPoint+j, column);
        end
        psdxFV100(i+1, column) = sum/4;
    end
end

psdxFV40 = zeros(40, numberOfSignals);
for column=1:numberOfSignals
    psdxFV4010 = zeros(10, 40);
    index = 1;
    for i=1:40
        for j=1:10
            psdxFV4010(j, i) = psdxFV400(index, column);
            index = index+1;
        end
    end
    psdxFV40column = transpose(mean(psdxFV4010));
    psdxFV40(:,column) = psdxFV40column;
end

FV100 = transpose(psdxFV100);
FV400 = transpose(psdxFV400);
FV40 = transpose(psdxFV40);
