
function [ result ] = estimator7( emg, h, duration, g)
%A muscle activity estimator based on Solnik et al. algorithm (TKOperator)

if nargin<4
    g=0;
end

emg(1:6,17) = 0;
flag(1:6) = 0;
result(1:6) = 5000;
energyLevels = zeros(length(emg),6);

%data processing
initialMean(1:6) = mean(abs(emg(1:100, 1:6)));
initialStd(1:6) = std(emg(1:100, 1:6));

%evaluation stage
for c = 1:6
    for n = 2 : length(emg) - 1
        energyLevels(n, c) = abs(emg(n, c)^2 - emg(n-1, c) * emg(n+1, c));
        countSubsequent = 0;
        for m = n : n + duration - 1
            currentEnergy = abs(emg(m, c)^2 - emg(m-1, c) * emg(m+1, c));
            if currentEnergy > initialMean(c) + h * initialStd(c) 
                countSubsequent = countSubsequent + 1;
            else
                break
            end
        end
        
        if flag(c) == 0 && countSubsequent >= duration
            emg(c,17) = n;
            result(c) = emg(c,17) - emg(c,8);
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
        plot(emg(c,17),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
        
        subplot(2,1,2);
        plot(energyLevels(:,c));
        title('Signal Variance','FontSize',16);
        hold on;
        plot(xlim, [(initialMean(c) + h * initialStd(c)) (initialMean(c) + h * initialStd(c))], '-g')
        hold off;
    end
end

end

