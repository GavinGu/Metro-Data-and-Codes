clear;
clc;
addpath(genpath('./CRFall'))
addpath(genpath('../dataset'))
load Interchange_data.mat

O = 2; % number of observations
Q = 10; % number of states
aa1 = 0.1; % noise outlier parameter
aa2 = 0.2;% noise outlier parameter
rng(1);
[idx_train,idx_test]=select_train_test_dataset(Interchange_data); %select train and test dataset 
[mu1,Sigma1,prior1]= estimate_parameter(Interchange_data,idx_train,Q,aa1,aa2,O); %random select train and test dataset
[Ytrue, Ypred]=CRF_func(Q,Interchange_data,idx_train,idx_test,prior1,mu1,Sigma1,aa1,aa2);
[precision,recall,F1]=evaluation_function2(Ytrue,Ypred);

