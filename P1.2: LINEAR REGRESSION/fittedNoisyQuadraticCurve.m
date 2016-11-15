function fittedNoisyQuadraticCurve

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
    y = ((A * x.^2) + (B * x) + C) + noise;

    figure;
    
    % Plot the line
    plot(x, y, '.-');
    
    hold on;
    
    % Create vector of ones combined with X values
    X = [ones(1, length(x)); x];
    
    % Generate a linear basis for the regress function
    XLin = [X; ones(1, samples)];
    
    % Get the beta value
    betaLin = regress(y', XLin');
    
    % Get the fitted line for y
    yFittedLin = betaLin(1) + x*betaLin(2);

    % Generate a quadratic basis for the regress function
    quad = [X .* X; X; ones(1, samples)];
    
    % Get the beta value
    betaQuad = regress(y', quad');
    
    % Get the fitted line for y
    yFittedQuad = betaQuad(1) + ((x.^2)*betaQuad(2)) + betaQuad(3) + betaQuad(4);

    plot(x, yFittedLin);
    
    hold on;
    
    plot(x, yFittedQuad);
    
    title('dataNormal raw data plot');
    xlabel('Data point number');
    ylabel('Data point value');
    legend('raw data', 'fitted lin data', 'fitted quad data');

end

