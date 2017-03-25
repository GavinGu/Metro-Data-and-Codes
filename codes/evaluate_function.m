function [precision, recall, F1]=evaluate_function(v,pv)
% define precision, recall f1
precision = @(confusionMat) diag(confusionMat)./sum(confusionMat,2);
recall = @(confusionMat) diag(confusionMat)./sum(confusionMat,1)';
f1Scores = @(confusionMat) 2*(precision(confusionMat).*recall(confusionMat))./(precision(confusionMat)+recall(confusionMat));

CMat=confusionmat(v,pv);

precision=precision(CMat);
recall=recall(CMat);
F1=f1Scores(CMat);

opt=confMatPlot('defaultOpt');
opt.className={'In Metro', 'Interchange'};
% % === Example 1: Data count plot
% opt.mode='dataCount';
% figure; confMatPlot(confMat, opt);
% % === Example 2: Percentage plot
opt.mode='percentage';
opt.format='8.2f';
figure; confMatPlot(CMat, opt);

end