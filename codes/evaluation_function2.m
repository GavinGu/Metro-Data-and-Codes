function [precision,recall, F1]=evaluation_function2(Ytrue,Ypred)

% define precision, recall f1
precision = @(confusionMat) diag(confusionMat)./sum(confusionMat,2);
recall = @(confusionMat) diag(confusionMat)./sum(confusionMat,1)';
f1Scores = @(confusionMat) 2*(precision(confusionMat).*recall(confusionMat))./(precision(confusionMat)+recall(confusionMat));


C0 = confusionmat(Ytrue,Ypred);
C = bsxfun(@rdivide, C0, sum(C0,2));
confMat = confMatGet(Ytrue,Ypred)
opt=confMatPlot('defaultOpt');
opt.className={'UEL', 'DEL', 'UES', 'DES', 'WUS', 'WDS', 'WAI', 'WTP', 'WDE', 'WUE'};
% % === Example 1: Data count plot
% opt.mode='dataCount';
% figure; confMatPlot(confMat, opt);
% % === Example 2: Percentage plot
opt.mode='percentage';
opt.format='8.2f';
figure; confMatPlot(confMat, opt);
% % === Example 3: Plot of both data count and percentage
% opt.mode='both';
% figure; confMatPlot(confMat, opt);

precision=precision(C0);
recall=recall(C0);
F1=f1Scores(C0);
end
