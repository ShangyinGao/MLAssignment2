% Assignment 2 Exercise 1 GMM and EM Algorithm
% Date: 2017-08-19
% Author: ShangyinGao

%% load data
load('dataGMM.mat');
% visualization Data
Data = Data';
scatter(Data(:, 1), Data(:, 2));
hold on;

%% init GMM parameters
pi = [1/4, 1/4, 1/4, 1/4]';
[idx, mu] = kmeans(Data, 4);
sigma = zeros(4,2);
for i = 1:4
    for j = 1:2
            
        tmp = Data(idx==i, :);
        sigma(i,j) = var(tmp(j,:));
        
    end
end
% visualization mu
scatter(mu(:, 1), mu(:, 2), '*');
hold on;

%% E-step
p = zeros(300, 4);
for i = 1:300
    tmp = 0;
    for k = 1:4
        tmp = tmp + pi(k)*mvnpdf(Data(i, :), mu(k, :), sigma(k, :));
    end
    for j = 1:4
        % ith data, jth class
        p(i,j) = (pi(j)*mvnpdf(Data(i, :), mu(j, :), sigma(j, :)))/(tmp);
    end
end

%% M-step
% update mu
muNew = zeros(4, 2);
piNew = zeros(1, 4);
sigmaNew = zeros(4, 2);
nk = sum(p);
for i = 1:4
    muNew(i, :) = (Data'*p(:, i))'/nk(i);
    sigmaNew(i, :) = ((Data-repmat(muNew(i, :), 300, 1)).^2'*p(:, i))/nk(i);
    piNew(i) = nk(i)/300;
end
% visualization muNew
scatter(muNew(:, 1), muNew(:, 2), 'd');
hold on;

%% check convergence
% likelihood 
lh = 0;
tmp = 0;
for i = 1:300
    for j = 1:4
        tmp = tmp + log(pi(j)*mvnpdf(Data(i, :), mu(j, :), sigma(j, :)));
    end
    lh = lh + tmp;
end