function accuracy = evaluateAccuracy(beta1, beta2, X, y)
%EVALUATEACCURACY calculates the prediction accuracy of the learned 
%neural network model using the testing data 

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the percentage of accurately predicted examples 
%
%

[num, ~] = size(X);
match = zeros(num, 1);
predicted = predict(beta1, beta2, X);
   
for i = 1 : num
    if y(i) == predicted(i)
        match(i) = match(i) + 1;
    end    
end

accuracy = mean(match) * 100;

% ============================================================

end
