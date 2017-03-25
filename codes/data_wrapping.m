function [x,y,u,v]= data_wrapping(user_labels)
FeatureSet=[];
LabelSet=[];
for u=1:1:length(user_labels)
  datelst=user_labels(u).data
  %train
  for d=1:1:length(datelst)
     FeatureSet=[FeatureSet;datelst(d).feature(:,1:5)];
     LabelSet=[LabelSet;datelst(d).feature(:,6)];
  end
end
c = cvpartition(LabelSet,'holdout',.2);  

% Create a training set
x = FeatureSet(training(c,1),:);
y = LabelSet(training(c,1));

% test set
u=FeatureSet(test(c,1),:);
v=LabelSet(test(c,1),:);
end