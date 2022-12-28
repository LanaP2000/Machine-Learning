function [beta1, beta2, J_history] = trainNN(X, y, beta1, beta2, alpha, num_epochs)
%TRAINNN train the neural network model using backpropagation algorithm. It
%updates the weights, beta1 and beta2 using the training examples. It also
%generates the cost computed after each epoch. 

% useful values
[n, ~] = size(X); % n is number of training examples
num_hidden = length(beta1(:,1)); % number of hidden units (bias not included)
num_output = length(beta2(:,2)); % number of output units

J_history = zeros(num_epochs,1); % 

for epoch = 1:num_epochs
% for each training example, do the following
    Jd = 0;
    for d = 1:n
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the weights beta1 and
    %               beta2. The key steps are indicated as follows
    %
    %
 
        %% Step 1: forward propagate to generate the network output
        % Input xd to the unit and compute the output od

        x = X(d, :); % xd
        
        for i = 1 : num_hidden
            Od1(i) = sigmoid(1 * beta1(i, 1) + x * beta1(i, 2 : end)');
        end

        for i = 1 : num_output
            Od2(i) = sigmoid(1 * beta2(i, 1) + Od1 * beta2(i, 2 : end)');
        end
        
        %% Step 2: for each output unit, calculate its error term
        % Recall that the number of output units is num_output

        for k = 1 : num_output
            delta_o(k) = Od2(k) * (1 - Od2(k)) * (y(d, k) - Od2(k));
        end
        
        %% Step 3: for each hidden unit, calculate its error term
        % Recall that number of hidden units is num_hidden+1
        
        for h = 1 : (num_hidden)
            for k = 1 : num_output
                delta_h(h) = Od1(h) * (1 - Od1(h)) * delta_o(k) * beta2(k, h);
            end
        end

        %% Step 4: update the weights using the error terms
        
        for i = 1 : width(beta1) % 9
            for j = 1 : height(beta1) % num_hidden
                if (j == 1)
                    beta1(j, i) = beta1(j, i) + (alpha * delta_h(1, j));
                else
                    beta1(j, i) = beta1(j, i) + (alpha * delta_h(1, j) * x(1, j - 1));
                end
                
            end
        end

        for i = 1 : width(beta2) % num_hidden + 1
            for j = 1 : height(beta2) % 1
                if (i == 1)
                    beta2(j, i) = beta2(j, i) + (alpha * delta_o(j, 1));
                else
                    beta2(j, i) = beta2(j, i) + (alpha * delta_o(j, 1) * Od1(i - 1));
                end
            end
        end
        
        %% calculate the cost per epoch

        Jd = Jd + (y(d) - Od2).^2;

    end

    J_history(epoch) = Jd/2;
    
end
