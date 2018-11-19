function [results, emg] = estimator2(emg, k, windowSize, initialOnsets, starts, stops, ensemble, g)
%A muscle activity estimator based on signal sign changes.

smallWindow = round(windowSize / 2);
% Set inputs if too few arguments given
if nargin < 4
    starts = ones(1,6) * smallWindow;
end
if nargin < 5
    stops = ones(1,6) * (size(emg,1) - smallWindow);
end
if nargin < 7
    ensemble = 0;
end
if nargin < 8
    g = 0;
end

if ensemble == 1
    writeDest = 10;
    emg(1:6, 10) = initialOnsets;
else 
    writeDest = 9;
end

if starts < smallWindow
    starts = ones(1,6) * smallWindow;
end
if stops > (size(emg,1) - smallWindow)
   stops = ones(1,6) * (size(emg,1) - smallWindow);
end

k(1:6) = k / 10;
d(1:6) = 0.04;
results(1:6) = 5000;
h = ones(1, 6);
variabilities = zeros(5000,6);
derivatives = diff(emg(:, 1:6));
signsTable = sign(emg);

%Counting sign changes combined with higher values of derivatives
for c = 1:6
    if max(abs(derivatives(1:smallWindow,c))) < 0.035 && max(abs(emg(:,c))) < 0.31
        d(c) = 0.0005;
        k(c) = 1.3;
    end
    if max(abs(derivatives(1:smallWindow,c))) < 0.015 && max(abs(emg(:,c))) < 0.1
        d(c) = 0.00001;
        k(c) = 1.5;
    end
    h(c) = (max(abs(derivatives(1:smallWindow,c))) + d(c)) * k(c);
    %h(c) = (mean(abs(diff(emg(1:largeWindow,c))))+0.005) * k(c) * (max(emg(:,c))+0.75);
    %h(c) = k(c);
    
    for i = starts(c):stops(c)
        counter = 0;
        %            actVar = var(emg(i-smallWindow+1:i+smallWindow-1,c));
        %            noiseVar = var(emg(1:windowSize-2,c));
        for j=(i - smallWindow + 1):(i + smallWindow - 1)
            if(signsTable(j,c) == signsTable(j+1,c) && derivatives(j,c) > h(c))
                counter = counter + 1;
            end
        end
        variabilities(i,c) = counter;
    end
end

for c=1:6
    for i = starts(c) : stops(c)
        %Detection condition
        if(variabilities(i,c) > 2 && abs(emg(i,c)) > 0.01)
            emg(c,writeDest) = i;
            results(c) = emg(c,writeDest) - emg(c,8);
            break
        end
    end
end

if g == 1
    for c=1:6
        figure();
        set(gcf,'color','w');
        %figure('units','normalized','outerposition',[0 0 1 1]);
        subplot(2,1,1);
        plot(emg(:,c));
        title('Original EMG Signal','FontSize',16)
        xlabel('t = [ms]')
        ylabel('EMG = [mv]')
        
        hold on;
        plot(emg(c,writeDest),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
        
        %figure('units','normalized','outerposition',[0 0 1 1]);
        subplot(2,1,2);
        plot(variabilities(1:size(variabilities,1),c));
        title('Sign Changes Algorithm','FontSize',16)
        xlabel('t = [ms]')
        ylabel('Sign changes')
        
        hold on;
        plot(emg(c,writeDest),0,'r.','MarkerSize',15);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
    end
end
