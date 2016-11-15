function [xPointValues, yPointValues] = firstPrincipleLinearRegression

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
    
    % Get the mean of each axis
    xAxisMean = getMean(x);
    yAxisMean = getMean(y);
    
    % Get the devaition of all points from the axis
    xAxisPointDeviations = getDeviation(xAxisMean, x);
    yAxisPointDeviations = getDeviation(yAxisMean, y);
    
    % Square the deviations for all the axis
    xAxisSquaredDeviations = squareDeviations(xAxisPointDeviations);
    
    % Multiply the deviations together
    productOfDeviations = xAxisPointDeviations.*yAxisPointDeviations;
    
    % Get the sum of both of these
    squaredDeviationsSum = sum(xAxisSquaredDeviations, 2);
    productOfDeviationsSum = sum(productOfDeviations, 2);
    
    % Get the gradient of the line
    gradient = productOfDeviationsSum / squaredDeviationsSum;

    % Get the y intersect
    yIntersect =  yAxisMean - (gradient * xAxisMean);
    
    % Create the x and y data point arrays on the calculated values
    xPointValues = -4:0.01:6;

    yPointValues = yIntersect + gradient.*xPointValues;
    
    % Plot them against each other
    plot(xPointValues, yPointValues);
    title('Calculated linear regression from first principles');
    xlabel('Data point number');
    ylabel('Data point value');
    legend('linear regression');

end

function mean = getMean(data)
    
    % Get the size of the data
    [rows, columns] = size(data);
    
    % Initiate data sum
    sum = 0.0;
    
    % Iterate all elements of data
    for i = 1:columns
        
        % Accumalate total of data
        sum = sum + data(1, i);
        
    end
    
    % Get the mean
    mean = sum / columns;
    
end

function deviations = getDeviation(mean, data)
    
    % Get the size of the data
    [rows, columns] = size(data);
    
    % Initialise array for the deviations of the data from the mean
    deviations = zeros(rows, columns);
    
    % Initialise devation
    deviation = 0;
    
    % Iterate all elements of data
    for i = 1:columns
        
        % Calculate deviation
        deviation = data(1, i) - mean;
        
        % Add this data points deviation from mean to deviations matrix
        deviations(1, i) = deviation;

    end
    
end

function deviationsSquared = squareDeviations(deviations)

     % Get the size of the data
    [rows, columns] = size(deviations);
    
    % Initialise array for the deviations of the data from the mean
    deviationsSquared = zeros(rows, columns);
    
    % Iterate all elements of data
    for i = 1:columns
        
        % Add this data points deviation from mean to deviations matrix
        deviationsSquared(1, i) = deviations(1, i) ^ 2;

    end

end
