%% Saving Data
clear;
x = linspace(0, 13, 14);
labels =  {'7:00' '8:00' '9:00' '10:00' '11:00' '12:00' '13:00' '14:00' '15:00' '16:00' '17:00' '18:00' '19:00' '20:00'};

y_monday = [0.810	1.025	1.385	1.850	2.210	3.790	7.785	20.21	36.22	115.3	156.2	14.88	0.980	0.330];
m_error = [0.005	0.005	0.005	0.005	0.005	0.005	0.005	0.01	0.01	0.1	0.1	0.02	0.01	0.005];

y_tuesday = [0.500	0.930	1.945	3.310	1.250	3.595	3.620	2.835	39.50	12.92	1.510	1.010	0.530	0.310];
ts_error =[0.005	0.005	0.005	0.02	0.005	0.005	0.02	0.005	0.6	0.96	0.01	0.005	0.005	0.005];

y_wednesday = [0.860	1.220	2.225	5.410	5.975	6.100	5.535	19.73	37.14	191.4	215.8	7.170	0.890	0.350];
w_error =[0.005	0.005	0.005	0.01	0.155	0.02	0.005	0.15	3.42	0.1	0.3	0.03	0.01	0.01];

y_thursday = [1.005	1.165	2.085	2.495	3.145	5.005	8.695	18.56	32.24	245.3	217.0	16.79	1.585	0.355];
th_error =[0.005	0.005	0.005	0.005	0.005	0.025	0.015	0.12	0.02	0.4	0.25	1.055	0.005	0.005];

y_friday = [0.985	1.255	1.665	2.725	3.200	8.420	10.42	17.09	31.26	259.4	226.8	7.330	1.425	0.360];
fr_error =[0.005	0.005	0.005	0.005	0.005	0.02	0.02	0.01	0.04	0.7	3.9	0.01	0.025	0.005];

y_average = [0.832	1.119	1.861	3.158	3.156	5.382	7.211	15.685	35.271	164.864	163.442	9.435	1.082	0.341];

%% Plotting Monday
figure;
errorbar(x,y_monday,m_error, 'bp')
%plot(x, y_monday)
set(gca,'Xtick',0:20,'XTickLabel',{'7:00' '8:00' '9:00' '10:00' '11:00' '12:00' '13:00' '14:00' '15:00' '16:00' '17:00' '18:00' '19:00' '20:00'})
grid on;
%xticklabels(labels);
xlabel('Time (GMT +1)');
xtickangle(45);
ylabel('Current (mA)');
xlim([0 13])
ylim([0 300])
%% Plotting Tuesday
figure;
errorbar(x,y_tuesday,m_error, 'bo')
set(gca,'Xtick',0:20,'XTickLabel',{'7:00' '8:00' '9:00' '10:00' '11:00' '12:00' '13:00' '14:00' '15:00' '16:00' '17:00' '18:00' '19:00' '20:00'})
grid on;
%xticklabels(labels);
xlabel('Time (GMT +1)');
xtickangle(45);
ylabel('Current (mA)');
xlim([0 13])
ylim([0 300])

%% Plotting Wednesday
figure;
errorbar(x,y_wednesday,m_error, 'b*')
set(gca,'Xtick',0:20,'XTickLabel',{'7:00' '8:00' '9:00' '10:00' '11:00' '12:00' '13:00' '14:00' '15:00' '16:00' '17:00' '18:00' '19:00' '20:00'})
grid on;
%xticklabels(labels);
xlabel('Time (GMT +1)');
xtickangle(45);
ylabel('Current (mA)');
xlim([0 13])
ylim([0 300])
%% Plotting Thursday 
figure;
errorbar(x,y_thursday,m_error, 'bx')
set(gca,'Xtick',0:20,'XTickLabel',{'7:00' '8:00' '9:00' '10:00' '11:00' '12:00' '13:00' '14:00' '15:00' '16:00' '17:00' '18:00' '19:00' '20:00'})
grid on;
%xticklabels(labels);
xlabel('Time (GMT +1)');
xtickangle(45);
ylabel('Current (mA)');
xlim([0 13])
ylim([0 300])
%% Plotting Friday
figure;
errorbar(x,y_friday,m_error,'bd')
set(gca,'Xtick',0:20,'XTickLabel',{'7:00' '8:00' '9:00' '10:00' '11:00' '12:00' '13:00' '14:00' '15:00' '16:00' '17:00' '18:00' '19:00' '20:00'})
grid on;
%xticklabels(labels);
xlabel('Time (GMT +1)');
xtickangle(45);
ylabel('Current (mA)');
xlim([0 13])
ylim([0 300])

%% Plotting AVERAGE
figure;
plot(x,y_average, '--h');
set(gca,'Xtick',0:20,'XTickLabel',{'7:00' '8:00' '9:00' '10:00' '11:00' '12:00' '13:00' '14:00' '15:00' '16:00' '17:00' '18:00' '19:00' '20:00'})
grid on;
xlabel('Time (GMT +1)');
xtickangle(45);
ylabel('Current (mA)');
xlim([0 13])
ylim([0 300])
%% Plotting All Together.
figure;
plot(x,y_monday, 'kp'); hold on;
plot(x,y_tuesday, 'mo'); hold on;
plot(x,y_wednesday, 'c*'); hold on;
plot(x,y_thursday, 'rx'); hold on;
plot(x,y_friday,'gd'); hold on;
plot(x,y_average, '--h'); hold on;
set(gca,'Xtick',0:20,'XTickLabel',{'7:00' '8:00' '9:00' '10:00' '11:00' '12:00' '13:00' '14:00' '15:00' '16:00' '17:00' '18:00' '19:00' '20:00'})
grid on;
%xticklabels(labels);
xlabel('Time (GMT +1)');
xtickangle(45);
ylabel('Current (mA)');
xlim([0 13])
ylim([0 300])
legend('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday','Average', 'Location', 'Northwest');



