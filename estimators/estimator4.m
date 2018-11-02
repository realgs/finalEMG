function [ results ] = estimator4( emg, w, h, g)
%A muscle activity estimator based on Hodges and Bui algorithm

if nargin<4
    g=0;
end

emg(1:6,14) = 0;
flag(1:6) = 0;
results(1:6) = 5000;

%data processing
initialMean(1:6) = mean(abs(emg(1:w, 1:6)));
initialStd(1:6) = std(emg(1:w, 1:6));

%evaluation stage
for c = 1:6
    for n = w + 1 : length(emg)
        currentMean = mean(abs(emg(n-w+1:n, c)));
        currentFVal = currentMean - initialMean(c);
        if flag(c) == 0 && currentFVal > h * initialStd(c)^2
            emg(c,14) = n;
            results(c) = emg(c,14) - emg(c,8);
            flag(c) = 1;
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
        plot(emg(c,14),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
    end
end

end

