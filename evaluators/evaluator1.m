function [avg, absMean] = evaluator1(windowSize,threshold)
%The evaluator for estimator1
load('database.mat')
results = zeros(10,6);
results(1, :) = estimator1(emg1, windowSize, threshold, 0);
results(2, :) = estimator1(emg2, windowSize, threshold, 0);
results(3, :) = estimator1(emg3, windowSize, threshold, 0);
results(4, :) = estimator1(emg4, windowSize, threshold, 0);
results(5, :) = estimator1(emg5, windowSize, threshold, 0);
results(6, :) = estimator1(emg6, windowSize, threshold, 0);
results(7, :) = estimator1(emg7, windowSize, threshold, 0);
results(8, :) = estimator1(emg8, windowSize, threshold, 0);
results(9, :) = estimator1(emg9, windowSize, threshold, 0);
results(10, :) = estimator1(emg10, windowSize, threshold, 0);
avg = mean(results(:));
absMean = mean(abs(results(:)));

end

