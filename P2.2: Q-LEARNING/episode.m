function [numberOfSteps, qTable] = episode(qTable)

    % Get starting state
    state = startingState();

    % Initialise reward
    reward = 0;
    
    % Initialise number of steps
    numberOfSteps = 0;
    
    % Loop through episode until the goal state is reached
    while reward ~= 10
 
        % Get the action
        action = actionSelection(qTable, state);

        % Get the resulting state
        nextState = deterministicTransitionFunction(state, action);
        
        % Get the reward of the resulting action
        reward = getReward(state, action);

        % Update the qTable
        qTable = updateQTable(qTable, state, action, nextState, reward);
        
        % Increment number of steps
        numberOfSteps = numberOfSteps + 1;
        
        % Move to the next state
        state = nextState;

    end
end

