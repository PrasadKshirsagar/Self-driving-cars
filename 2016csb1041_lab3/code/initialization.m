function [N,D,Hidden_layer_1,Hidden_layer_2,w1,w2,v,X1] = initialization(X)

% extracting basic quantities :
Hidden_layer_1 = 512;
Hidden_layer_2 = 64;
D = size(X,2); 
N = size(X,1);

% weights for the connections between different layers
% random values from the interval [-0.01 0.01]

% w1 : (D+1) x Hidden_layer_1
w1 = (0.02)*rand(Hidden_layer_1,D);
w1 = w1 - 0.01;

% w2 : (Hidden_layer_1+1) x Hidden_layer_2 matrix
w2 = (0.02)*rand(Hidden_layer_2,Hidden_layer_1);
w2 = w2 - 0.01;

% v : (Hidden_layer_2+1) x 1 matrix
v = (0.02)*rand(1,Hidden_layer_2);
v = v - 0.01;


w1 = [zeros(Hidden_layer_1,1) w1];
w1 = w1';
w2 = [zeros(Hidden_layer_2,1) w2];
w2 = w2';
v = [zeros(1,1) v];
v = v';

% Adding bias term X0 = 1 to the input matrix
X1 = [ones(N,1) X];


end

