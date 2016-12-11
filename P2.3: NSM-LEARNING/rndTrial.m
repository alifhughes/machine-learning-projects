function [numOfStepsMatrix, LTM] = rndTrial(numOfEpisodes)

    % Initialise LTM matrix
    LTM = zeros(20, 3, numOfEpisodes);
    
    % Initialise the number of steps matrix for each episode
    numOfStepsMatrix = zeros(1, numOfEpisodes);
    
    % Iterate amount of times to get desired amount of episodes
    for i = 1:numOfEpisodes
        
        % Get the episode
        [numOfSteps, episode] = rndEpisode();               
        
        % Add this iterations episode to the long term memory
        LTM(:, :, i) = episode;
        
        % Add this episode's step count to the number of steps matrix
        numOfStepsMatrix(i) = numOfSteps;
        
    end

end

