function experiment

    % Initialise matrix to hold mean per trial
    meanOfTrials = zeros(1, 50);

    % Initialise matrix to hold standard deviation per trial
    standardDeviationOfTrials = zeros(1, 50);

    % Initialise a matrix to hold all steps across all trials
    trialStepMatrix = zeros(100, 50);

    % Iterate 100 trials
    for i = 1:100

        % Run the for 50 episodes
        [numOfStepsMatrix, LTM] = NSMTrial(50);

        trialStepMatrix(i,:) = numOfStepsMatrix;
        
    end
    
    
    % Iterate each episode associated steps
    for i = 1:50
    
        % Get the mean of the trials
        meanOfTrials(i) = mean(trialStepMatrix(:, i));
        
        % Get the standard deviation of the trials
        standardDeviationOfTrials(i) = std(trialStepMatrix(:, i));
            
    end
    
    % Set x axis
    x = [1:1:50];
    
    figure;

    % Plot the mean and standard deviation of each episode count for 100
    % trials
    shadedErrorBar(x, meanOfTrials, standardDeviationOfTrials, 'black');
    title('Mean and standard deviation of NSM-Learning performance over 100 trials');
    xlabel('Episode number');
    ylabel('Number of steps');

end

