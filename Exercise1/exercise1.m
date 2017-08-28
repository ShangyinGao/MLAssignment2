% Assignment 2 Exercise 1 GMM and EM Algorithm
% Date: 2017-08-19
% Author: ShangyinGao
clear;
clc;
close all;

%% load data
load('dataGMM.mat');
counter = 0;

%% init GMM parameters
[idx, mu] = kmeans(Data',4);
numClasse = [sum(idx==1), sum(idx==2), sum(idx==3), sum(idx==4)];
pi = numClasse/size(Data,2);
sigma = zeros(2,2,4);
for i = 1:4
    labels = find(idx == i);
    sigma(:,:,i) = (Data(:,labels) - repmat(mu(i,:)',1,numClasse(i)))*...
        (Data(:,labels) - repmat(mu(i,:)',1,numClasse(i)))';
end

while 1
%% E-step
p = zeros(300, 4);
for i = 1:4
    p(:,i) = pi(i).*mvnpdf(Data', mu(i, :), sigma(:,:,i));
end
s = sum(p,2);
for i = 1:300
    p(i,:) = p(i,:)/s(i);
end

%% M-step
% update mu sigma and pi
muNew = zeros(4,2);
piNew = zeros(1,4);
sigmaNew = zeros(2,2,4);
nk = sum(p);
piNew = nk/300;
for i = 1:4
    muNew(i, :) = (Data*p(:, i))'/nk(i);
    sumTmp = zeros(2,2);
    for j = 1:300
        sumTmp = sumTmp + p(j,i).*(Data(:, j)-muNew(i,:))*(Data(:, j)-muNew(i,:))';
    end
    sigmaNew(:,:,i) = sumTmp./nk(i);
end

%% check convergence
converge = sum(sumabs((muNew - mu)))+sum(sumabs((sigmaNew-sigma)))+sum(sumabs(piNew-pi));

if converge <= 1e-6
    break
else
mu = muNew;
pi = piNew;
sigma = sigmaNew;
counter = counter + 1;
end

end