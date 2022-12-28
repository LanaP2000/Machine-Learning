function [beta, J_history] = gradientDescent(X, y, beta, alpha, num_iters)

%GRADIENTDESCENT Performs gradient descent to learn beta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
    m = length(y); % number of training examples
    J_history = zeros(num_iters, 1);
    n = length(beta); % number of features

    for iter = 1 : num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               beta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
  

        for k = 1 : n
            gradient = 0;
            for i = 1 : m
                gradient = gradient + (y(i) - X(i, : ) * beta) * X(i, k);
            end
            beta(k) = beta(k) - alpha * (-2) * gradient / m;
        end


    % ============================================================

    % Save the cost J in every iteration 
    
    % ====================== YOUR CODE HERE ======================
    J_history(iter) = computeCost(X, y, beta);
  

    % ============================================================
end

end


