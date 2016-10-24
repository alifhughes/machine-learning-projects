function normalDistributionParameters
    
    % Initialise sample size
    sampleSize = 10000;
    
    % Initialise 1xN dimensional array of samples
    samples = randn(1, sampleSize);

    % Display the size of the array
    disp(size(samples));
  
    % Get the estimated mean and standard deviation of the data
    [dataMean, dataStandardDeviation] = normfit(samples);
        
    % Set the limits
    xAxisLimit = [-5: .1:5];

    % Get the probability density function for each value of x with the
    % estimated parameters
    norm = normpdf(xAxisLimit, dataMean, dataStandardDeviation);
    
    % Scale the data
    norm = norm / 11;

    % Plot the estimated guassian distribution
    plot(xAxisLimit, norm, 'color', 'r');
    
    % Get count of occourances and centres of each bin
    [occourences, centres] = hist(samples, 50);
    
    % Scale the occourances
    occourences = occourences / 17000;
    
    % Get the line
    histogramLine = line(centres, occourences);
    
    % Add labels to graph
    title('Estimated Gussian curve');
    xlabel('Data point occourence');
    ylabel('Data point value');
    legend('fitted', 'Normalised distribution histogram');
    
end