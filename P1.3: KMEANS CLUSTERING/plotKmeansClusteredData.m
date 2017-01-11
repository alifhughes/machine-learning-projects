function plotKmeansClusteredData
    
    % Get the generated data sets
    [dataNormal1, dataNormal2] = generateDataset();
    
    % Concatenate the datasets
    trainingDataset = [dataNormal1 dataNormal2];   
    
    % Initalise k
    K = 2;
    
    % Call k means to get the clusters
    [trainingDataset, clusterMeans] = kmeansFirstPrinciple(K, trainingDataset);
    
    figure;

    % Iterate each cluster
    for cluster = 1:K

        % Get all values that belong to the cluster
        currentCluster = trainingDataset(3, :) == cluster;
        currentCluster = trainingDataset(:, currentCluster);
            
        % Plot the data dimension against eachother to get a 2D scatter plot
        % for current cluster
        plot(currentCluster(1, :), currentCluster(2, :), '.');
        
        hold on;
    
    end

    % Format the graph
    title('2D raw data plot');
    xlabel('y-value');
    ylabel('x-value');
    %legend('cluster 1', 'cluster 2');
    
end

