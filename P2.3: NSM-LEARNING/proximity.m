% LTM:          A 3D matrix of the same format as the LTM matrix
% episodeIndex: Index of one of the episodes in the LTM matrix.
% stepIndex:    Index of one of the steps in that episode.
% episode:      2D matrix of the same format as the episode matrix above representing the current content of the algorithms STM
% observation:  Observation value
% proximity:    Value indicating how near the step at the given point in the LTM matrix is to the given STM episode and observation.
% LTMStep:      Vector describing the matching LTM step, observation, action and discounted reward.
function [proximity, LTMStep] = proximity(LTM, episodeIndex, stepIndex, STM, observation)

    % The proximity function should first initialise the proximity to 0.0.
    proximity = 0.0;
    
    % Get the step of the LTM
    LTMStep = LTM(stepIndex, :, episodeIndex);
    
    % Get the recorded observation of episode and step index
    recordedObservation = LTM(stepIndex, 1, episodeIndex);
    
    % Check if recorded observation is the same as observation passed in
    if (recordedObservation ~= observation)
        % Not the same
        
        % Terminate function
        return;
    end
    
    % Values are the same

    % Set proximity value
    proximity = 1;

    % Check if step index 
    if (stepIndex == 1)
        % Can't compare any further back

        % terminate function
        return;

    end

    % Get the number of rows for STM
    [STMRows, STMColumns] = size(STM);
    
    % Iterate all previous steps in LTM
    while (stepIndex ~= 1 && STMRows ~= 1)
        
        % Decrement the step indexs
        stepIndex = stepIndex - 1;
        STMRows = STMRows - 1;

        % Get observation from LTM and STM for this step
        LTMobservation = LTM(stepIndex, 1, episodeIndex);
        STMobservation = STM(STMRows, 1);

        % Get action from LTM and STM for this step
        LTMaction = LTM(stepIndex, 2, episodeIndex);
        STMaction = STM(STMRows, 2); 

        % Check if the observations and actions match
        if (LTMobservation == STMobservation && LTMaction == STMaction)
            % Match

            % Increment proximity
            proximity = proximity + 1;
            

        else 
            % No match

            % Terminate function
            return;

        end

    end

end
