function uniformProbabilityDistribution

    % Initialise sample size
    sampleSize = 10000;
    
    % Initialise 1xN dimensional array with value range -0.5 to 0.5
    samples = -0.5 + (0.5 + 0.5) * rand(1, sampleSize);
    
    % Display the size of the array
    disp(size(samples));
    
    % Create figure
    figure;
    
    % Sub plot the first graph
    subplot(1, 2, 1);
    
    % Plot samples with blue spots
    plot(samples, 'b.');
    title('dataUniform raw data plot');
    xlabel('Data point number');
    ylabel('Data point value');
    
    % Sub plot the second graph
    subplot(1, 2, 2);

    % Plot histogram with 1000 nbins
    histogram(samples, 1000);
    title('dataUniform histograph');
    xlabel('Data point value');
    ylabel('Data point occourences');
    xlim([-0.5 0.5]);

end
