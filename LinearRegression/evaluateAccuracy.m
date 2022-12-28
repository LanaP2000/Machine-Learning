function error = evaluateAccuracy(beta, X, y)

% EVALUATEACCURACY calculates the average prediction error of the learned 
% linear regression model using the testing data 

    m = length(y); % number of testing examples

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the prediction error for each testing example and
% then take the mean
    

%     SSE = 0;
% 
%     for i = 1 : m
%         SSE = SSE + ( y(i) - X(i,:)*beta )^2;
%     end
% 
%     error = SSE / (2*m);

    PredErr = (X * beta) - y;
    error = sqrt(mean(PredErr.^2));


    
% ============================================================

end


