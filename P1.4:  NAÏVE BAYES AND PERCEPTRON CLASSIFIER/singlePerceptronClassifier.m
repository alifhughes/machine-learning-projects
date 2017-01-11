function singlePerceptronClassifier
    
    % Generate the gaussain data
    [trainingData, trainingTarget] = GenerateGaussianData(1000);
    [testingData, testingTarget] = GenerateGaussianData(100000);

    % Initiate learning rate to small number between 0 and 1
    learningRate = 0.5;
    
    % Initiate weight vector as empty
    weights = [0, 0, 0];
    
    % Get the size of the data set
    [rows, columns] = size(trainingData);
    
    % Iterate complete training data set
    for i = 1:columns
        
        % Get the data element to train with
        data = [trainingData(:, i)', 1];
        
        % Get the classifier threshold
        threshold = sum(data .* weights);
        
        % Check if threshold is above 0
        if threshold > 0
            
            % Is above 0, assign class 1
            class = 1;

        else

            % Below 0, assign class 0
            class = 0;

        end
        
        % Update weight vector using perceptron learning rule
        weights = weights + (learningRate * (trainingTarget(1, i) - class) * data);
        
    end
    
    % Initalise empty classes for the testing data
    class0 = [];
    class1 = [];
    
    % Iterate all testing data
    for j = 1:length(testingData)
        
        % Get the testing data element
        data = [testingData(:, j)', 1];
        
        % Get the classifier threshold
        threshold = sum(data .* weights);
        
        % Check if threshold is above 0
        if threshold > 0
            
            % Is above 0, assign class 1
            class0 = [class0 testingData(:, j)];

        else

            % Below 0, assign class 0
            class1 = [class1 testingData(:, j)];

        end
        
        
    end
        % Plot the graph
    figure
    hold on
    plot(class0(1,:), class0(2,:), 'ro');
    plot(class1(1,:), class1(2,:), 'b+');
    xlabel('x-dimension');
    ylabel('y-dimension');
    title('Ploting class0 in red and class1 in blue');
    
end

