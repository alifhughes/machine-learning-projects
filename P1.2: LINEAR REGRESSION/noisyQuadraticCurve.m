function noisyQuadraticCurve

   % Initialise samples
    samples = 100;
    
    % Initialise standard deviation and mean
    standardDeviation = 5;
    mean = 0;
    
    % Create noise samples for the data
    noise = standardDeviation.*randn(1, samples) + mean;
    
    % Initialise the A, B and C values
    A = 1.6;
    B = 2.5;
    C = 6;
    % Sample x
    x = linspace(-4, 6);

    % Generate the line
    y = (A * x.^2 + B + C) + noise;

    % Plot the line
    plot(x, y, '.-');
    title('dataNormal raw data plot');
    xlabel('Data point number');
    ylabel('Data point value');
    legend('raw data');

end

