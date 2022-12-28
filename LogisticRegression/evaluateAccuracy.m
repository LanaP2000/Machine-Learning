function accuracy = evaluateAccuracy(beta, X, y)
%EVALUATEACCURACY calculates the prediction accuracy of the learned 
%logistic regression model using the testing data 

num = length(y); % number of testing examples

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the percentage of accurately predicted examples 
%
%

%  PredErr = (X * beta) - y;
%  error = sqrt(mean(PredErr.^2));
%  accuracy = 100 - error;

match = zeros(num, 1);
predicted = predict(beta, X);
   
for i = 1 : num
    if y(i) == predicted(i)
        match(i) = match(i) + 1;
    end    
end

accuracy = mean(match) * 100;


% ============================================================

end
