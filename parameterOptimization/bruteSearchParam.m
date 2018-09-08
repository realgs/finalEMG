%script that helps find a considerably good input parameters by applying brute search
best = [5000 5000 5000 5000 5000 5000];
bestArg = 0;
for n = 0.000000000001:0.0000002:0.0001
    result = estimator7(emg11, n, 3);
    if sum(result) < sum (best)
        best = result;
        bestArg = n;
    end
end
bestArg
sum(best)/6