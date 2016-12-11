function [numOfSteps, episode] = rndEpisode()

    % Get the starting state
    state = rndStartState();
    
    % Initialise episode matrix
    episode = [];

    % Loop through episode until the goal state is reached
    while state ~= 2

        % Generate a random action
        action = randi([1 4], 1, 1);
        
        % Get the next state based on state and action
        nextState = transition(state, action);
        
        % Get the observation
        currentObservation = observation(state);
        
        % Update the episode
        episode = [episode; currentObservation action 1.0];
        
        % Move to the next state
        state = nextState;
    
    end
    
    % Get number of rows of episode matrix
    [rows columns] = size(episode);
    
    % Iterate each row of the episode matrix
    for step = rows:-1:1
        
        % Check to see if at last step in episode
        if step == rows
            % Give that a discountedReward of 10
            episode(step, 3) = 10;
            
            % Skip iteration
            continue;
            
        end
        
        % Get the discountedReward of the previous step
        prevDiscountedReward = episode((step + 1), 3);
        
        % Do the discounted rate multiplication
        discountedReward = prevDiscountedReward * 0.9;
        
        % Assign that to this iterations step discountedReward
        episode(step, 3) = discountedReward;
        
    end
    
    % Get the number of steps
    numOfSteps = rows;
   
    % Check to see if it took less steps than 20 to reach goal
    if rows < 20
        % Took less steps
        
        % Initialise matrix of zeros that is the difference between rows
        % and matrix size
        zeroMatrix = zeros((20 - rows), 3); 
        
        % Padd out array 
        episode = [zeroMatrix; episode];
        
    elseif rows > 20
        % Took more than 20 steps
        
        % Get the last 20 steps
        episode = episode((rows - 19):rows, :);
        
    end

end

