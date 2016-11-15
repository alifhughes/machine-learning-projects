function initiate
    
    % Load the fisher iris set
    load fisheriris.mat
    
    % Get the decision tree and majority nodes it produces
    [decisionTree, majorityNodes] = learnDecisionTree(meas, species);

    % Create sample data
    sampleData = [num2cell(6.2), num2cell(2.2), num2cell(4.5), num2cell(1.5)];
    
    % Get the classification of the sample data
    classification = classify(decisionTree, sampleData);
    
    % Loop through majoirty node's rows
    for i = 1:size(majorityNodes, 1)
        
        % Check if the current iteration's node is equal to the
        % classification
        if isequal(num2cell(classification), majorityNodes(i, 1))
            % Is the same node
            
            % Get the majority plant name
            plantName = majorityNodes(i, 2);
            
            % Exit loop
            break;

        end
    end
    
    % Display the classifcation node and the majority plant name in that
    % node
    disp(classification);
    disp(plantName);

end 