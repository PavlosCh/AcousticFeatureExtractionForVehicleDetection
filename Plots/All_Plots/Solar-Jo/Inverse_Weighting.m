%% Receiving Data
x = linspace(1, 23, 12);

y_tespar = [0.9378	0.9519	0.923	0.9259	0.9259	0.9259	0.9022	0.88	0.88	0.8585	0.8459	0.8444];
y_tespar_inv = [0.9311	0.9444	0.9252	0.9274	0.9259	0.9281	0.9267	0.9141	0.9222	0.9267	0.8993	0.8881];

y_psd = [0.9785	0.9726	0.9489	0.9178	0.9015	0.8674	0.8281	0.8207	0.7993	0.7733	0.7585	0.7622];
y_psd_inv = [0.9763	0.9741	0.963	0.9593	0.9422	0.9267	0.9044	0.8793	0.8652	0.8489	0.84	0.8385];

%% TESPAR PLOT

figure;

plot(x, y_tespar, 'b'); hold on;
plot(x, y_tespar_inv, 'r'); hold on;
%set(gca,'Xtick',0:20,'XTickLabel',{'1','3','5','7','9','11','13','15','17','19','21','23'})
grid on;

xlabel('{\itk}');
ylabel('Classification Rate');
legend('TESPAR-C1 normal weighting', 'TESPAR-C1 inversely weighted')

%% PSD-40

figure;

plot(x, y_psd, 'b'); hold on;
plot(x, y_psd_inv, 'r'); hold on;
%set(gca,'Xtick',0:23,'XTickLabel',{'1','3','5','7','9','11','13','15','17','19','21','23'})
grid on;
xlabel('{\itk}');
ylabel('Classification Rate');
legend('PSD-40 normal weighting', 'PSD-40 inversely weighted')