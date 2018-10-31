%script that helps find a considerably good input parameters by applying brute search
best = 5000;
bestParam = [0 0];

for m = 2.2 : 0.4 : 15
    for w = 80 : 4 : 200
        tempBest = mean(abs(estimator2(B01fsbrzuch1, m, w, 0)));
        if tempBest < best
            best = tempBest;
            bestParam = [m w];
        end
    end
end

best 
bestParam