function [w1, w2, v, train_error, val_error] = bonus_training(X, Y, X_val, Y_val, num_epoch, learn_rate, batch_size, dropout)

% (Bonus Question)
% implementing tanh(x) activation function

[N,D,Hidden_layer_1,Hidden_layer_2,w1,w2,v,X1] = initialization(X);

for epoch = 1:num_epoch
    % Deciding nodes to dropout in each batch
    rand1 = randperm(D)+1;
    rand2 = randperm(Hidden_layer_1)+1;
    rand3 = randperm(64)+1;
    dropout_X = rand1(1:round(dropout(1,1)*(D)));
    dropout_Z1 = rand2(1:round(dropout(1,2)*(Hidden_layer_1)));
    dropout_Z2 = rand3(1:round(dropout(1,3)*(Hidden_layer_2)));
    
    for n = 1:batch_size:N
        %% forward pass 
        
        E = min(N, n+batch_size-1);
        siz = E - n + 1;
        X_train = X1(n:E, :);
        % Dropout from input layer
        X_train(:,dropout_X) = 0;
        
        % Hidden Layer 1
        
        z = X_train * w1;
        Z1 = tanh(z);
        % Adding bias term to Z1
        Z1 = [ones(size(Z1,1),1) Z1];
        % Dropout from Hidden Layer 1
        Z1(:,dropout_Z1) = 0;
        
        % Hidden Layer 2
        
        z = Z1 * w2;
        Z2 = tanh(z);
        % Adding bias term to hidden layer 2
        Z2 = [ones(size(Z2,1),1) Z2];
        % Dropout from Hidden Layer 2
        Z2(:,dropout_Z2) = 0;
        
        % Hidden to Output layer
        O = Z2 * v;
        
        %% backward pass 
        delta1 = O - Y(n:E, : );
        % Updating weight
        v = v - (learn_rate/siz)*Z2'*delta1;
        
        
        % hidden layer unit 2
        
        delta2 = delta1 * v' .* Z2 .* (1-Z2);
        delta2 = delta2(:, 2:size(delta2,2));
        % Updating weight
        w2 = w2 - (learn_rate/siz)*Z1'*delta2;
        
        % hidden layer unit 1
        
        % Computing gradient
        delta3 = delta2 * w2' .* Z1 .* (1-Z1);
        delta3 = delta3(:, 2:size(delta3,2));
        % Updating weight
        w1 = w1 - (learn_rate/siz)*X_train'*delta3;
    end
    
    %% Computing expected outputs for training & validation sets
    y1 = bonus_testing(X, w1, w2, v, dropout);
    y2 = bonus_testing(X_val, w1, w2, v, dropout);
    
    %% Computing the training and validation error
    train_error(epoch) = sum((Y - y1).^2)*.8/size(Y,1);
    val_error(epoch) = sum((Y_val - y2).^2)*.8/size(Y_val,1);
    
    % displaying error after each epoch
    disp(sprintf('training error after epoch %d: %f\n',epoch,...
        train_error(epoch)));
    disp(sprintf('validation error after epoch %d: %f\n',epoch,...
        val_error(epoch)));
end
 
end

