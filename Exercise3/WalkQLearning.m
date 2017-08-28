% Assignment 2 Exercise 3 Q-Learning
% Date: 2017-08-28
% Author: ShangyinGao

function WalkQLearning(s)
% init Q matrix
Q=zeros(16,4);
% number of repeat steps
T = 300;
% init some other 
epsilon = 0.5;
alpha = 0.7;
gamma = 0.3;

action = 0;
state = ceil(rand*16);

for i = 1:T
    % epsilon greedy policy
    if rand > epsilon
        [~, action] = max(Q(state, :));
    else
        action = ceil(rand*4);
    end

    % send action to simulateRobot te generate nextState and reward
    [nextState, reward] = SimulateRobot(state, action);

    % update Q matrix
    Q(state, action) = Q(state, action)+alpha*(reward+gamma*max(Q(nextState, :))-Q(state, action));

    % s <- s'
    state = nextState;

end

% after learning generate stateSequence
stateSequence = zeros(1,16); stateSequence(1) = s;
for i = 2:16
    [~, action] = max(Q(stateSequence(i-1), :));
    [stateSequence(i), ~] = SimulateRobot(stateSequence(i-1), action);
end
walkshow(stateSequence);

end
