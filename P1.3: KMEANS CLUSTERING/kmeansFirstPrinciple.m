function [trainingDataset, clusterMeans] = kmeansFirstPrinciple(K, trainingDataset)
    
    % Get the min and max values of training data set
    minValueOfEachCol = min(trainingDataset);
    minValueTotalSet = min(minValueOfEachCol);
    minValueInt = round(minValueTotalSet);

    maxValueOfEachCol = max(trainingDataset);
    maxValueTotalSet = max(maxValueOfEachCol);
    maxValueInt = round(maxValueTotalSet);

    % Initialise matrix for cluster centroids
    clusterCentroids = zeros(2, K);
    
    % Initialise matrix for cluster means
    clusterMeans = zeros(2, K);
    
    % Iterate for each cluster
    for cluster = 1:K
        
        % Randomly assign cluster centroids
        clusterCentroids(:, cluster) = randi([minValueInt maxValueInt], 1, 2);

    end

    % Get the size of the data set
    [rows, columns] = size(trainingDataset);

    % Add extra row of zeros to bottom of training data set
    trainingDataset = [trainingDataset; zeros(1, columns)];
    
    % Initialise kmeans loop break
    finished = false;

    % iterate until convergence
    while finished == false
            
        % Iterate for each column of the training dataset
        for column = 1:columns

            % Initialise previous cluster centroid to compare with
            prevDiffFromClusterCentroid = 'uninitialised';

            % Iterate each cluster
            for cluster = 1:K

                % Find the difference of the current training dataset value
                % from cluster centroid
                diffFromClusterCentroid = norm(clusterCentroids(:, cluster) - trainingDataset(1:2, column));
                
                % Check if there is a previous value set
                if (strcmp(prevDiffFromClusterCentroid, 'uninitialised'))

                    % Set previous value 
                    prevDiffFromClusterCentroid = diffFromClusterCentroid;

                end

                % Check if the difference from cluster centroid 1 is less 
                % than the difference from cluster centroid 2
                if (diffFromClusterCentroid < prevDiffFromClusterCentroid)
                    % It is less

                    % Datapoint belongs to this cluster
                    trainingDataset(3, column) = cluster;

                else 

                    % Datapoint belongs to preivous cluster
                    trainingDataset(3, column) = (cluster - 1);
                    
                end
                

            end
        
        end
        
       

        % Iterate each cluster
        for cluster = 1:K
            
            % Get all values that belong to the cluster
            currentCluster = trainingDataset(3, :) == cluster;
            currentCluster = trainingDataset(:, currentCluster);
            
            % Find the mean of each cluster
            currentClusterMean = mean(currentCluster, 2);
            
            % Appened to all cluster means
            clusterMeans(:, cluster) = currentClusterMean(1:2);
            
        end
        
        % Check to see if convergence is reached
        if (clusterMeans == clusterCentroids)
            
            % Set exit condition
            finished = true;

        end

        % Assign new cluster centroids
        clusterCentroids = clusterMeans;

    end

end