y = []
%%
y_trucks = []
%% Fixing y, x vectors
% x = 0:length(y_values):length(y_values)/Fs;
x=linspace(0,1000,100);

%%

figure;
plot(x, y);
grid on;
xlabel('Frequency (Hz)')
ylabel('Power Magnitude')

figure;
plot(x, y_trucks);
grid on;
xlabel('Frequency (Hz)')
ylabel('Power Magnitude')

% for i=1:103
%     figure;
% 	plot(x, y(i,:))
%     
%     title(['Car: ' num2str(i)])
% end
% 
% %65, 4, 72, 69, 103, 18, 13!
% 
% 
% for i=104:135
%     figure;
% 	plot(x, y(i,:))
%     title(['Truck: ' num2str(i)])
% end