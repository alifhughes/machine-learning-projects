function plotKmeansClusteredData
    
    % Get the generated data sets
    [dataNormal1, dataNormal2] = generateDataset();
    
    % Concatenate the datasets
    trainingDataset = [dataNormal1 dataNormal2];   
    
    % Initalise k
    K = 2;
    
    % Call k means to get the clusters
    [cluster1, cluster2] = kmeansFirstPrinciple(K, trainingDataset);
    
    figure;
    
    % Create the size of the cirlces to be plotted
    circleSize = 15;

    % Plot the data dimension against eachother to get a 2D scatter plot
    % for data set 1
    scatter(cluster1(1, :), cluster1(2, :), circleSize, 'b', 'filled');
    
    hold on;
    
    % Plot the data dimension against eachother to get a 2D scatter plot
    % for data set 2
    scatter(cluster2(1, :), cluster2(2, :), circleSize, 'r', 'filled');
    
    % Format the graph
    title('2D raw data plot');
    xlabel('y-value');
    ylabel('x-value');
    legend('cluster 1', 'cluster 2');
    
end

