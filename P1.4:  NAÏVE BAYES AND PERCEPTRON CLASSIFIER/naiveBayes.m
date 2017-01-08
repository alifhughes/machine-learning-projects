function naiveBayes

    % Generate the gaussain data
    [trainingData, trainingTarget] = GenerateGaussianData(10000);
    [testingData, testingTarget] = GenerateGaussianData(10000);
    
    % Initiate empty classes for each gaussian data set
    class0 = [];
    class1 = [];

    % Iterate all training data columns
    for i = 1:length(trainingData)
        
        % Check this iterations first row value
        if trainingTarget(1,i) == 1
            % Is one, belongs to class 0
            class0 = [class0 trainingData(:,i)];
        else
            % Is 0, belongs to class 1
            class1 = [class1 trainingData(:,i)];
        end

    end
    
    % Get the mean of class 0's attributes
    meanOfClass0AtrA = mean(class0(1,:));
    meanOfClass0AtrB = mean(class0(2,:));
    
    % Get the variance of class 0's attributes
    varOfClass0AtrA = var(class0(1,:));
    varOfClass0AtrB = var(class0(2,:));
    
    % Get the mean of class 1's attributes
    meanOfClass1AtrA = mean(class1(1,:));
    meanOfClass1AtrB = mean(class1(2,:));
    
    % Get the variance of class 1's attributes
    varOfClass1AtrA = var(class1(1,:));
    varOfClass1AtrB = var(class1(2,:));
   
    % Create empty classes for the test data to fall into
    classTest0 = [];
    classTest1 = [];
    
    % Iterate all columns of the testing data
    for i = 1:length(testingData)
        
        % Get the data element for testing
        data = testingData(:, i);
        
        % Get atr A and atr B
        atrA = data(1, :);
        atrB = data(2, :);
        
        % Get the prob of atr A given class0 and atr B given class0
        probClass0AtrA = (atrA - meanOfClass0AtrA) ^ 2 / varOfClass0AtrA;
        probClass0AtrB = (atrB - meanOfClass0AtrB) ^ 2 / varOfClass0AtrB;
        
        % Get the prob of atr A given class1 and atr B given class1
        probClass1AtrA = (atrA - meanOfClass1AtrA) ^ 2 / varOfClass1AtrA;
        probClass1AtrB = (atrB - meanOfClass1AtrB) ^ 2 / varOfClass1AtrB;
        
        % Get prob of x given class 0 and x given class1 using the 
        % conditional independance assumption
        probClass0 = probClass0AtrA * probClass0AtrB;
        probClass1 = probClass1AtrA * probClass1AtrB;
        
        % Apply naive bayes classifier
        P0 = (probClass0 * 0.5) / (probClass0 * 0.5) + (probClass1 * 0.5);
        P1 = (probClass1 * 0.5) / (probClass1 * 0.5) + (probClass0 * 0.5);
        
        % If class 0 given x is higher than class1 given x then it is in
        % class 0, else it is in class 1
        if (P0 > P1)
             classTest0 = [classTest0 testingData(:, i)];
        else
             classTest1 = [classTest1 testingData(:, i)];
        end
        
    end
    
    % Plot the graph
    figure
    hold on
    plot(classTest0(1,:), classTest0(2,:), 'ro');
    plot(classTest1(1,:), classTest1(2,:), 'b+');
    xlabel('x-dimension');
    ylabel('y-dimension');
    title('Ploting class0 in red and class1 in blue');
    
end

