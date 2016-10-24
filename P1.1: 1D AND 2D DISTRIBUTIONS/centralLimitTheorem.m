function centralLimitTheorem

    % Initialise sample size
    sampleSize = 10000;
    
    % Initialise NxN dimensional array with value range -0.5 to 0.5
    samples = -0.5 + (0.5 + 0.5) * rand(sampleSize, sampleSize);
    
    % Display the size of the array
    disp(size(samples));
    
    % Calculate mean per row
    dataMean = mean(samples);

    % Create figure
    figure;
    
    % Sub plot the first graph
    subplot(1, 2, 1);
    
    % Plot samples with blue spots
    plot(dataMean, 'b.');
    title('dataMean raw data plot');
    xlabel('Data point number');
    ylabel('Data point value');
    
    % Sub plot the second graph
    subplot(1, 2, 2);
    
    % Plot histogram with 1000 nbins
    histogram(dataMean, 1000);
    title('Mean over many datapoints histograph');
    xlabel('Data point value');
    ylabel('Data point occourences');
    xlim([-0.02 0.02]);
    
end

