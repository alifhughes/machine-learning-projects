function defaultTwoDimensionalDistribution

    % Initialise the sample size
    sampleSize = 10000;

    % Initialise the standard deviation
    standardDeviation = 1;

    % Intialise the mean
    mean = 0;

    % Intialise the samples
    samples = standardDeviation.*randn(2,sampleSize) + mean;

    % Display the size of the samples
    disp(size(samples));    
        
    % Create the size of the cirlces to be plotted
    circleSize = 20;

    % Plot the data dimension against eachother to get a 2D scatter plot
    scatter(samples(1, :), samples(2, :), circleSize, 'b', 'filled');
    
    % Format the graph
    title('Uniform 2D raw data plot');
    xlabel('y-value');
    ylabel('x-value');
    xlim([-10 10]);
    ylim([-10 10]);
    
end

