function experiment

    % Initialise matrix to hold mean per episode
    meanOfTrials = zeros(1, 100);

    % Initialise matrix to hold standard deviation per episode
    standardDeviationOfTrials = zeros(1, 100);
    
    % Initialise trail step vector
    trialStepVector = zeros(500, 100);

    % Iterate 500 episodes
    for i = 1:500
        
        % Run the trial
        trialStepVector(i, :) = trial();
        
    end
    
    % Iterate each episode associated steps
    for i = 1:100
    
        % Get the mean of the trials
        meanOfTrials(i) = mean(trialStepVector(:, i));
        
        % Get the standard deviation of the trials
        standardDeviationOfTrials(i) = std(trialStepVector(:, i));
            
    end
    
    % Set x axis
    x = [1:1:100];
    
    figure;
    
    % Sub plot the first graph
    subplot(2, 2, 1);

    % Plot the episode count over the 100 intervals
    plot(x, trialStepVector(1, :));
    title('Q-learning performance improvement');
    xlabel('Episode number');
    ylabel('Number of steps');
        
    % Sub plot the second graph
    subplot(2, 2, 2);

    % Plot the mean and standard deviation of each episode count for 500
    % trials
    shadedErrorBar(x, meanOfTrials, standardDeviationOfTrials, 'black');
    title('Mean and standard deviation of Q-learning performance over 500 trials');
    xlabel('Episode number');
    ylabel('Number of steps');
    
    % Sub plot the third graph
    subplot(2, 2, 3);
    
    % Initialise qTable
    qTable = initQ();
    
    % Plot the initial qTable values
    plotQFunctionInitValues(qTable);

end

