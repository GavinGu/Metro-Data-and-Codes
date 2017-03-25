function [idx_train,idx_test]=select_train_test_dataset(Inter_Info_Copy)
prob=0.8; % 80% training set, 20% testing set
nP = length(Inter_Info_Copy);
idx_train = randsample(1:nP,round(nP*prob),false);
idx_test = setdiff(1:nP,idx_train);
end