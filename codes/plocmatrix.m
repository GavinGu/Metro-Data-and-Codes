desired=[1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 5 5];
computed=[1 5 5 1 1 1 1 1 5 5 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 2 5 5 5 5 5 5 5 5 3 5 5 5];
%confMat = confMatGet(desired, computed);
confMat = confMatGet(Ytrue,Ypred)
opt=confMatPlot('defaultOpt');
opt.className={'Case 1', 'Case 2', 'Case 3', 'Case 4', 'Case 5', 'Case 6', 'Case 7', 'Case 8', 'Case 9', 'Case 10'};
% === Example 1: Data count plot
opt.mode='dataCount';
figure; confMatPlot(confMat, opt);
% === Example 2: Percentage plot
opt.mode='percentage';
opt.format='8.2f';
figure; confMatPlot(confMat, opt);
% === Example 3: Plot of both data count and percentage
opt.mode='both';
figure; confMatPlot(confMat, opt);