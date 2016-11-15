function fittedNoisyLine

    % Initialise samples
    samples = 100;
    
    % Initialise standard deviation and mean
    standardDeviation = 1;
    mean = 0;
    
    % Create noise samples for the data
    noise = standardDeviation.*randn(1, samples) + mean;
    
    % Initialise the m value
    m = 1.6;
    
    % Initialise the C value
    C = 6;

    % Sample x
    x = linspace(-4, 6);

    % Generate the line
    y = (m * x + C) + noise;

    % Initialise figure
    figure;

    % Plot the line
    plot(x, y, '.-');
    
    hold on;
    
    % Get the fitted values for this noisy line
    [fittedXValues, fittedYValues] = firstPrincipleLinearRegression();
    
    % Plot them against each other
    plot(fittedXValues, fittedYValues);
    title('dataNormal raw data plot');
    xlabel('Data point number');
    ylabel('Data point value');
    legend('raw data', 'fitted data');
    
end

