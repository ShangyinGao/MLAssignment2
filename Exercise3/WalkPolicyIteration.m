% Assignment 2 Exercise 3 Reinforcement Learning
% Date: 2017-08-27
% Author: ShangyinGao

function WalkPolicyIteration(s)
%% Task 1: reward function
load('rew.mat');

%% Task 2: policy
% discount factor gama
gama = 0.99;
% state transition function
delta = [2 4 5 13; 1 3 6 14; 4 2 7 15; 3 1 8 16; 6 8 1 9; 5 7 2 10; 8 6 3 11; ...
    7 5 4 12; 10 12 13 5; 9 11 14 6; 12 10 15 7; 11 9 16 8; 14 16 9 1; 13 15 10 2; ...
    16 14 11 3; 15 13 12 4];

% init policy
policyNew = ceil(rand(16,1)*4);

% init value function
value = zeros(16,1);

% count the number of loop
counter = 0;
while(1)
    policy = policyNew;
    % step a
    % solve linear system of equations using 
    % matrix A 
    A = diag(ones(16,1));
    for i = 1:16
        A(i, delta(i, policy(i))) = -gama;
    end

    % matrix B
    B = zeros(16,1);
    for i = 1:16
        B(i) = rew(i, policy(i));
    end

    % value functon
    value = linsolve(A,B);

    % step b 
    % update policy
    policyNew = zeros(16,1);
    for i = 1:16
        tmp = zeros(4,1);
        for j = 1:4
            tmp(j) = rew(i,j) + gama*value(delta(i, policy(i)));        
        end
        [~, policyNew(i)] = max(tmp);
    end
    if policyNew == policy
        break
    end
    counter = counter + 1;

end

% verify state sequence
stateSequence = zeros(16,1); stateSequence(1) = s;
for i = 2:16
    stateSequence(i) = delta(stateSequence(i-1), policy(stateSequence(i-1)));
end
walkshow(stateSequence');

end


    