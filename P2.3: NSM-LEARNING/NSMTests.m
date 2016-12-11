function tests = NSMTests
    tests = functiontests(localfunctions);
end

%% Test: deterministicTransitionFunction
function observationTest(testcase)

    % Initialise state
    state = 11;
    
    % Initialise expected observation
    expectedObservation = 3;
    
    % Get the actual observation
    actualObservation = observation(state);
    
    % Assert that you get the expect observation
    assert(isequal(actualObservation, expectedObservation));
    
end

%% Test: transition
function transition(testcase)
    
    % Define the action and current state
    action = 1;
    state  = 1;
    
    % Define the next state
    expectedNextState = 4;
    
    % Get the next state from the deterministic transition function
    actualNextState = transition(state, action);
    
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
%% Test: getActionFronKNearest
function getActionFronKNearestTest(testcase)

    % Initialise KNearest sequence with arbitary values for observation and
    % proximity but testable values for discount rate and action
    %KNearest = [observation action discount rate proximity];
    KNearest = [10 1 10 1; 10 1 10 1; 10 2 9 1; 10 2 3.4868 1;
                10 3 1  1; 10 3 5  1; 10 4 9 1; 10 4 9 1];
            
    % Initialise expected action (1) because of highest mean of discount
    % rate
    expectedAction = 1;
    
    % Get the actual action
    actualAction = getActionFromKNearest(KNearest);
    
    % assert they're the same
    assert(isequal(actualAction, expectedAction));
    
end

%% Test: proximity
function proximityTest(testcase)

    % Initalise LTM
    LTM = [0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
     10.0000    1.0000    5.3144;
      1.0000    3.0000    5.9049;
     10.0000    4.0000    6.5610;
     10.0000    2.0000    7.2900;
     10.0000    2.0000    8.1000;
     10.0000    2.0000    9.0000;
     10.0000    3.0000   10.0000];

    % Initialise STM with same values above to test its working
    STM = [0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
           0         0         0;
     10.0000    1.0000    5.3144;
      1.0000    3.0000    5.9049;
     10.0000    4.0000    6.5610;
     10.0000    2.0000    7.2900;
     10.0000    2.0000    8.1000;
     10.0000    2.0000    9.0000;
     10.0000    3.0000   10.0000]
 
    % Initialise expected values
    expectedProximity = 20;
    expectedLTMStep   = [10.0000    3.0000   10.0000];
    
    % Get actual values from proximity
    [actualProximity, actualLTMStep] = proximity(LTM, 1, 20, STM, 10);
    
    % FLESH OUT TEST WITH EDGE CASES
    
    % Assert proximities are the same
    assert(isequal(actualProximity, expectedProximity));
    
    % Assert LTM steps are the same
    assert(isequal(actualLTMStep, expectedLTMStep));
    
end

%% Test: KNearest
function KNearestTest(testcase)
    
    % Initialise LTM
%     LTM = [0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%            0         0         0;
%      10.0000    1.0000    5.3144;
%       1.0000    3.0000    5.9049;
%      10.0000    4.0000    6.5610;
%      10.0000    2.0000    7.2900;
%             10.0000    2.0000    8.1000;
%             10.0000    2.0000    9.0000;
%             10.0000    3.0000   10.0000];
 
    LTM = [0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
            14.0000    3.0000    5.3144;
            14.0000    3.0000    5.9049;
            14.0000    3.0000    6.5610;
            14.0000    3.0000    7.2900;
            14.0000    3.0000    8.1000;
            14.0000    3.0000    9.0000;
            14.0000    3.0000   10.0000];
        
     LTM(:,:,2) = [0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
                  0         0         0;
            14.0000    3.0000    5.3144;
            14.0000    3.0000    5.9049;
            14.0000    3.0000    6.5610;
            14.0000    3.0000    7.2900;
            14.0000    3.0000    8.1000;
            14.0000    3.0000    9.0000;
            14.0000    3.0000   10.0000];
        
    STM = [14.0000    3.0000   1.0];
    
    KNearestSteps = KNearest(LTM, 10, 14, STM);
    
    
end