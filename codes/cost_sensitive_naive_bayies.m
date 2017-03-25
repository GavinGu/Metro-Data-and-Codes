function pv=cost_sensitive_naive_bayies(x,y,u,v,alpha,belta)
yu=unique(y);
nc=length(yu); % number of classes
ni=size(x,2); % independent variables
ns=length(v); % test set
P=[];
mu=[];
sigma=[];
fy=[];

% compute class probability
for i=1:nc
    fy(i)=sum(double(y==yu(i)))/length(y);
end
C12=(fy(2)/fy(1))^alpha;  % mistake 1 to 2;
C21=(fy(1)/fy(2))^belta;  % mistake 2 to 1;

% cost matrix
cost_matrix=[0 (fy(2)/fy(1))^alpha;
    (fy(1)/fy(2))^belta 0] ;

% parameters from training set
for i=1:nc
    xi=x((y==yu(i)),:);
    mu(i,:)=mean(xi,1);
    sigma(i,:)=std(xi,1);
end

% probability for test set
for j=1:ns
    fu=normpdf(ones(nc,1)*u(j,:),mu,sigma);
    P(j,:)=fy.*prod(fu,2)';
end

Normalized_P=[P(:,1)./sum(P,2) P(:,2)./sum(P,2)];
Risk=Normalized_P*cost_matrix;

% get predicted output for test set
[pv0,id]=min(Risk,[],2);
for i=1:length(id)
    pv(i,1)=yu(id(i));
end

end