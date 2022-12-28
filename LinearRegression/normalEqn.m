function [beta] = normalEqn(X, y)

%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

   beta = zeros(size(X, 2), 1);

% ====================== YOUR CODE HERE ======================
   % Instructions: Complete the code to compute the closed form solution
   % to linear regression and put the result in beta.
   

   beta = (X.' * X)^(-1) * X.' * y;


% ============================================================

end


