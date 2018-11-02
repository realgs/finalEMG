function [results] = estimator2(emg, k, windowSize, g)
%A muscle activity estimator based on signal sign changes.

% Set displaying to false in case of too few arguments given
if nargin<4
    g=0;
end

k(1:6) = k / 10;
d(1:6) = 0.04;
results(1:6) = 5000;
h = ones(1,6);
variabilities = zeros(5000,6);
derivatives = diff(emg(:, 1:6));
signsTable = sign(emg);
smallWindow = round(windowSize / 2);

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
    
    for i = smallWindow : size(emg,1) - smallWindow
        counter = 0;
        %            actVar = var(emg(i-smallWindow+1:i+smallWindow-1,c));
        %            noiseVar = var(emg(1:windowSize-2,c));
        for j=(i-round(windowSize/2)+1):(i+round(windowSize/2)-1)
            if(signsTable(j,c) == signsTable(j+1,c) && derivatives(j,c) > h(c))
                counter = counter+1;
            end
        end
        
        variabilities(i,c) = counter;
    end
end

for c=1:6
    emg(c,9) = 0;
    for i = 1 : size(variabilities)
        %Detection condition
        if(variabilities(i,c)>2 && abs(emg(i,c))>0.01)
            emg(c,9) = i;
            results(c) = emg(c,9) - emg(c,8);
            break
        end
    end
end


if g==1
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
        plot(emg(c,9),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
        
        %figure('units','normalized','outerposition',[0 0 1 1]);
        subplot(2,1,2);
        plot(variabilities(1:size(variabilities,1),c));
        title('Sign Changes Algorithm','FontSize',16)
        xlabel('t = [ms]')
        ylabel('Sign changes')
        
        hold on;
        plot(emg(c,9),0,'r.','MarkerSize',15);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
    end
end
