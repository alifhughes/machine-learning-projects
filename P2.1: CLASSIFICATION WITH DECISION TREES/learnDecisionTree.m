function [rules, majorityClassesPerExistingNodes] = learnDecisionTree(meas, species)
    
    % Initialise a column of 1s for the initial set number to append to
    % data set
    initialSetNo = ones(size(meas, 1), 1);
    
    % Concatinate the data together
    set = [num2cell(meas), cellstr(species), num2cell(initialSetNo)];
    
    % Initialise cell array for the majority classes
    majorityClasses = [];
    
    % Initialise empty array for all rules
    rules = [];
    
    % Initialise stopping criteria as false
    stoppingCriteria = false;
    
    % Call max split until stopping criteria has been achieved
    while (stoppingCriteria == false)
        
        % Call max split on data set
        [set, setRule] = maxSplit(set);
        
        % Check if best set rule has been set
        if isempty(setRule)
            % Hasn't been set, therefore no best set possible
            
            % Set stopping criteria to true
            stoppingCriteria = true;
            
            % Skip the iteration
            continue;

        end
           
        % Get the majority class
        [majorityClassSet1, majorityClassSet2] = majorityClass(set);

        % Add this to array of all majority classes
        majorityClasses = [majorityClasses; majorityClassSet1];
        majorityClasses = [majorityClasses; majorityClassSet2];

        % Add set rules to all rules
        rules = [rules; setRule];

    end
    
    % Remove majority classes for nodes that have been split
    majorityClassesPerExistingNodes = removeMajorityClasses(majorityClasses, rules);
    
end