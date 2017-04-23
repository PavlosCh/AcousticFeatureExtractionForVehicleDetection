load('fft_trucks.mat')
load('fft_cars.mat');


%% Information for Frequency Domain Plot

Fs = 5000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 3072;             % Length of signal
t = (0:L-1)*T;        % Time vector

f = Fs*(0:(L/2))/L;

%% 
figure;
% subplot(1, 2, 1);
plot(f, fft_cars);
grid on;
xlabel('f (Hz)')
ylabel('Magnitude')

% subplot(1, 2, 2);
plot(f, y_trucks);
grid on;
xlabel('f (Hz)')
ylabel('Magnitude')