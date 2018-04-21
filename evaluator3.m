function [ y ] = evaluator3( in )

%EVALUATOR Summary of this function goes here
%   Detailed explanation goes here

% Initialize y for two objectives and for all x
y = zeros(size(in,1),2); % TEST

%y = zeros(length(signals),2); % ready for vectorization 

%signals - data source - table of 6x5000 signals
load('Alicante.mat');

% emg1 = B01fsbrzuch1;
% emg1(1,9) = 0;
% emg1 = estimator3( emg1 , w , h );


% emg2 = B01fsbrzuch2;
% emg2(1,9) = 0;
% emg2 = estimator3( emg2 , w , h );
% 
% 
% emg3 = B02fsbrzuch1;
% emg3(1,9) = 0;
% emg3 = estimator3( emg3 , w , h );
% 
% 
% emg4 = B02fsbrzuch2;
% emg4(1,9) = 0;
% emg4 = estimator3( emg4 , w , h );
% 
% 
% emg5 = B03fsbrzuch2;
% emg5(1,9) = 0;
% emg5 = estimator3( emg5 , w , h );
% 
% 
% emg6 = B04fsbrzuch1;
% emg6(1,9) = 0;
% emg6 = estimator3( emg6 , w , h );


% emg7 = B04fsbrzuch3;
% emg7(1,9) = 0;
% emg7 = estimator3( emg7 , w , h );
% 
% 
% emg8 = B05fsbrzuch1;
% emg8(1,9) = 0;
% emg8 = estimator3( emg8 , w , h );
% 
% 
% emg9 = B05fsbrzuch2;
% emg9(1,9) = 0;
% emg9 = estimator3( emg9 , w , h );
% 
% 
% emg10 = B05fsbrzuch3;
% emg10(1,9) = 0;
% emg10 = estimator3( emg10 , w , h );


