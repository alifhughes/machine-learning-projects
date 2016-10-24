function normalProbabilityDistribution

    % Initialise sample size
    sampleSize = 10000;
    
    % Initialise 1xN dimensional array of samples
    samples = (0.5 + 0.5) * randn(1, sampleSize);

    % Display the size of the array
    disp(size(samples));
    
    % Create figure
    figure;
    
    % Sub plot the first graph
    subplot(1, 2, 1);
    
    % Plot samples with blue spots
    plot(samples, 'b.');
    title('dataNormal raw data plot');
    xlabel('Data point number');
    ylabel('Data point value');
    
    % Sub plot the second graph
    subplot(1, 2, 2);
    
    % Plot histogram with 1000 nbins
    histogram(samples, 1000);
    title('dataNormal histogram');
    xlabel('Data point value');
    ylabel('Data point occourences');
    xlim([-5 5]);

end

