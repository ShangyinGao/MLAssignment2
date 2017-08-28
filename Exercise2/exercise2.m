% Assignment 2 Exercise 2 hidden Markov model
% Date: 2017-08-27
% Author: ShangyinGao
clear;
close all;
clc;

%% load data
A = importdata('A.txt');
B = importdata('B.txt');
pi = importdata('pi.txt');
test = importdata('Test.txt');

% nth repetition 1:10
n = 1;

%% forward procedure
alpha = zeros(12,12);
alphaInit = zeros(12,1);
for i = 1:12
    alphaInit(i) = pi(i)*B(test(1, n),i);
end


% i = 1 -> alpha1
