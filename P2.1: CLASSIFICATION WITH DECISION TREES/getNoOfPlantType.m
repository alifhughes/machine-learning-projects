% Get the the number of occarnces of plant type in total set
function noOfPlantType = getNoOfPlantType(plantType, S)
    
    % Get the amount of rows in cell array
    rows = size(S, 1);

    % Initialise number of plant type counter
    noOfPlantType = 0;

    % For each row of S
    for row = 1:rows
        
        % Compare the second to last element of cell array which holds the plant type
        % to the plant type passed in
        if strcmp(S{row, (end - 1)}, plantType)
            % Plant types match
            
            % Increment counter of plant type in set
            noOfPlantType = noOfPlantType + 1;

        end
    end
end