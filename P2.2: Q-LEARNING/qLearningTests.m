function tests = qLearningTests
    tests = functiontests(localfunctions);
end

%% Test: deterministicTransitionFunction
function deterministicTransitionFunctionTest(testcase)
    
    % Define the action and current state
    action = 1;
    state  = 1;
    
    % Define the next state
    expectedNextState = 4;
    
    % Get the next state from the deterministic transition function
    actualNextState = deterministicTransitionFunction(state, action);
    
    % Assert that you get the expect state
    assert(isequal(actualNextState, expectedNextState));
    
    % Define the action and current state
    action = 2;
    state  = 1;
    
    % Define the next state
    expectedNextState = 1;
    
    % Get the next state from the deterministic transition function
    actualNextState = deterministicTransitionFunction(state, action);
    
    % Assert that you get the expect state
    assert(isequal(actualNextState, expectedNextState));
    
end

%% Test: startingState
function startingStateTest(testcase)

    % Get the starting state
    startState = startingState();
    
    % Test if number is whole
    assert(mod(startState, 1) == 0);
    
    % Test is number is between 1 and 11
    assert(startState <= 11);
    assert(startState >= 1);
    
    % Test if number is not two
    assert(startState ~= 2);

end

%% Test: rewardFunction
function getRewardTest(testcase)
    
    % Initialise a state and an action
    % State and action represent moving to final state
    state = 5;
    action = 3;
    
    % Initialise the reward for reaching final state
    expectedReward = 10;
    
    % Get the actual reward and function
    actualReward = getReward(state, action);
    
    % Assert the reward is 10
    assert(isequal(actualReward, expectedReward));
    
    % State and action represent moving not to a final state
    state = 4;
    action = 1;
    
    % Initialise the reward for reaching a the non final state
    expectedReward = 0;
    
    % Get the actual reward
    actualReward = getReward(state, action);
    
    % Assert the reward is equal to 0
    assert(isequal(actualReward, expectedReward));
    
end

%% Test: initQ
function initQTest(testcase)
    
    % Initialise qTable
    initQTable = initQ();
    
    % Get the size of the qTable
    sizeOfQTable = size(initQTable);
    
    % Set the expected size
    expectedSizeOfQTable = [11 4];
    
    % Assert sizes are as expected
    assert(isequal(sizeOfQTable, expectedSizeOfQTable));
    
    % Initialise flag
    valueAbove1Flag = false;
    
    for i = 1:11
        
        % Get the max value of the row
        maxRowValue = max(initQTable(i, :));
        
        % Get the min value of the row
        minRowValue = min(initQTable(i, :));
        
        % Check if the maximum value of the row is above one
        if maxRowValue > 0.1
            % Value is above 0.1
            
            % Set the flag
            valueAbove1Flag = true;

        elseif minRowValue < 0.01
            % Value is below 0.01
            
            % Set the flag
            valueAbove1Flag = true;
        end

    end
    
    % Assert that the flag was never set true
    assert(isequal(valueAbove1Flag, false));
    
end