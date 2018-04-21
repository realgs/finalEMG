function [ result ] = estimator3( emg, w, h, g)
%A muscle activity estimator based on the difference between maximal and
%initial variance
if nargin<4
    g=0;
end

emg(1:6,13) = 0;
variances = zeros(length(emg),6);
Xs = [1:length(emg)];
flag(1:6) = 0;
result(1:6) = 5000;

%calculating a half of the window size - rounding to the nearest even value
w2 = round(w/2);

%data processing
initialVar(1:6) = var(emg(1 : w2 * 2 + 1,1:6));

%highVar(1:6) = var( emg(maxId(1:6) - w2 : maxId(1:6) + w2,1:6));
for c = 1:6
    for n = 1 + w2 : length(emg) - w2
        variances(n,c) = var(emg(n - w2 : n + w2, c));
    end
end
highVar(1:6) = max( variances(:,1:6) );

thresholdVar = initialVar(1:6) + (highVar(1:6) - initialVar(1:6)) * h;

%evaluation stage
for c = 1:6
    for n = 1 + w2 : length(emg) - w2
        currentVar = variances(n,c);
        if currentVar > thresholdVar(c) && flag(c) == 0 
           emg(c,13) = n;
           result(c) = emg(c,13) - emg(c,8);
           flag(c) = 1;
        end
    end
end

%data visualization
if g==1
    for c=1:6
        figure();
        set(gcf,'color','w');
        %figure('units','normalized','outerposition',[0 0 1 1]);
        subplot(2,1,1);
        plot(emg(:,c));
        %scatter(Xs,emg(:,c));
        title('Original EMG Signal','FontSize',16)
        xlabel('t = [ms]')
        ylabel('EMG = [mv]')

        hold on;
        plot(xlim, [0 0], '-k')
        plot(emg(c,13),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
        
        subplot(2,1,2);
        plot(variances(:,c));
        hold on;
        plot(xlim, [thresholdVar(c) thresholdVar(c)], '-g')
        plot(xlim, [highVar(c) highVar(c)], '-k')
        plot(xlim, [initialVar(c) initialVar(c)], '-r')
        hold off;
    end
end

end

