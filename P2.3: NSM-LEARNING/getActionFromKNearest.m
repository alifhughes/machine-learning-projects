function action = getActionFromKNearest(KNearestSteps)

    % Initialise matrices for each action
    northKNSM = [];
    eastKNSM = [];
    southKNSM = [];
    westKNSM = [];
    
    % Get number of rows in Knearest
    [KNearestRows, KNearestColumns] = size(KNearestSteps);

    % Iterate all of KNearestSteps
    for i = 1:KNearestRows
        
        % Check if this iterations steps action
        if (KNearestSteps(i, 2) == 1)
            % Action is north
            
            % Add this step's discount to the actions KNSM (k nearest step matrix)
            northKNSM = [northKNSM; KNearestSteps(i, 3)];
            
        elseif (KNearestSteps(i, 2) == 2)
            % Action is east
            
            % Add this step's discount to the actions KNSM (k nearest step matrix)
            eastKNSM = [eastKNSM; KNearestSteps(i, 3)];
            
        elseif (KNearestSteps(i, 2) == 3)
            % Action is south
            
            % Add this step's discount to the actions KNSM (k nearest step matrix)
            southKNSM = [southKNSM; KNearestSteps(i, 3)];
        elseif (KNearestSteps(i, 2) == 4)
            % action is west
            
            % Add this step's discount to the actions KNSM (k nearest step matrix)
            westKNSM = [westKNSM; KNearestSteps(i, 3)];
        end
        
    end
    
    % Get the mean of each action's discount rates
    if (0 ~= size(northKNSM))
        northDiscountRateMean = mean(northKNSM);
    else
        northDiscountRateMean = 0.0;
    end
    
    if (0 ~= size(eastKNSM))
        eastDiscountRateMean = mean(eastKNSM);
    else
        eastDiscountRateMean = 0.0;
    end

    if (0 ~= size(southKNSM))
        southDiscountRateMean = mean(southKNSM);
    else
        southDiscountRateMean = 0.0;
    end
    
    if (0 ~= size(westKNSM))
        westDiscountRateMean = mean(westKNSM);
    else
        westDiscountRateMean = 0.0;
    end
    
    % Add all means to an array
    actionMeans = [northDiscountRateMean eastDiscountRateMean southDiscountRateMean westDiscountRateMean];
    
    % Get the index of the max value of the action means
    [maxValue, index] = max(actionMeans);
    
    % Assign the index which corresponds to the max value of the action mean
    action = index;
end

