function [mu1,Sigma1,prior1]= estimate_parameter(Inter_Info_Copy,idx_train,Q,aa1,aa2,O)
mu1 = zeros(O,Q);
Sigma1 = zeros(O,O,Q);
prior1 = zeros(Q,1);

% warpping data 
Xall = [];
rng(1);
for n=1:length(idx_train)
    dataTrain = Inter_Info_Copy(idx_train(n)).Feature;
    Xall = [Xall;dataTrain];
end

% calculate mu, sigma and prior distribution for CRF
for i=1:10
    xtemp = Xall(Xall(:,3)==i,[1,2]);
    xtemp(:,1) = hpfilter(xtemp(:,1),aa1); %remove outliers
    xtemp(:,2) = hpfilter(xtemp(:,2),aa2); %remove outliers
    mu1(:,i) = mean(xtemp)';
    Sigma1(:,:,i) = cov(xtemp);
    prior1(i) = length(xtemp)/length(Xall(:,3));
end

end