finalResults(1:10,7) = 0;

for r=1:size(finalResults,1)
    for c=1:size(finalResults,2)
        if finalResults(r,c) ~=-6666
            finalResults(1,7) = finalResults(1,7) + finalResults(r,c);%sum
            finalResults(2,7) = finalResults(2,7) + abs(finalResults(r,c));%sum of absolute values
            finalResults(5,7) = finalResults(5,7) + 1;% total amount
            if abs(finalResults(r,c))<50
                finalResults(6,7) = finalResults(6,7) + 1;
            elseif abs(finalResults(r,c))<100
                finalResults(7,7) = finalResults(7,7) + 1;
            elseif abs(finalResults(r,c))<200
                finalResults(8,7) = finalResults(8,7) + 1;
            elseif abs(finalResults(r,c))<400
                finalResults(9,7) = finalResults(9,7) + 1;
            else 
                finalResults(10,7) = finalResults(10,7) + 1;
            end
        end
    end
end
finalResults(3,7) = finalResults(1,7) / finalResults(5,7);%mean
finalResults(4,7) = finalResults(2,7) / finalResults(5,7);%mean of absolute values