function tests = classificationWithDecisionTreesTests
    tests = functiontests(localfunctions);
end

%% Test: learnDecisionTree
function learnDecisionTreeTest(testCase)
    %inputs:  M (matrix), v(classification vector)
    %process: Splits input via the classification repeatedly
    %outputs: Constructs a data structure appriopriate for representing
    
    
end

%% Test: split
function splitTest(testCase)
    %input:   S (set), varIdx (column), threshold (value to compare)
    %process: Splits the value under the varIdx into two sets based on the threshold
    %output:  Two sets, S1 with value less than threshold and S2 higher
    S = [num2cell(1.5), num2cell(1.7), cellstr('setosa'); 
         num2cell(2.5), num2cell(2), cellstr('virginica');
         num2cell(2), num2cell(2), cellstr('virginica')];
 
    [S1, S2] = split(S, 1, 2);

    assert(isequal(S1, {1.5000, 1.7000,'setosa'}));
    assert(isequal(S2, {2.5000, 2,'virginica'; 2, 2, 'virginica'}));

end

%% Test: entropy
function entropyTest(testCase)
    %inputs:  S (set) of all values
    %process: calculate entropy of all values
    %output:  entropy value

    % load fisher iris data set
    load fisheriris.mat

    % Concatinate the data together
    fisherIrisSet = [num2cell(meas), cellstr(species)];
    
    % Find the entropy before any splitting
    entropyValue = entropy(fisherIrisSet);
    
    % Assert equal to pre calculate entropy value
    assert(isequal(entropyValue, -3));

end

%% Test: Majority class
function majorityClassTest(testCase)
    % Input: A set
    % Process: Get the majority class plant name
    % Output: that name
    
    % Initialise a set
    S = [num2cell(1.5), num2cell(1.7), cellstr('setosa'), num2cell(2); 
         num2cell(2.5), num2cell(2), cellstr('virginica'), num2cell(3);
         num2cell(2), num2cell(2), cellstr('virginica'), num2cell(3)];
     
    % Get the majority class name
    majorityClassName = majorityClass(S);
    
    
    
    % Assert that the majority class name is virginica
    %assert(isequal(plantName, cellstr('virginica')));
    
    % Initialise a set
    S1 = [num2cell(1.5), num2cell(1.7), cellstr('setosa'), num2cell(2);
         num2cell(1.5), num2cell(1.7), cellstr('setosa'), num2cell(2);
         num2cell(2.5), num2cell(2), cellstr('virginica'), num2cell(3)];
     
    % Get the majority class name
    majorityClassName = majorityClass(S1);
    
    % Get the plant name
    plantName = majorityClassName(1, 2);

    % Assert that the majority class name is setosa
    assert(isequal(plantName, cellstr('setosa')));
    
end

%% Test: Classify
function classifyTest(testcase)
    % Input: decisiontree, test data
    % Process: get the node it should fall into
    % Output: that node
    
    % Initialise sample data array
    sampleData = [num2cell(5.1), num2cell(3.5), num2cell(1.4), num2cell(0.2)];
    
    % Initialise decision tree array
    rules = [3 3 1 2 3; 3 5.2 3 4 5];
    
    % Get the classification
    classification = classify(rules, sampleData);
    
    % Assert that the the classification is correct should be in 2
    assert(isequal(classification, 2));
    
end