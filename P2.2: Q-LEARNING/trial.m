function episodeStepCountTable = trial

    % Initialise qTable
    qTable = initQ();
    
    % Initialise matrix to hold amount of steps per episode
    episodeStepCountTable = [];

    % Iterate 100 episodes
    for i = 1:100
        
        % Run the episode
        [episodeStepCount, updatedQTable] = episode(qTable);
        
        % Update the step count table
        episodeStepCountTable = [episodeStepCountTable, episodeStepCount];
        
        % Reassign the updated qTable
        qTable = updatedQTable;

    end

end

