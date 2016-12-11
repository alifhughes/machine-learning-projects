function observation = observation(state)

 % Create the environment
    observations = [
        14; 
        14;
        14;
        10;
        10;
        10;
        9; 
        5;
        1;
        5;
        3
    ];

    % Get the observationr value from the state
    observation = observations(state, 1);
    
end

