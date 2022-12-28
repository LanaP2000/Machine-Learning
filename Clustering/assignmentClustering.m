%% SDSU Machine Learning Course (EE600/CompE596)
%% Programming Assignment:  K-Means Clustering 
%
%  Instructions
%  ------------
% 
%  Dataset comes from: 
%   https://leafyplace.com/types-of-birds/
% 
%
% 
%  This file contains code that helps you get started on the
%  k-means clustering assignment. 
%
%
%  For this part of the assignment, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  the number of clusters).


% Initialization
clear ; close all; clc

%% =========== Load Image =============
fprintf('Loading the image ...\n');
% read the image
img = imread('bluebird.jpeg');
% display the image
imshow(img)

%% =========== Cluster Pixels with K-means =============
% Instructions: The following code cluster the data points (pixels) into K 
%               clusters. Tune the value of K to see its impact.  
%
%               Procedure: 
%               Step 1: Initilize the centroids
%               Step 2: Iterate steps 2a-2b until convergence (iterate for a certain number of iterations)
%                   Step 2a: Assign each pixel into the cluster with centroid closest to it
%                   Step 2b: Update the centroids 

fprintf('Compressing the image ...\n');
K = 23375;  % number of clusters 
% ====================== YOUR CODE HERE ======================

% STEP 1

% display the image
imshow(img)

% scale the pixel values so that they fall within [0,1]
img = double(img) / 255;
img_size = size(img);
X = reshape(img, img_size(1) * img_size(2), 3);

% choose K random centroids, aka INITIALIZE CENTROIDS
rand = randperm(size(X, 1));
c = X(rand(1 : K), :);
    

%STEP 2a, aka FIND CLOSEST CENTROIDS
m = size(X, 1);
closest = zeros(size(X, 1), 1);

num_iters = 10;

for n = 1 : num_iters
    for j = 1 : m
        distance = zeros(1, K);
        for i = 1 : K
            distance(1, i) = sqrt(sum(power((X(j, :) - c(i, :)), 2)));
        end
        [~, closest] = min(distance);
        d(j, 1) = closest;
    end

    % STEP 2b, aka UPDATE CENTROIDS
    for i = 1 : K
        d(i) = mean(d == i, 1);
    end
end

% Verify closest centroids
for j = 1 : m
    distance = zeros(1, K);
    for i = 1 : K
        distance(1, i) = sqrt(sum(power((X(j, :) - c(i, :)), 2)));
    end
    [~, closest] = min(distance);
    d(j, 1) = closest;
end


% ============================================================
% Plot a graph that shows the change of SSE (Sum of Squared Error) as a way
% to check convergence
figure;
% ====================== YOUR CODE HERE ======================

SSE = zeros(K);
for j = 1 : m
    for i = 1 : K
        SSE(i) = sum(sum((d(j, 1) - X(j, :)) .^ 2, 2));
    end
end

plot(mean(SSE), 'LineWidth', 2);
xlabel('K'); ylabel('SSE');

% ============================================================



%% =========== Construct the Compressed Image ================
% Instructions: The following code construct and display the compressed image.
%               Hint: pixels within the same cluster have the same value as
%               the cluster centroid.  
%
% 
% ====================== YOUR CODE HERE ======================

X_compressed = c(d, :);
X_compressed = reshape(X_compressed, img_size(1), img_size(2), 3);

img_compressed = uint8(X_compressed * 255);

% ============================================================

% store the compressed image 
imwrite(img_compressed, 'bluebird_compressed.jpeg');
% display the compressed image
fprintf('Compression is done. \n');
figure;
imshow(img_compressed)







