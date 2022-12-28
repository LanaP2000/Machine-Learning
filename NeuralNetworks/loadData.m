function [X_train, y_train, X_test, y_test] = loadData()
%   LOADDATA imports data downloaded from 
%   http://networkrepository.com/pima-indians-diabetes.php
%   and splits the dataset into two sets: training set and testing set
%

 % ====================== YOUR CODE HERE ======================
    % Instructions: Import spreadsheets data, extract the first
    % 8 columns and store them as X. Extract the last column and 
    % store it as y. 
    %
    % Randomly pick 70% of the data examples as the training set and the 
    % the rest as the testing set
    %
    % Hint: You might find the 'readtable' and 'table2array' functions useful.
    %

    Data = readtable('pima-indians-diabetes.csv', 'PreserveVariableNames', true); % Read table and store everything in Data
    X = table2array(Data( : , 1 : 8)); % Store all input columns into X
    y = table2array(Data( : , 9)); % Store the last column into y
 
    % Split dataset into X_train and X_test
    [rows_X, ~] = size(X); % Unused cols_X replaced by ~
    set_X = randperm(rows_X);
    X_train = X(set_X(1 : round(0.7 * rows_X)), : ); % 70% for training
    X_test = X(set_X(round(0.7 * rows_X) + 1 : end), : ); % remaining for testing

     % Split dataset into y_train and y_test
    [rows_y, ~] = size(y); % Unused cols_X replaced by ~
    set_y = randperm(rows_y);
    y_train = y(set_y(1 : round(0.7 * rows_y)), : ); % 70% for training
    y_test = y(set_y(round(0.7 * rows_y) + 1 : end), : ); % remaining for testing
    
% ============================================================
end
