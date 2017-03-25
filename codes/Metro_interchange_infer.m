% workflow of first layer
clear;
clc;
addpath(genpath('../dataset'));
load User_info.mat;
[x,y,u,v]=data_wrapping(user_label_copy);
% cost parameter setting: 
alpha=1;
belta=1.05;
pv=cost_sensitive_naive_bayies(x,y,u,v,alpha,belta);
[p,r,f]=evaluate_function(v,pv);

In_Metro=[ 'Precision:', num2str(p(1,1)), '  Recall:', num2str(r(1,1)),'  F1:',num2str(f(1,1))]
Interchange=[ 'Precision:', num2str(p(2,1)), '  Recall:', num2str(r(2,1)),'  F1:',num2str(f(2,1))]


