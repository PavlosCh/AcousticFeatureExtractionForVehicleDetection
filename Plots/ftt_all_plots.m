%%
% load('fft_allcars_11.mat');
% load('filtered_cars.mat');
load('fft_all_trucks.mat')
[long, total] = size(y_filtered);
%y_filtered = [];

%% Load Signal, Getting Data
%y_filtered = zeros(1, 3072);

%load('fft_allcars_11.mat');
%y_filtered = y(8250:8250+3071);

Fs = 5000;

% x = 0:length(y_values):length(y_values)/Fs;
x=linspace(0,length(y_filtered)/Fs,length(y_filtered));

%% Information for Frequency Domain Plot

Fs = 5000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 3072;             % Length of signal
t = (0:L-1)*T;        % Time vector

%% Plotting Frequency Domain
all_fft = zeros(1537, total);
for i=1:total
    sumBeforeRemove = sum(y_filtered(:,i));
    y_removed_bias = y_filtered(:,i) - (1/3072)*sumBeforeRemove;
    Y = fft(y_removed_bias);
    
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    all_fft(:, i) = P1;
    
    f = Fs*(0:(L/2))/L;
    
    %plot(f,P1)
    %title('Frequency domain of car signal', 'FontSize', 15)
    %xlabel('f (Hz)')
    %ylabel('Magnitude')
    %xlim([0 1500])
end
figure;
plot(f, all_fft);
grid on;
xlabel('f (Hz)')
ylabel('Magnitude')
%% Plotting on same graph

% figure;
% subplot(2, 1, 1)
% plot(x, y_filtered);
% %title('Time domain of a car signal', 'FontSize', 15)
% xlabel('Time (s)')
% ylabel('Normalized Amplitude')
% xlim([0 0.62])
% 
% subplot(2, 1, 2)
% plot(f,P1) 
% %title('Frequency domain of car signal', 'FontSize', 15)
% xlabel('f (Hz)')
% ylabel('Magnitude')
% xlim([00 1500])
