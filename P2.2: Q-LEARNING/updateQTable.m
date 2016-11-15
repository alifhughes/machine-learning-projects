function qTable = updateQTable(qTable, state, action, resultingState, reward)

    % Initialise discount rate and learning rate
    discountRate = 0.9;
    learningRate = 0.2;

    % Get the qTable value that we're in
    currentQTableValue = qTable(state, action);
    
    % Get the max value of the resulting state's row
    maxValueOfResultingState = max(qTable(resultingState, :));

    % Calculate the updated value according to the learning rule
    updatedValue = currentQTableValue + learningRate * (reward + (discountRate * maxValueOfResultingState) - currentQTableValue);
    
    % Update the table with the new value
    qTable(state, action) = updatedValue;
    
end

