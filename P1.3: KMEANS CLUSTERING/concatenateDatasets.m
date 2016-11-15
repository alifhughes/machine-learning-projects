function concatenateDatasets
    
    % Get the generated data sets
    [dataNormal1, dataNormal2] = generateDataset();
    
    % Concatenate the datasets
    trainingDataset = [dataNormal1 dataNormal2];    
        
    % Create the size of the cirlces to be plotted
    circleSize = 15;

    % Plot the results
    scatter(trainingDataset(1, :), trainingDataset(2, :), circleSize, 'b', 'filled');
    
    % Format the graph
    title('2D trainingDataset plot');
    xlabel('y-value');
    ylabel('x-value');
    legend('training data');
end