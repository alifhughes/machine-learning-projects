% Returns the name of the majority class for the latest split rule
function [majorityClassSet1, majorityClassSet2] = majorityClass(S)

    % Initialise majority classes
    majorityClasses = [];

    % Get the highest class number from the latest split 
    highestSet = max([S{:, end}]);
    
    % Get all values in that set
    set1 = getSet(S, highestSet - 1);
    
    % Get all values in the other set made from the latest split
    set2 = getSet(S, (highestSet));
    
    % Get the number of each plant type in each of the lastest splits
    noOfVirginicaInSet1  = getNoOfPlantType('virginica', set1);
    noOfVersicolorInSet1 = getNoOfPlantType('versicolor', set1);
    noOfSetosaInSet1     = getNoOfPlantType('setosa', set1);

    noOfVirginicaInSet2  = getNoOfPlantType('virginica', set2);
    noOfVersicolorInSet2 = getNoOfPlantType('versicolor', set2);
    noOfSetosaInSet2     = getNoOfPlantType('setosa', set2);
    
    % Get the majority class for both sets
    majorityClassNameSet1 = getMajorityClassPerSplit(noOfVirginicaInSet1, noOfVersicolorInSet1, noOfSetosaInSet1);
    majorityClassNameSet2 = getMajorityClassPerSplit(noOfVirginicaInSet2, noOfVersicolorInSet2, noOfSetosaInSet2);
    
    % Return cell array of the majority class per that split
    majorityClassSet1 = [num2cell(highestSet - 1), cellstr(majorityClassNameSet1)];
    majorityClassSet2 = [num2cell(highestSet), cellstr(majorityClassNameSet2)];

end

% Get the majority class for that split
function majorityClassName = getMajorityClassPerSplit(noOfVirginica, noOfVersicolor, noOfSetosa)
    
    % Get the highest amount of each
    if (noOfVirginica > noOfVersicolor && noOfVirginica > noOfSetosa)
        % Virginica is the highest
        majorityClassName = 'virginica';
        
    elseif (noOfVersicolor > noOfVirginica && noOfVersicolor > noOfSetosa)
        % Versicolor is the highest
         majorityClassName = 'versicolor';

    elseif (noOfSetosa > noOfVirginica && noOfSetosa > noOfVersicolor)
         % Setosa is the highest
         majorityClassName = 'setosa';

    else   
        % No majority
         majorityClassName = '-';

    end  

end