load('signal_for_first_plot.mat');

%% Fixing y, x vectors
Fs = 5000;

% x = 0:length(y_values):length(y_values)/Fs;
x=linspace(0,length(y)/Fs,length(y));

%% Cleaning
y = y - sum(y)/length(y);

%% Plotting
figure;
subplot(2, 1, 1)
plot(x, y)
title('Acoustic Signal Recorded From a Car', 'FontSize', 15)
xlabel('Time (s)')
ylabel('Normalised Amplitude')
line([1.65 1.65], [-0.5 0.5], 'Color','red','LineStyle','--')
line([1.65+(3072/Fs) 1.65+(3072/Fs)], [-0.5 0.5], 'Color','red','LineStyle','--')

y_filtered = zeros(1, 20000);
y_filtered(8250:8250+3072) = y(8250:8250+3072);
subplot(2,1,2)
plot(x, y_filtered)
title('Frame of Acoustic Signal Kept For Processing', 'FontSize', 15)
xlabel('Time (s)')
ylabel('Normalised Amplitude')
line([1.65 1.65], [-0.5 0.5], 'Color','red','LineStyle','--')
line([1.65+(3072/Fs) 1.65+(3072/Fs)], [-0.5 0.5], 'Color','red','LineStyle','--')
% 
% y_sliced = y(8250:8250+3072);
% x_sliced=linspace(0,length(y_sliced)/Fs,length(y_sliced));
% subplot(3,1,3)
% plot(x_sliced, y_sliced)
% title('Signal Used For Data Processing')
% xlabel('Time (s)')
% ylabel('Amplitude')
% line([0 0], [-0.5 0.5], 'Color','red','LineStyle','--')
% line([(3072/Fs) (3072/Fs)], [-0.5 0.5], 'Color','red','LineStyle','--')
