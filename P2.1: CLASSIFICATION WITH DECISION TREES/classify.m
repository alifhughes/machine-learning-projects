function classification = classify(decisionTree, sampleDataVector)
    % reutrn a class name that the decision tree rules decide it should go
    % into
    % make the journey down the tree until it arrives at the right node

    % Iterate each rule
    for i = 1:size(decisionTree, 1)
        
        % Get the column to compare
        colToCompare = decisionTree(i, 1);
        
        % Get threshold to compare
        thresholdToCompare = num2cell(decisionTree(i, 2));

        % Compare the value in the column to compare of the sample data
        % with the threshold
        if cellfun(@lt, sampleDataVector(1, colToCompare), thresholdToCompare)
            % Less than threshold
            
            % Goes into the first set of split
            sampleDataNode = decisionTree(i, 4);

        elseif cellfun(@ge, sampleDataVector(1, colToCompare), thresholdToCompare)
            % Greater than or equal to threshold
            
            % Goes into the second set of the split
            sampleDataNode = decisionTree(i, 5);
        end
        
        % Check to see if the node that the sample data has fallen into was
        % split futher
        if (decisionTree((i + 1), 3) ~= sampleDataNode)
            % Node has not been split further
            
            % Break out of the loop
            break;
        end
        
    end
    
    % Return the node of comparision
    classification = sampleDataNode;
    
end

