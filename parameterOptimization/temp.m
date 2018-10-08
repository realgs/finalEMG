lb = [150 100];
ub = [200 120];

fun = @(x) evaluator3test( x(1), x(2) ); 
x = ga(fun,2,[],[],[],[],lb,ub,[],[1,2])

function [ y ] = evaluator3test( w, h )

    load('database.mat');

%     outliers = 0;
     emg20 = B10fsbrzuch2;
     emg20(1,9) = 0;
     res20 = estimator3( emg20 , w , h );
%     outliers = outliers + sum(res20>200);

    y = sum(abs(res20)) / 6;
%    y(1) = outliers;

end