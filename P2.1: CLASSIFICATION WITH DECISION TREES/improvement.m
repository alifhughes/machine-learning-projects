% originalSet : complete fisheriris set without before splitting
% S1 : First set that is a result of split
% S2 : Second set that is a result of the split
% informationGain: measure of purity that is the result of calculation from
% entropy before - entropy after
function informationGain = improvement(originalSet, S1, S2)
    
    % Get the entropy values for all instances before, during and after
    % the set splits
    entropyBefore = entropy(originalSet);
    entropyS1     = entropy(S1);
    entropyS2     = entropy(S2);
    entropyAfter = getEntropyAfter(originalSet, S1, S2, entropyS1, entropyS2);
    
    % Calculate the information gain
    informationGain = entropyBefore - entropyAfter;
    
end

% Wrapper function to get the size of a set
function sizeOfSet = getSizeOfSet(S)
    sizeOfSet = size(S, 1);
end

% Calculates the entropy after
function entropyAfter = getEntropyAfter(originalSet, S1, S2, entropyS1, entropyS2)
    
    % Get the size of all sets
    sizeOfOriginalSet = getSizeOfSet(originalSet);
    sizeOfS1          = getSizeOfSet(S1);
    sizeOfS2          = getSizeOfSet(S2);
    
    % Calculate the entropy after
    entropyAfter = (sizeOfS1 / sizeOfOriginalSet * entropyS1) + (sizeOfS2 / sizeOfOriginalSet * entropyS2);
    
end

