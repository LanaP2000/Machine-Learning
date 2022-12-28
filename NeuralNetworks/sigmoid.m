function J = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

    J = 1 ./ (1 + exp((-1) * z));

end
