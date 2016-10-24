function entropy = entropy(S)

    % Get the number of each plant type in the set
    noOfVirginica  = getNoOfPlantType('virginica', S);
    noOfVersicolor = getNoOfPlantType('versicolor', S);
    noOfSetosa     = getNoOfPlantType('setosa', S);
    
    % Get the total amount of values in set
    totalNumOfValues = size(S, 1);
    
    % Get the probability of each plantType
    probOfVirginica  = getProbOfPlantType(noOfVirginica, totalNumOfValues);
    probOfVersicolor = getProbOfPlantType(noOfVersicolor, totalNumOfValues);
    probOfSetosa     = getProbOfPlantType(noOfSetosa, totalNumOfValues);
    
    % Get entropy of each plant type
    entOfVirginica  = getEntropyOfPlantType(probOfVirginica);
    entOfVersicolor = getEntropyOfPlantType(probOfVersicolor);
    entOfSetosa     = getEntropyOfPlantType(probOfSetosa);

    % Calculate the entropy
    entropy = -entOfVirginica - entOfVersicolor - entOfSetosa;

end

% Calculates the probability of each plant type
function probOfPlantType = getProbOfPlantType(noOfPlantType, totalNoOfValues)

    % To get probability of plant type, divide its number of occarances by
    % total number of values
    probOfPlantType = noOfPlantType / totalNoOfValues;

end

% Get the entropy of specific plantType
function entropyOfPlantType = getEntropyOfPlantType(probOfPlantType)

    % Check if plant type has a probability
    if probOfPlantType == 0
        % Plant type probability is 0
        
        % Set entropy of plant type to worse possible value
        entropyOfPlantType = 1;
        
        % Exit the function
        return;

    end
        
    % Get the entropy per plant type by multiplying the probability of
    % plant type by the log2 of plant type
    entropyOfPlantType = probOfPlantType * log2(probOfPlantType);

    
end


