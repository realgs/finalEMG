function [ result ] = estimator3( emg, w, h, g)
%A muscle activity estimator based on a mathematical model of a signal (1st phase) and
%the precise detection (2nd phase) based on signal sign changes.
if nargin<4
    g=0;
end

emg(1:6,13) = 0;
variances = zeros(length(emg),6);
flag(1:6) = 0;
result(1:6) = 5000;

%halving the window size - rounding to the nearest even value
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
%calculate sign changes around beginnings
for c = 1:6
    for n = emg(c,13) - 250 : emg(c,13) + 250
        currentVar = variances(n,c);
        if currentVar > thresholdVar(c) && flag(c) == 0 
           result(c) = emg(c,13) - emg(c,8);
           flag(c) = 1;
        end
    end
end
%data visualization
if g==1
    for c=1:6
        figure('units','normalized','outerposition',[0 0 1 1]);
        %set(gcf,'color','w');
        subplot(2,1,1);
        plot(emg(:,c));
        title('EMG Signal','FontSize',16);
        %for scatter:
        %Xs = [1:length(emg)];
        %scatter(Xs,emg(:,c));
        
        xlabel('t = [ms]')
        ylabel('EMG = [mv]')

        hold on;
        plot(xlim, [0 0], '-k')
        plot(emg(c,13),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
        
        subplot(2,1,2);
        plot(variances(:,c));
        title('Signal Variance','FontSize',16);
        hold on;
        plot(xlim, [thresholdVar(c) thresholdVar(c)], '-g')
        plot(xlim, [highVar(c) highVar(c)], '-k')
        plot(xlim, [initialVar(c) initialVar(c)], '-r')
        hold off;
    end
end

end

