emg = zeros(5000);
emg(1) = 0.00001;
silenceMax = 0.05;
signalMax = 0.5;

for n = 2:2000
    emg(n) = emg(n - 1) + (rand - 0.5) * 0.05;
    if abs(emg(n)) > silenceMax
        emg(n) = 0.1 * silenceMax * sign(emg(n));
    end
end
for n = 2001:5000
    emg(n) = emg(n - 1) + (rand - 0.5) * 0.3;
    if abs(emg(n)) > signalMax
        emg(n) = 0.1 * signalMax * sign(emg(n));
    end
end

figure('units','normalized','outerposition',[0 0 1 1]);
set(gcf,'color','w');
plot(emg(:,c));
title('EMG Signal','FontSize',16);
%for scatter:
%Xs = [1:length(emg)];
%scatter(Xs,emg(:));

xlabel('t = [ms]')
ylabel('EMG = [mv]')