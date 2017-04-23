%% Data

%x = [12, 32, 64, 128, 256, 512];
%x = [1, 2, 3, 4, 5, 6];

x = linspace(4,9,6);
xticks([4 5 6 7 8 9])

y_knn3 = [0.9696, 0.9741, 0.9711, 0.9756, 0.9719, 0.9637];

y_svm_linear = [0.8748, 0.9074, 0.9133, 0.8911, 0.9089, 0.9407];

y_svm_polynomial = [0.9689, 0.9459, 0.9489, 0.8437, 0.5519, 0.8741];

%% Plotting

figure; 
plot(x,y_knn3,'color','r'); hold on;
plot(x,y_svm_linear, '--b'); hold on;
xticks([4 5 6 7 8 9]); hold on;
grid on;
%title('Classification Rate against Wavelet Packet Level', 'FontSize', 15);
xlabel('Wavelet Packet Level (L)');
ylabel('Classification Rate');
legend('K-NN (K=3)','SVM (Linear Kernel)','Location','southeast')
%plot(x,y_svm_polynomial,'--m');