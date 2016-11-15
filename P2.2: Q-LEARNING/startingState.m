% Get the starting state which cannot be 2 as 2 is the finish state
function startState = startingState()

    % Get a number between 1 and 11
    startState = randi([1 11], 1, 1);
    
    % Check if number is 2 (finish state)
    if startState == 2
        startState = startingState();
    end
    
end

