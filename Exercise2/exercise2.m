% Assignment 2 Exercise 2 hidden Markov model
% Date: 2017-08-27
% Author: ShangyinGao

%% load data
A = importdata('A.txt');
B = importdata('B.txt');
pi = importdata('pi.txt');
test = importdata('Test.txt');
% class memory
class = zeros(1, 10);
loglikelihood = 0;

%% nth repetition 1:10
for n = 1:10;

%% forward procedure
% 
alpha = zeros(12,60);
alphaInit = zeros(12,1);

% calculate alphaInit
for i = 1:12
    alphaInit(i) = pi(i)*B(test(1, n),i);
end
alpha(:, 1) = alphaInit;

% calculate alpha
sumAlpha = zeros(12,1);
for i = 2:60
    for j = 1:12
        for k = 1:12
            sumAlpha(k) = alpha(k, i-1).*A(k,j);
        end    
        alpha(j, i) = sum(sumAlpha).*B(test(i, n), j);
        
    end
    
end

%% log likelihood
loglikelihood = log(sum(alpha(:, 60)));
if loglikelihood > -120
    class(n) = 1;
else
    class(n) = 2;
end

end

class
