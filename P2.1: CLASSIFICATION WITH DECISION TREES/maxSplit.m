% Loops through all possible set to find the best split and returns that a
% as a rule
function [updatedSet, setRule] = maxSplit(S)

    % Get number of sets
    noOfSets = max([S{:, end}]);
    
    % Get lowest set no
    lowestSet = min([S{:, end}]);
    
    % Initialise the max information gain
    maxInformationGain = 0;
    
    % Intialise optimal threshold value
    optimalThreshold = 0;
    
    % Intialise the property holder it was split on
    property = 0;
    
    % Initialise the optimal set holder the split was made on
    optimalSet = 0;
    
    % Intialise empty array for set rule
    setRule = zeros(1, 3);
    
    % loop through all possible sets 
    for setIndex = lowestSet:noOfSets

        % Get the current set by filtering on set index
        currentSet = getSet(S, setIndex);
        
        % Check if current set is empty
        if isempty(currentSet) 
        
            % Skip set
            continue;

        end        

        % Loop through all possible variables
        for varIdx = 1:4

            % Get all values in column for that variable
            thresholds = unique([currentSet{:, varIdx}]);
            
            % Get the number of columns and rows
            [thresholdRowCount, thresholdColumnCount] = size(thresholds);
            
            % Loop through all possible values
            for i = 1:thresholdColumnCount
                
                if (thresholds(i) == 1.9)
                    disp('h');
                end
                
                % Make the split on the set with the variable and threshold
                % value
                [S1, S2] = split(currentSet, varIdx, thresholds(i));
                
                % Check if set contains any values
                if 1 == isempty(S1) || 1 == isempty(S2)
                    % One of the sets is empty
                    
                    % Skip information calculation 
                    continue;

                end

                % Get the information gain of the split
                informationGain = improvement(currentSet, S1, S2);
                
                % Check if new information gain is greater than the max
                % information gain
                if maxInformationGain < informationGain
                    % New information gain is greater
                    
                    % Set the new information gain max
                    maxInformationGain = informationGain;
                    
                    % Update the threshold it was split on
                    optimalThreshold = thresholds(i);

                    % Update the property on which the split was made
                    property = varIdx;
                    
                    % Update the set on which the split was made
                    optimalSet = setIndex;

                end
            end
        end
    end

    % Check if the optimal set has been set
    if optimalSet == 0
        % Hasn't been set, therefore no best split available
        
        % Initialise setRule as empty
        setRule = [];

        % Set updated set as set passed in, unchanged due to no split
        updatedSet = S;

        % Quit function execution
        return;

    end 

    % Get the set to split on based on the optimal set
    setToSplitOn = getSet(S, optimalSet);

    % Make the split
    [S1, S2] = split(setToSplitOn, property, optimalThreshold);
    
    % Update the subset index
    updatedSet = updateSubsets(S, S1, S2, setIndex);
    
    % Get the two new set numbers that the split has been created into
    set1Split = setIndex + 1;
    set2Split = setIndex + 2;

    % Make array of rules based on optimal set split
    setRule = [property, optimalThreshold, optimalSet, set1Split, set2Split];
    
end

% Update the set ID's respectively
function updatedSet = updateSubsets(S, S1, S2, setIndex)

    % Update the set index + 1 of all values of S = S1
    % For all rows of original set
    for i = 1:size(S, 1)
        
        % For all rows of set 1
        for j = 1:size(S1, 1)
        
            % Check if columns from set1 are the same as origial set
            if isequal(S(i, [1:5]), S1(j, [1:5]))
                
                % Increment that set index + 1
                S{i, end} = setIndex + 1;
                
            end
        end
    end
    
    
    % Update the set index + 2 of all values of S = S2
    % For all rows of original set
    for i = 1:size(S, 1)
        
        % For all rows of set 2
        for j = 1:size(S2, 1)
        
            % Check if columns from set1 are the same as origial set
            if isequal(S(i, [1:5]), S2(j, [1:5]))
                
                % Increment that set index + 1
                S{i, end} = setIndex + 2;
                
            end
        end
    end
    
    % Return the update set
    updatedSet = S;
    
end

