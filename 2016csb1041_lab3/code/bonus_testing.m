function [y1] = bonus_testing(X, w1, w2, v, dropout)

% (Bonus Question)
% implementing tanh(x) activation function

% extracting basic quantities :
H1 = size(w1,2);
H2 = size(w2,2);
N = size(X,1);

X = [ones(N,1) X];
X = (1 - dropout(1,1)) * X;

Z1 = zeros(N,H1);
Z2 = zeros(N,H2);

y1 = zeros(N,1);

Z1 = X * w1;
Z1 = tanh(Z1);
Z1 = [ones(N,1) Z1];
Z1 = (1 - dropout(1,2)) * Z1;
Z2 = Z1 * w2;
Z2 = tanh(Z2);
Z2 = [ones(N,1) Z2];
Z2 = (1 - dropout(1,3)) * Z2;
y1 = Z2 * v;

end

