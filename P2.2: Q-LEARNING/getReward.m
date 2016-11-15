function reward = getReward(state, action)
    
    % Initialise reward as 0
    reward = 0;

    % Check the state and action values
    if (state == 5 && action == 3)
        % Going to final state
        reward = 10;
    end

end

