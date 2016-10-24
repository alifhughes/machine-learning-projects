% Splitting a data set given a rule
% S         = set (the whole matrix)
% varIdx    = variable index (column)
% threshold = what to split it on
function [S1, S2] = split(S, varIdx, threshold)
    
    % Initialise empty matrices for results
    S1 = {};
    S2 = {};

    % Get the amount of rows in matrix
    rows = size(S, 1);
    
    % For each row of S
     for row = 1:rows

         % Check if column value for this row is less than the threshold
         if S{row, varIdx} < threshold

             % Copy row accross to S1
             S1 = [S1; S(row, :)];

         % Check if the column value for this row is more or equal to
         % threshold
         elseif S{row, varIdx} >= threshold 
             % Value is greater than or eqaul to threshold

             % Copy row accross to S1
             S2 = [S2; S(row, :)];

         end        
     end
end

