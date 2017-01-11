function naiveBayes

    % Generate the gaussain data
    [trainingData, trainingTarget] = GenerateGaussianData(100);
    [testingData, testingTarget] = GenerateGaussianData(100000);
    
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
    
    % Get the standard deviation of class 0's attributes
    stdOfClass0AtrA = std(class0(1,:));
    stdOfClass0AtrB = std(class0(2,:));
    
    % Get the mean of class 1's attributes
    meanOfClass1AtrA = mean(class1(1,:));
    meanOfClass1AtrB = mean(class1(2,:));
    
    % Get the standard deviation of class 1's attributes
    stdOfClass1AtrA = std(class1(1,:));
    stdOfClass1AtrB = std(class1(2,:));
   
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
        probAtrAClass0 = getProbFromGuassian(stdOfClass0AtrA, meanOfClass0AtrA, atrA);
        probAtrBClass0 = getProbFromGuassian(stdOfClass0AtrB, meanOfClass0AtrB, atrB);
        
        % Get the prob of atr A given class1 and atr B given class1
        probAtrAClass1 = getProbFromGuassian(stdOfClass1AtrA, meanOfClass1AtrA, atrA);
        probAtrBClass1 = getProbFromGuassian(stdOfClass1AtrB, meanOfClass1AtrB, atrB);

        % Get the prob of class0 given attribute A and for B
        probClass0AtrA = probAtrAClass0 * 0.5 ./ (probAtrAClass0 * 0.5 + probAtrAClass1 * 0.5);
        probClass0AtrB = probAtrBClass0 * 0.5 ./ (probAtrBClass0 * 0.5 + probAtrBClass1 * 0.5);
        
        % Get the prob of class1 given attribute A and for B
        probClass1AtrA = probAtrAClass1 * 0.5 ./ (probAtrAClass0 * 0.5 + probAtrAClass1 * 0.5);
        probClass1AtrB = probAtrBClass1 * 0.5 ./ (probAtrBClass0 * 0.5 + probAtrBClass1 * 0.5);

        % Get prob of x given class 0 and x given class1 using the 
        % conditional independance assumption
        P0 = probClass0AtrB * probClass0AtrA;
        P1 = probClass1AtrB * probClass1AtrA;

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
    plot(classTest0(1, :), classTest0(2,:), 'ro');
    plot(classTest1(1, :), classTest1(2,:), 'b+');
    xlabel('x-dimension');
    ylabel('y-dimension');
    title('Ploting class0 in red and class1 in blue');
    
end

% Apply Gaussian 1D function to the attribute to get prob of being in class
function probOfAtr = getProbFromGuassian(stdOfAtr, meanOfAtr, atr)

      % Calculate first half of equation
      eq1 = (1 / (sqrt(2 * pi) * stdOfAtr)) * exp( -(atr - meanOfAtr) .^ 2);
      
      % Apply first half to last section to get probability
      probOfAtr = eq1 / (2 * stdOfAtr ^ 2);
            
end