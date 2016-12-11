function [data targetVec] = GenerateGaussianData(samples)
% generate 2 class Gaussian dataset
% each data vector is 2 dimensional
% there are 'samples' patterns of class 0  
% there are 'samples' patterns of class 1 
% class 0 patterns have an assosiated outout vector [1 0]'
% class 1 patterns have an assosiated outout vector [0 1]'
% data points for class0 and class1 are concatenated together
% therefore data is a matrix of 2 by 2*samples  
% target vectors for class0 and class1 are concatenated together
% therefore targetVec is a matrix of 2 by 2*samples  

% set mean and covariance for class 0
Mean1 = [4; -1;];
Sigma1 = [0.6 .8; .8 7];

% set mean and covariance for class 1
Mean2 = [-1; 1;];
Sigma2 = [0.7 .8; .8 9];


% generate Gaussian distibuted dataset for class 0
data1 =  chol(Sigma1) * randn(2, samples) + repmat(Mean1,1,samples);
% generate target vectors for class 0
label1 = repmat([1; 0;] , 1, samples);
disp(cov(data1'));

% generate Gaussian distibuted datasetn for class 1
data2 =  chol(Sigma2) * randn(2, samples) + repmat(Mean2,1,samples);
% generate target vectors for class 1
label2 = repmat([0; 1;] , 1, samples);
disp(cov(data2'));

% concatenate class0 and class1 datasets into single dataset
data = [data1 data2];
targetVec = [label1 label2];