% Error calculation
for n = 1 : size(in,1)
    w = round(in(1));
    h = in(2);
    outliers = 0;
    
    emg11 = B06fsbrzuch1;
    emg11(1,9) = 0;
    res11 = estimator3( emg11 , w , h );
    outliers = outliers + sum(res11>300);

    emg12 = B06fsbrzuch2;
    emg12(1,9) = 0;
    res12 = estimator3( emg12 , w , h );
    outliers = outliers + sum(res12>300);

    emg13 = B06fsbrzuch3;
    emg13(1,9) = 0;
    res13 = estimator3( emg13 , w , h );
    outliers = outliers + sum(res13>300);

    emg14 = B06fsbrzuch4;
    emg14(1,9) = 0;
    res14 = estimator3( emg14 , w , h );
    outliers = outliers + sum(res14>300);

    emg15 = B07fsbrzuch1;
    emg15(1,9) = 0;
    res15 = estimator3( emg15 , w , h );
    outliers = outliers + sum(res15(5:6)>300);

    emg16 = B07fsbrzuch2;
    emg16(1,9) = 0;
    res16 = estimator3( emg16 , w , h );
    outliers = outliers + sum(res16>300);

    emg17 = B09fsbrzuch1;
    emg17(1,9) = 0;
    res17 = estimator3( emg17 , w , h );
    outliers = outliers + sum(res17>300);

    emg18 = B09fsbrzuch2;
    emg18(1,9) = 0;
    res18 = estimator3( emg18 , w , h );
    outliers = outliers + sum(res18>300);

    emg19 = B10fsbrzuch1;
    emg19(1,9) = 0;
    res19 = estimator3( emg19 , w , h );
    outliers = outliers + sum(res19>300);
    
    emg20 = B10fsbrzuch2;
    emg20(1,9) = 0;
    res20 = estimator3( emg20 , w , h );
    outliers = outliers + sum(res20>300);
    
    %y(1) = ( sum(res20) + sum(res19) + sum(res18) + sum(res17) + sum(res16) + sum(res15(5:6)) + sum(res14) + sum(res13) + sum(res12) + sum(res11) ) / 56;
    y(1) = ( sum(abs(res20))+sum(abs(res19))+sum(abs(res18))+sum(abs(res17))+sum(abs(res16))+sum(abs(res15(5:6)))+sum(abs(res14))+sum(abs(res13))+sum(abs(res13))+sum(abs(res12))+sum(abs(res11))  )/56;%(sum(abs(emg20(1:6,8) - emg20(1:6,9))) )/6;%+ sum(abs(emg2(1:6,8) - emg2(1:6,9))) + sum(abs(emg3(1:6,8) - emg3(1:6,9))) + sum(abs(emg4(1:6,8) - emg4(1:6,9))) + sum(abs(emg5(1:6,8) - emg5(1:6,9))) + sum(abs(emg6(2:6,8) - emg6(2:6,9))) + sum(abs(emg7(1:6,8) - emg7(1:6,9))) + sum(abs(emg8(5:6,8) - emg8(5:6,9))) + sum(abs(emg9(1:6,8) - emg9(1:6,9))) + sum(abs(emg10(1:6,8) - emg10(1:6,9))) + sum(abs(emg11(1:6,8) - emg11(1:6,9))) + sum(abs(emg12(1:6,8) - emg12(1:6,9))) + sum(abs(emg13(1:6,8) - emg13(1:6,9))) + sum(abs(emg14(1:6,8) - emg14(1:6,9))) + sum(abs(emg15(5:6,8) - emg15(5:6,9))) + sum(abs(emg16(1:6,8) - emg16(1:6,9))) + sum(abs(emg17(1:6,8) - emg17(1:6,9))) + sum(abs(emg18(1:6,8) - emg18(1:6,9))) + sum(abs(emg19(1:6,8) - emg19(1:6,9))) + sum(abs(emg20(1:6,8) - emg20(1:6,9))) ) / 111;  % meanError
    y(2) = outliers;
    %sum(abs(res20)>150); %sum(abs(emg20(1:6,8) - emg20(1:6,9))>150);%+ sum(abs(emg2(1:6,8) - emg2(1:6,9))>150)+ sum(abs(emg3(1:6,8) - emg3(1:6,9))>150)+ sum(abs(emg4(1:6,8) - emg4(1:6,9))>150)+ sum(abs(emg5(1:6,8) - emg5(1:6,9))>150)+ sum(abs(emg6(2:6,8) - emg6(2:6,9))>150)+ sum(abs(emg7(1:6,8) - emg7(1:6,9))>150)+ sum(abs(emg8(5:6,8) - emg8(5:6,9))>150)+ sum(abs(emg9(1:6,8) - emg9(1:6,9))>150)+ sum(abs(emg10(1:6,8) - emg10(1:6,9))>150)+ sum(abs(emg11(1:6,8) - emg11(1:6,9))>150)+ sum(abs(emg12(1:6,8) - emg12(1:6,9))>150)+ sum(abs(emg13(1:6,8) - emg13(1:6,9))>150)+ sum(abs(emg14(1:6,8) - emg14(1:6,9))>150)+ sum(abs(emg15(5:6,8) - emg15(5:6,9))>150)+ sum(abs(emg16(1:6,8) - emg16(1:6,9))>150)+ sum(abs(emg17(1:6,8) - emg17(1:6,9))>150)+ sum(abs(emg18(1:6,8) - emg18(1:6,9))>150)+ sum(abs(emg19(1:6,8) - emg19(1:6,9))>150)+ sum(abs(emg20(1:6,8) - emg20(1:6,9))>150); %nOfOutliers
end
  %y(2) = abs(emg1(7,8) - emg1(7,9)) + abs(emg2(7,8) - emg2(7,9));
%%TEST
%for n = 1 : size(in,1)
%    y(n,1) =  (w - 50)^2 + 10 - h; % meanError
%    y(n,2) =  (w - h)^2; % nOfOutliers
%end

end

