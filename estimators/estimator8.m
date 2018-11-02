function [ results ] = estimator8( emg, w1, w2, h, g)
%A muscle activity estimator based on Silva et al. algorithm (2012)

if nargin<5
    g=0;
end

emg(1:6,18) = 0;
flag(1:6) = 0;
results(1:6) = 5000;

if w2 < w1
    beginning = w1;
else
    beginning = w2;
end

%evaluation stage
for c = 1:6
    for n = beginning : length(emg)
        currentFval = mean(abs(emg(n-w1+1 : n, c)));
        currentAdaptiveThreshold = mean(abs(emg(n-w2+1 : n, c)));
        if currentFval >= currentAdaptiveThreshold && currentFval >= h
            emg(c,18) = n;
            results(c) = emg(c,18) - emg(c,8);
            break
        end
    end
end

%data visualization
if g==1
    for c=1:6
        figure('units','normalized','outerposition',[0 0 1 1]);
        %set(gcf,'color','w');
        plot(emg(:,c));
        title('EMG Signal','FontSize',16);
        %for scatter:
        %Xs = [1:length(emg)];
        %scatter(Xs,emg(:,c));
        
        xlabel('t = [ms]')
        ylabel('EMG = [mv]')
        
        hold on;
        plot(xlim, [0 0], '-k');
        plot(emg(c,18),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
    end
end

end

