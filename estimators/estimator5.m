function [ results ] = estimator5( emg, h, duration, numOfAllActive, poolSize, g)
%A muscle activity estimator based on Bonato et al. algorithm

if nargin<6
    g=0;
end

w = 100;

emg(1:6,15) = 0;
flag(1:6) = 0;
results(1:6) = 5000;

%data processing
initialVar(1:6) = var(emg(1:w, 1:6));

%evaluation stage
for c = 1:6
    for n = 3 : 2 : length(emg) - poolSize
        countAll = 0;
        countSubsequent = 0;
        isSubsequent = 1;
        for m = n : n + poolSize
            currentFVal = (emg(m-1, c)^2 + emg(m, c)^2) / initialVar(c);
            if currentFVal > h
                if isSubsequent == 1
                    countSubsequent = countSubsequent + 1;
                end
                countAll = countAll + 1;
            else
                isSubsequent = 0;
            end
        end
        
        if flag(c) == 0 && countSubsequent >= duration && countAll >= numOfAllActive
            emg(c,15) = n;
            results(c) = emg(c,15) - emg(c,8);
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
        plot(emg(c,15),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
    end
end

end

