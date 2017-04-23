%% Loading Data
clear;

%read data into array from txt file
load('Data/Training_Car_DSinfo.mat');
carTrainingDSinfo = DS;

load('Data/Training_Trucks_DSinfo.mat');
truckTrainingDSinfo = DS;

clear DS;
allTrainDSinfo = vertcat(carTrainingDSinfo, truckTrainingDSinfo);
X = transpose(allTrainDSinfo);

%% SOM

net = selforgmap([5 5]);
[net,tr] = train(net,X);

output = net(X);

% y = net(X);
%plotsompos(net)

%% Clustering Output
neuron = zeros(1,38893);
for i=1:length(output)
    for j=1:25
        if (output(j,i) == 1)
            neuron(i) = j;
        end
    end
end

DSinfo_Symbol = vertcat(X, neuron);

%% SOM Alphabet Creation

alphabet = ones(62, 6);
alphabet = alphabet*(-1);

for j=1:38893
        Dalphabet = DSinfo_Symbol(1, j);
        Salphabet = DSinfo_Symbol(2, j)+1;
        alphabet(Dalphabet, Salphabet) = DSinfo_Symbol(3, j);
end
