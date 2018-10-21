function [ emg ] = computeSignChanges( emg, windowSize, gr)
% windowSize should be an even value, like 50, 52 or 100
emgSigns=sign(emg);
emg(:,13:18)=0;
for c=1:6
    currentMean=mean(abs(emg(:,c)))/3;
    for m = (windowSize/2 + 1) : size(emg) - (windowSize/2 + 4)
        for n = (m-windowSize/2) : (m+windowSize/2)
            %dodaj pêtlê dla wszystkich sygna³ów czyli kolumn sygna³u emg
            if abs(emg(n,c) - emg(n+1,c)) > currentMean%abs(emg(n,c))< currentMean && abs(emg(n+1,c))< currentMean && abs(emg(n+2,c))< currentMean; %&& emgSigns(n,c) ~= emgSigns(n+1,c);
                emg(m,12+c) = emg(m,12+c)  + abs(emg(n,c))*abs(emg(n+1,c))*abs(emg(n+2,c)); %+ emg (m,12+c);% * 10 * abs(emg(n,1) - emg(n+1,1)) ;
            end
        end
    end
    emg(5000,c+12) = mean(abs( emg(windowSize/2 : size(emg) - windowSize/2 , c+12) ));%mean of SignChanges
    flag = 0;
    emg(c,19) = 0;
    for i=1:5000
        if emg(i,12+c)>emg(5000,12+c)/5 && flag == 0 %instead of 0 emg(5000,12+c)^2/20
            emg(c,19) = i + windowSize/2;
            flag = 1;
        end
    end
    
end


end

