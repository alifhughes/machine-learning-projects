function qTable = initQ()

    % Initialise the upper and lower bound of the range
    lowerBound = 0.01;
    upperBound = 0.1;

    % Get a number between 0.01 and 0.1
    qTable = (upperBound - lowerBound).*rand(11, 4) + lowerBound;

end

