function [dataSet1Samples, dataSet2Samples] = generateDataset

    % Initialise sample size
    sampleSize = 5000;

    % Initialise first data set mean and std
    dataSet1Mean = [-4; -1];
    dataSet1Std  = 0.75;
    
    % Initialise second data set mean and std
    dataSet2Mean = [3; 4];
    dataSet2Std  = 2;
    
    % Get the samples for both X and Y data set 1
    dataSet1Samples = dataSet1Std.*randn(2, sampleSize) + dataSet1Mean;
    
    % Get the samples for both X and Y data set 2
    dataSet2Samples = dataSet2Std.*randn(2, sampleSize) + dataSet2Mean;

    
end