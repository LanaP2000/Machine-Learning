%% SDSU Machine Learning Course (EE600/CompE596)
%% Programming Assignment:  PCA
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
%  PCA assignment. 
%
%
%  For this part of the assignment, you will need to change some
%  parts of the code below for various experiments (e.g., number of 
%  principle components K).


% Initialization
clear ; close all; clc

%% =========== Load Image =============
fprintf('Loading the image ...\n');
% read the image
img = imread('bluebird.jpeg');
% display the image
imshow(img)

% scale the pixel values so that they fall within [0,1]
img = double(img) / 255;

%% =========== Perform PCA to Compress the Image =============
% Instructions: The following code perform PCA on each color channel to 
%               reduce feature dimensions. Tune the value of K to see its impact.  
%               
fprintf('Compressing the image ...\n');

K = 187;  % number of principle components 

% find the number of RGB pixels in the image
[n, m, c] = size(img);
img_compressed = zeros(n, m, c);
for rgb = 1 : 3
    % Center the data 
    X = img(:, :, rgb) - mean(img(:, :, rgb));
    
% ====================== YOUR CODE HERE ======================
    W = findPCs(X, K);
    Xt = PCAtransform(X, W);
    X_inv = PCAtransform_inv(Xt, W);
    img_compressed(:, :, rgb) = X_inv + mean(img(:, :, rgb)); % X = Z * W' + mu
% ============================================================
end

img_compressed = uint8(img_compressed * 255);
% store the compressed image 
imwrite(img_compressed, 'bluebird_compressed.jpeg');
% display the compressed image
fprintf('Compression is done. \n');
figure;
imshow(img_compressed)


