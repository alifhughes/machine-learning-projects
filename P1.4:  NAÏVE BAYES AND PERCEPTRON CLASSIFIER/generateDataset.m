function generateDataset

    % number of datapoints - dont use too many samples points of computation % will be excessive!
    trainingSamples = 1000;
    testingSamples = 100000;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
    % Generate 2-cluster Gaussian datasets
    [trainingData, trainingTarget] = GenerateGaussianData(trainingSamples);
    [testingData, testingTarget] = GenerateGaussianData(testingSamples);

    figure;
    
    % Plot the data dimension against eachother to get a 2D scatter plot
    % for data set 1
    gscatter(trainingData(1, :), trainingData(2, :), {trainingTarget(1, :), trainingTarget(2, :)}, 'br','..');

    % Format the graph
    title('2D raw data plot');
    xlabel('y-value');
    ylabel('x-value');
    legend('class 1', 'class 2');
     
end

