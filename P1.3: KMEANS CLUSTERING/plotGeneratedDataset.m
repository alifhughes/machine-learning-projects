function plotGeneratedDataset
    
    % Get the generated data sets
    [dataSet1, dataSet2] = generateDataset();

    figure;
    
    % Create the size of the cirlces to be plotted
    circleSize = 15;

    % Plot the data dimension against eachother to get a 2D scatter plot
    % for data set 1
    scatter(dataSet1(1, :), dataSet1(2, :), circleSize, 'b', 'filled');
    
    hold on;
    
    % Plot the data dimension against eachother to get a 2D scatter plot
    % for data set 2
    scatter(dataSet2(1, :), dataSet2(2, :), circleSize, 'r', 'filled');
    
    % Format the graph
    title('2D raw data plot');
    xlabel('y-value');
    ylabel('x-value');
    legend('dataset 1', 'dataset 2');
    
end

