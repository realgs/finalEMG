function [ results ] = estimator1( emg, windowSize, h, g)
%A muscle activity estimator called SignModel based on a mathematical model of sEMG signal (1st phase) and
%the precise detection (2nd phase) based on signal sign changes.
if nargin<4
    g=0;
end

emg(1:6,10) = 0;
variances = zeros(length(emg),6);
initialOnsets(1:6) = 5000;
results(1:6) = 5000;

%halving the window size - rounding to the nearest even value
smallWindow = round(windowSize/2);

%data processing
initialVar = var(emg(1 : windowSize * 2 + 1,1:6));

for c = 1:6
    for n = 1 + windowSize : length(emg) - windowSize
        variances(n,c) = var(emg(n - windowSize : n + windowSize, c));
    end
end
activVar = max( variances(:,1:6) );
thresholdVar = initialVar + (activVar - initialVar) * h;
thresholdVar2 = initialVar + (activVar - initialVar) * 1.5 * h;
thresholdVar3 = initialVar + (activVar - initialVar) * 2 * h;

%evaluation stage
%1st phase
for c = 1:6
    for n = 1 + windowSize : length(emg) - windowSize
        if variances(n,c) > thresholdVar(c) && variances(n + smallWindow,c) > thresholdVar2(c) && variances(n + windowSize,c) > thresholdVar3(c)
            initialOnsets(c) = n;
            break
        end
    end
end
%2nd phase
%for c = 1:6
    [results, emg] = estimator2(emg, 7, windowSize, initialOnsets, initialOnsets - smallWindow, initialOnsets + smallWindow, 1);
%end


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
        plot(emg(c,10),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
        
        subplot(2,1,2);
        plot(variances(:,c));
        title('Signal Variance','FontSize',16);
        hold on;
        plot(xlim, [thresholdVar(c) thresholdVar(c)], '-g')
        plot(xlim, [activVar(c) activVar(c)], '-k')
        plot(xlim, [initialVar(c) initialVar(c)], '-r')
        hold off;
    end
end

end

