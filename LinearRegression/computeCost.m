function J = computeCost(X, y, beta)

% COMPUTECOST computes the cost of using beta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
    m = length(y); % number of training examples

% You need to return the following variables correctly 
    J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of beta
%               You should set J to the cost.

    
    J_DN = 0;
    J_beta = 0;
    lambda = 0.1;
    
    for i = 1 : m
        J_DN = J_DN + (y(i) - X(i, : ) * beta)^2;
    end

    for j = 1 : length(beta)
        J_beta = J_beta + (beta(j))^2;
    end

    J = J_DN + lambda * J_beta;
    

% =========================================================================

end


