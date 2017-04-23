clear;

load iris_dataset
inputs = irisInputs;

dimension1 = 10;
dimension2 = 10;
net = selforgmap([dimension1 dimension2]);

[net,tr] = train(net,inputs);

outputs = net(inputs);