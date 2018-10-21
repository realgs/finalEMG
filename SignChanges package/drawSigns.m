%Exemplary use B13maxbrzuchlr1=draw(B13maxbrzuchlr1)
function [emg] = draw(emg, inserting)
%inserting = 0-> display , 1-> insert data


%Display one chart at a time
if inserting == 1
    figure(1);
    set(figure(1),'Units','Normalized','OuterPosition',[0 0 1 1]);
else
    %Display all charts at once
    figure('units','normalized','outerposition',[0 0 1 1]);
end
n=0;%additional iterator
for i=1:2:12
    subplot(6,2,i);
    plot(emg(:,n+1));
    hold on;
    plot(1:5000,zeros(1,5000))
    hold off;
%     if size(emg,2)>7
%         hold on;
%         %annotation('textbox',[0.1 0.1 0.2 0.2],'String',y,'FontSize',14);
%         plot(emg(i,8),0,'g.','MarkerSize',5);
%         plot(emg(i,9),0,'r.','MarkerSize',5);
%         plot(0,max(abs(emg(:,i))),'r.','MarkerSize',5);
%         hold off;
%     end
    subplot(6,2,i+1);
    plot(emg(:,n+13));
    hold on;
    plot(1:5000,zeros(1,5000) );%* emg(5000,n+13));%ref line with mean value of signchanges
    plot(emg(n+1,19),0,'r.','MarkerSize',15);
    hold off;
    n=n+1;
end

if inserting == 1
    x = ginput(6);
    emg(1:6,8) = x(1:6,1);
end

end