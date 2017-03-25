function [Ytrue,Ypred]=CRF_func(Q,Inter_Info_Copy,idx_train,idx_test,prior1,mu1,Sigma1,aa1,aa2)
%Estimate the transitional probability, has to update for each chain
transmat1 = zeros(Q,Q);
for n=1:length(idx_train)
    ytemp = Inter_Info_Copy(idx_train(n)).Feature(:,3);
    T = length(ytemp);
    for t=2:T
        transmat1(ytemp(t-1),ytemp(t)) = transmat1(ytemp(t-1),ytemp(t)) + 1;
    end
end
transmat1 = bsxfun(@rdivide, transmat1, sum(transmat1,2));

%% inference, the viterbi algorithm is used
prior = prior1;
transmat = transmat1;
mu = mu1;
Sigma = Sigma1;
mixmat = ones(10,1)/10;
Ytrue = [];
Ypred = [];
for j=1:length(idx_test)
    Xdata = (Inter_Info_Copy(idx_test(j)).Feature(:,[1,2]))';
    Xdata(1,:) = hpfilter(Xdata(1,:),aa1);  % remove outliers
    Xdata(2,:) = hpfilter(Xdata(2,:),aa2);  % remove outliers
    Ydata = (Inter_Info_Copy(idx_test(j)).Feature(:,3))';
    B = mixgauss_prob(Xdata, mu, Sigma, mixmat);
    [path] = viterbi_path(prior, transmat, B); % this is the predicted value
    fprintf('ACC for task %d is %f\n',j,mean(Ydata==path));
    Ytrue = [Ytrue Ydata];
    Ypred = [Ypred path];
end
