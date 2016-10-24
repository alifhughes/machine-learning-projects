% Filter out the set from the whole data set based on set ID
function filteredSet = getSet(S, setIndex)

    % Get the amount of rows in cell array
    rows = size(S, 1);

    % Initialise new cell array for the filtered set
    filteredSet = {};

    % For each row of S
    for row = 1:rows
        
        % Compare the last element of cell array which holds set number to
        % the set index that it is currently iterating
        if S{row, end} == setIndex

             % Copy row accross to current set
             filteredSet = [filteredSet; S(row, :)];

        end
    end
end
