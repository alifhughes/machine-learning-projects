function [cluster1Dataset, cluster2Dataset] = kmeansFirstPrinciple(K, trainingDataset)

    % Initialise number of clusters
    K = 2;
    
    % Initialise empty cluster sets
    cluster1Dataset = [];
    cluster2Dataset = [];

    % Get the generated data sets
    [dataNormal1, dataNormal2] = generateDataset();
    
    % Concatenate the datasets
    trainingDataset = [dataNormal1 dataNormal2];   
    
    % Get the min and max values of training data set
    minValueOfEachCol = min(trainingDataset);
    minValueTotalSet = min(minValueOfEachCol);
    minValueInt = round(minValueTotalSet);

    maxValueOfEachCol = max(trainingDataset);
    maxValueTotalSet = max(maxValueOfEachCol);
    maxValueInt = round(maxValueTotalSet);

    % Randomly assign cluster centroids
    cluster1Centroid = randi([minValueInt maxValueInt], 1, 2);
    cluster2Centroid = randi([minValueInt maxValueInt], 1, 2);

    % Get the size of the data set
    [rows, columns] = size(trainingDataset);

    % Initialise kmeans loop break
    finished = false;

    % iterate until convergence
    while finished == false
            
        % Iterate for each column of the row of the training dataset
        for column = 1:columns

            % Find the difference of the current training dataset value
            % from both cluster centroids
            diffFromClusterCentroid1 = norm(cluster1Centroid - trainingDataset(:, column));
            diffFromClusterCentroid2 = norm(cluster2Centroid - trainingDataset(:, column));

            % Check if the difference from cluster centroid 1 is less 
            % than the difference from cluster centroid 2
            if (diffFromClusterCentroid1 < diffFromClusterCentroid2)
                % It is less

                % Datapoint belongs to cluster 1
                cluster1Dataset = [cluster1Dataset trainingDataset(:, column)];
                

            else 
                % Difference from 1 is greater than 2

                % Datapoint belongs to cluster 2
                cluster2Dataset = [cluster2Dataset trainingDataset(:, column)];

            end

        end
        
        % Find the mean of the clusters
        cluster1Mean = mean(cluster1Dataset, 2);
        cluster2Mean = mean(cluster2Dataset, 2);

        % Check to see if convergence is reached
        if round(cluster1Mean, 1) == round(cluster1Centroid, 1)

            % Set exit condition
            finished = true;

        elseif round(cluster2Mean, 1) == round(cluster2Centroid, 1)

            % Set exit condition
            finished = true;

        end

        % Assign new cluster centroids
        cluster1Centroid = cluster1Mean;
        cluster2Centroid = cluster2Mean;
        
    end

end