function action = NSMSelectAction(LTM, STM, currentObservation)

    % Get random number between 1 and 10
    randomNumber = randi([1 10]);
    
    % Set k for KNearest function
    K = 10;

    % Get the last step of the episode from the first epsiode of the LTM
    finalStep = LTM(20, :, 1);
    
    % Check if observation is 0
    if finalStep(1,1) == 0
        % On first iteration through and therefore LTM is empty
        
        % Set random number to 10 so that it selects a random action
        randomNumber = 10;
        
    end
    
    % Get the size of the STM
    [rows, columns] = size(STM);

    % Check if number is equal to 10 or no rows in the STM
    if randomNumber == 10 || rows == 0

        % Get random action
        action = randi([1 4], 1, 1);

        % Terminate function 
        return; 

    end
    
    % Get the K Nearest Steps matrix
    KNearestSteps = KNearest(LTM, K, currentObservation, STM);

    % Check if KNearestSteps is empty
    if isempty(KNearestSteps)

        % Get random action
        action = randi([1 4], 1, 1);

        % Terminate function 
        return; 

    end
    
    % Get the best action to take from the KNearest sequence
    action = getActionFromKNearest(KNearestSteps);
    
end

