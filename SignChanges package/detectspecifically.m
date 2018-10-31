function [emg] = detectspecifically(emg, k, windowSize, g)

%meanError=0;

%fitting k-parameter
%k=1+k/10;
k=k/10;
% Set displaying to false in case of too less arguments given
if nargin<4
    g=0;
end

%Counting sign changes combined with higher values of changes
signsTable=sign(emg);
for c=1:6
    d=0.04;%0.04 tested fairly well
    if max(abs(diff(emg(1:windowSize*0.5,c))))<0.035 && max(abs(emg(:,c)))<0.31
        d=0.0005;
        k=1.3;
    end
    if max(abs(diff(emg(1:windowSize*0.5,c))))<0.015 && max(abs(emg(:,c)))<0.1
        d=0.00001;
        k=1.5;
    end
    h(c) = (max(abs(diff(emg(1:windowSize*1.5,c))))+d)*k;
    %h(c) = (mean(abs(diff(emg(1:windowSize*1.5,c))))+0.005)*k*(max(emg(:,c))+0.75);
    %h(c) = k;
    
    for i=round(windowSize / 2) : size(emg,1) - round(windowSize / 2)           
           counter = 0;
%            actVar = var(emg(i-round(windowSize / 2)+1:i+round(windowSize / 2)-1,c));
%            noiseVar = var(emg(1:windowSize-2,c));
           for j=(i-round(windowSize/2)+1):(i+round(windowSize/2)-1)
              if(signsTable(j,c) == signsTable(j+1,c) && (abs(emg(j,c))-abs(emg(j+1,c)))>h(c))
                 counter = counter+1;
              end
           end        
               
           variabilities(i,c) = counter;
    end
end

for c=1:6
    emg(c,9) = 0;
    flag=0;
    for i = 1 : size(variabilities)
        %Detecting condition
        if(variabilities(i,c)>2 && flag==0 && abs(emg(i,c))>0.01)
            flag = 1;
            %Writing results
            emg(c,9) = i;
            %meanError = meanError + abs(i-emg(c,8));
            break
        end
    end
end
%emg(8,8)=meanError;
%meanError = meanError/6;


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
        plot(emg(c,9),0,'r.','MarkerSize',25);
        plot(emg(c,8),0,'g.','MarkerSize',25);
        hold off;
    end
end

% if g==1
%     figure('units','normalized','outerposition',[0 0 1 1]);
%     %subplot(3,1,2);
%     set(gcf,'color','w');
%     plot(variabilities(:,1));
%     title('Sign Changes Algorithm','FontSize',16)
%     xlabel('t = [ms]')
%     ylabel('Sign changes')
%     xa = [2500 onset];
%     ya = [8 0];
%     [xaf,yaf] = ds2nfu(xa,ya);
% 
%     hold on;
%     
%     annotation('textarrow',xaf,yaf,'String','ONSET','FontSize',14);
%     plot(onset,0,'r.','MarkerSize',25);
%     plot(onset-5,0,'g.','MarkerSize',25);
%     hold off;
% 
%     figure('units','normalized','outerposition',[0 0 1 1]);
%     %subplot(3,1,3);
%     set(gcf,'color','w');
%     plot(emg(:,1));
%     title('Original EMG Signal','FontSize',16)
%     xlabel('t = [ms]')
%     ylabel('EMG = [mv]')
%     xa = [2500 onset];
%     ya = [0.08 0];
%     [xaf,yaf] = ds2nfu(xa,ya);
%     
%     hold on;
%     annotation('textarrow',xaf,yaf,'String','ONSET','FontSize',14);
%     plot(onset,0,'r.','MarkerSize',25);
%     plot(onset-5,0,'g.','MarkerSize',25);
%     hold off;
% end