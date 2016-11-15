% Returns the next state based on an action and state
function nextState = deterministicTransitionFunction(state, action)

    % Create the environment
    environment = [
        4  1  1  1; 
        2  2  2  2;
        3  3  6  3;
        7  4  4  4;
        9  5  2  5;
        11 6  3  6;
        7  8  7  7; 
        8  9  8  7;
        9  10 5  8;
        10 11 10 9;
        11 11 6  10
    ];

    % Get the new state
    nextState = environment(state, action);

end

