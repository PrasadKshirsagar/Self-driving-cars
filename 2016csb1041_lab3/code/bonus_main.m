% (Bonus Question)
% implementing tanh(x) activation function

close all;
clear all;
clc;

[X,Y] = extract();

% Standardizing the image data
X = (X - meshgrid(mean(X),1:size(X,1)))./meshgrid(std(X),1:size(X,1));   

order = randperm(size(X,1));
X = X(order,:);
Y = Y(order,:);

partition = round(0.8*size(X,1));

% Data partitioned into training
X_train = X(1:partition,:);
Y_train = Y(1:partition,:);

% Data partitioned into validation
X_val = X(partition+1:size(X,1),:);
Y_val = Y(partition+1:size(Y,1),:);



prompt = 'Enter the number of trainig epochs (ex: 1000) - ';
num_epoch = input(prompt);

prompt = 'Enter mini batch size (ex: 64) -';
batch_size = input(prompt);

prompt = 'Enter the learning rate (ex: 0.01) - ';
learn_rate = input(prompt);

prompt = 'Enter dropout for Layer 1 (ex: 0.5) - ';
dropout(1,1) = input(prompt);
prompt = 'Enter dropout for Layer 2 (ex: 0.5)- ';
dropout(1,2) = input(prompt);
prompt = 'Enter dropout for Layer 3 (ex: 0.5)- ';
dropout(1,3) = input(prompt);


[w1, w2, v, train_error, val_error] = bonus_training(X_train, Y_train, X_val, Y_val, num_epoch, learn_rate, batch_size, dropout);
N = size(X_train,1);

% calculating iterations from epoch
iterations = N / batch_size;
fig1 = figure;
plot(1:iterations:iterations*num_epoch, train_error, 1:iterations:iterations*num_epoch, val_error);
xlabel('Number of Training iterations');
ylabel('Error');
legend('Training Set Error', 'Validation Set Error');

