function [ results ] = estimatorX( emg, windowSize, rampDuration , h, g)
%A muscle activity estimator called SignModel based on a mathematical model of sEMG signal (1st phase) and
%the precise detection (2nd phase) based on signal sign changes.
if nargin<4
    g=0;
end

emg(1:6,10) = 0;
variances = zeros(length(emg),6);
initialOnsets(1:6) = 5000;
results(1:6) = 5000;

%halving the window size - rounding to the nearest integer value
smallWindow = round(windowSize/2);

%data processing
initialVar = var(emg(1 : rampDuration,1:6));

for c = 1:6
    for n = 1 + windowSize : length(emg) - windowSize
        variances(n, c) = var(emg(n - windowSize : n + windowSize, c));
    end
end
activVar = max(variances(:, 1:6));

thresholdVar1 = initialVar + (activVar - initialVar) * h;
thresholdVar2 = initialVar + (activVar - initialVar) * 1.5 * h;
thresholdVar3 = initialVar + (activVar - initialVar) * 2 * h;

%evaluation stage
%1st phase
for c = 1:6
    for n = 1 + windowSize : length(emg) - windowSize
        if variances(n,c) > thresholdVar1(c) && variances(n + smallWindow,c) > thresholdVar2(c) && variances(n + windowSize,c) > thresholdVar3(c)
            initialOnsets(c) = n;
            break
        end
    end
end

%2nd phase
emgCopy = emg;
[results, emg] = estimator2(emg, 7, windowSize, initialOnsets, initialOnsets - smallWindow, initialOnsets + smallWindow, 1);


%estimatorX temp algorithm
% xWindowSize = 1;
% xValues = zeros(length(emg),6);
% for c = 1:6
%     for n = 1 + xWindowSize : length(emg) - xWindowSize
%         xValues(n, c) = 1 / (emg(n, 1) * emg(n-1, 1) * emg(n+1, 1));
%     end
% end

%Variance temp algorithm
% varWindowSize = 40;
% varValues = zeros(length(emg),6);
% for c = 1:6
%     for n = 1 : length(emg) - varWindowSize
%         varValues(n, c) = 20 * var(emg(n:n+varWindowSize, c));
%     end
% end
% 
conditions = zeros(length(emg),6);
for c = 1:6
    for n = 1 + windowSize : length(emg) - windowSize
        conditionPassed = -0.1;
        if variances(n,c) > thresholdVar1(c) && variances(n + smallWindow,c) > thresholdVar2(c) && variances(n + windowSize,c) > thresholdVar3(c) && variances(n, c) < variances(n + rampDuration, c)
            conditionPassed = -0.02;
        end
        conditions(n,c) = conditionPassed;
    end
end

%data visualization
if g == 1
    for c = 1:1
        figure('units','normalized','outerposition',[0 0 1 1]);
        xlabel('t = [ms]')
        ylabel('EMG = [mv]')
        %set(gcf,'color','w');
        %subplot(2,1,1);
        title('EMG Signal','FontSize',16);
        plot(emg(:,c));
        %for scatter:
        %Xs = [1:length(emg)];
        %scatter(Xs,emg(:,c));
        
        hold on;         
        plot(100 * variances(:,c),'g.');
        plot(conditions(:,c),'r.');
        
        plot(xlim, [0 0], '-k')
        plot(xlim, [thresholdVar1(c)*100 thresholdVar1(c)*100], '-k')
        plot(xlim, [thresholdVar2(c)*100 thresholdVar2(c)*100], '-k')
        plot(xlim, [thresholdVar3(c)*100 thresholdVar3(c)*100], '-k')
        plot(emg(c,10),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
        
%         subplot(2,1,2);
%         title('Signal Variance','FontSize',16);
%         %plot(variances(:,c));
%         %X
%         plot(varValues(:,c),'g.');
%         hold on;
% %         plot(xlim, [thresholdVar(c) thresholdVar(c)], '-g')
% %         plot(xlim, [activVar(c) activVar(c)], '-k')
% %         plot(xlim, [initialVar(c) initialVar(c)], '-r')
%         hold off;
    end
end

end

