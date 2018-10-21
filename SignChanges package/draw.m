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
for i=1:6
    subplot(6,1,i);
    plot(emg(:,i));
    if size(emg,2)>7
        hold on;
        %annotation('textbox',[0.1 0.1 0.2 0.2],'String',y,'FontSize',14);
        plot(emg(i,8),0,'g.','MarkerSize',5);
        plot(emg(i,19),0,'r.','MarkerSize',8);
        %plot(0,max(abs(emg(:,i))),'r.','MarkerSize',5);
        hold off;
    end
end


if inserting == 1
    x = ginput(6);
    emg(1:6,8) = x(1:6,1);
end

end