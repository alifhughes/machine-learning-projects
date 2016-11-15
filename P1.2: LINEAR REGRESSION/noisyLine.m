function noisyLine

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

    % Plot the line
    plot(x, y, '.-');
    title('raw data plot');
    xlabel('Data point number');
    ylabel('Data point value');
    legend('raw data');

end

