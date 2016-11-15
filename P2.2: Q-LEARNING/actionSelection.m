% An e-greedy action selector function
function action = actionSelection(qTable, state)

    % Get all action values
    actionValues = qTable(state, :);

    % Get random number between 1 and 10
    randomNumber = randi([1 10]);

    % Cheack if random number greater than or equal to .9
    if randomNumber == 10

        % Choose random number between 
        action = randi([1 4]);
    
        % Exit
        return;

    end
    
    % Get the column of the maximun value
    [value, column] = max(actionValues);
    
    % Get the action that corresponds to the column
    action = column;

end

