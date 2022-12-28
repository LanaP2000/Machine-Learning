function W = findPCs(X, K)
% This function finds the first K principle components of X

% ====================== YOUR CODE HERE ======================
% Instructions: First, compute the estimated variance of X, denoted as S
%               Second, compute eigenvalues and corresponding 
%               eigenvectors of S
%               Third, sort the eigenvalues in a descend order
%               Four, find the top K principle components with the largest
%               eigenvalues
% Hints:        try functions cov(), eig() 
%

    % 1. Find variance of X
    S = cov(X);
    % 2. Compute eigenvectors (V) eigenvalues (lambda) of S
    [V, lambda] = eig(S);
    %3. Sort eigenvalues in a descending order
    [lambda, I] = sort(diag(lambda), 'descend');
    %4. Find top K PC's, W = (p x k), i-th column of V is eigenvector
    W = V(:, I(1 : K));

% ============================================================
end
