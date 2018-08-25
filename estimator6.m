function [ result ] = estimator6( emg, w, h, duration, poolSize, g)
%A muscle activity estimator based on Lidierth algorithm

if nargin<6
    g=0;
end

emg(1:6,16) = 0;
flag(1:6) = 0;
result(1:6) = 5000;

%data processing
initialMean(1:6) = mean(abs(emg(1:w, 1:6)));
initialStd(1:6) = std(emg(1:w, 1:6));

%evaluation stage
for c = 1:6
    for n = w : length(emg) - poolSize
        countAll = 0;
        countSubsequent = 0;
        isSubsequent = 1;
        for m = n : n + poolSize
            currentMean = mean(abs(emg(m-w+1:m, c)));
            currentFVal = (currentMean - initialMean(c)) / initialStd(c);
            if currentFVal > h
                if isSubsequent == 1
                    countSubsequent = countSubsequent + 1;
                end
                countAll = countAll + 1;
            else
                isSubsequent = 0;
            end
        end
        
        if flag(c) == 0 &&  countSubsequent >= duration && countAll >= 1
            emg(c,16) = n;
            result(c) = emg(c,16);% - emg(c,8);
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
        plot(emg(c,16),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
    end
end

end

