function KNearestSteps = KNearest(LTM, K, observation, STM)

    % Get number of episodes
    [steps, values, episodes] = size(LTM);
    
    % Initialise matrix to hold k nearest neighbours
    KNearestSteps = [];

    % Loop through all episodes and all steps of LTM
    for episode = 1:episodes

        % Get the last step of this episode from the LTM
        finalStep = LTM(20, :, episode);

        % Check if observation is 0
        if finalStep(1,1) == 0
            % LTM hasn't been set yet

            % Skip this LTM
            continue;

        end
        
        % Loop through all steps per episode
        for step = 1:steps
            
            % Get the proximity value for the current iteration
            [currentProximityValue, LTMStep] = proximity(LTM, episode, step, STM, observation);
            
            % Check if proximity value is greater than 0
            if currentProximityValue > 0
                
                % Get the size of KNearestNeighbours
                [rows, columns] = size(KNearestSteps);
                
                % Check if rows is the same as K
                if (K == rows)
                    % Maximum number of neighbours reached
                    
                    % Get the minimum value of proximity from the nearest
                    % neighbours matrix
                    [minimumProximityValue, index] = min(KNearestSteps(:, 4));

                    % Check if minimum value is smaller than current value
                    if (minimumProximityValue < currentProximityValue)
                        % Replace the row with the smallest proximity value
                        % with this proximity value and steps

                        % Add the current proximity value onto the LTMStep
                        LTMStep = [LTMStep currentProximityValue];
                    
                        % Add this LTMStep to the KnearestNeighbours matrix
                        KNearestSteps(index, :) = LTMStep;

                    end
                else 
                    
                    % Add the current proximity value onto the LTMStep
                    LTMStep = [LTMStep currentProximityValue];
                    
                    % Add this LTMStep to the KnearestNeighbours matrix
                    KNearestSteps = [KNearestSteps; LTMStep];
                end
            end
        end
    end
end

