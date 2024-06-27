function [k, h, Tambient, meshSize, Tsink, epsilon, maxEpochs, lambda1, lambda2, deltap, learningRate] = metaInitialization()
    clc; clearvars; close all; format compact;
    k = 237; %thermal conductivity for aluminum
    h = 7; %heat transfer coefficient b/w aluminum and air
    Tambient = 293; %ambient temperature in Kelvin
    meshSize = 0.050; %maximum mesh size
    Tsink = 473; %temperature at the heat sink boundary
    epsilon = 0.02; %condition for |J(k) - J(k - 1)| > epsilon
    maxEpochs = 1000; %maximum number of epochs before terminating
    lambda1 = 1; %weight for area
    lambda2 = 1; %weight for average temperature
    deltap = 0.001; %for perturbation
    learningRate = 0.1; %gradient descent algorithm learning rate
end