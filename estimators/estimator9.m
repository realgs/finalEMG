function [ results ] = estimator9( emg, w, h, duration, g)
%A muscle activity estimator based on Londral et al. algorithm (2013)

if nargin<5
    g=0;
end

emg(1:6,19) = 0;
flag(1:6) = 0;
results(1:6) = 5000;

%data processing
initialMean(1:6) = mean(abs(emg(1:w, 1:6)));
initialStd(1:6) = std(emg(1:w, 1:6));

%evaluation stage
for c = 1:6
    for n = w : length(emg)
        countSubsequent = 0;
        for m = n : n + duration - 1
            if currentFval > initialMean(c) + h * initialStd(c)
                countSubsequent = countSubsequent + 1;
            else
                break
            end
        end
        if flag(c) == 0 && countSubsequent >= duration
            emg(c,19) = n;
            results(c) = emg(c,19) - emg(c,8);
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
        plot(emg(c,19),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
    end
end

end

