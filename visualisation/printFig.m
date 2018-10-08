function [ ] = printFig( emg )
%PRINTFIG used for printing figures
figure('units','normalized','outerposition',[0 0 1 1]);
title('EMG Signal','FontSize',16);
%set(gcf,'color','w');

plot(emg(:));
%for scatter:
%Xs = [1:length(emg)];
%scatter(Xs,emg(:,c));
hold on;
plot(xlim, [0 0], '-k');
%         plot(emg(c,13),0,'r.','MarkerSize',25);
%         plot(emg(c,8),0,'g.','MarkerSize',25);
hold off;
xlabel('t = [ms]')
ylabel('EMG = [mv]')
end

