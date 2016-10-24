function majorityClassesPerExistingNodes = removeMajorityClasses(majorityClasses, rules)

    % Get no of rows in rules
    noOfRowsInRules = size(rules, 1);
    
    % Get no of rows in majority classes
    noOfRowsInMajorityClasses = size(majorityClasses, 1);
    
    % Iterate every row in the rules array
    for i = 1:noOfRowsInRules
        
        % Iterate every row in the majority classes array
        for j = 1:noOfRowsInMajorityClasses
            
            if (isequal(num2cell(rules(i, 3)), majorityClasses(j, 1)))
                majorityClasses(j, :) = [];

                % Break out of inner loop
                break;
            end
            
        end
        
    end

    % Return the majoirty classes for the exisiting nodes
    majorityClassesPerExistingNodes = majorityClasses;

end

