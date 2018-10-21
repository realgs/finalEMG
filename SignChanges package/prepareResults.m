% %B02fsgrzbiet1=detectspecifically(B02fsgrzbiet1,16,200, 0);
finalResults=[];
if exist('B01fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B01fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B01fsgrzbiet1(c, 19)-B01fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B02fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B02fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B02fsgrzbiet1(c, 19)-B02fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B03fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B03fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B03fsgrzbiet1(c, 19)-B03fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B04fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B04fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B04fsgrzbiet1(c, 19)-B04fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B05fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B05fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B05fsgrzbiet1(c, 19)-B05fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B06fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B06fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B06fsgrzbiet1(c, 19)-B06fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B07fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B07fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B07fsgrzbiet1(c, 19)-B07fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B08fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B08fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B08fsgrzbiet1(c, 19)-B08fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B09fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B09fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B09fsgrzbiet1(c, 19)-B09fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B10fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B10fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B10fsgrzbiet1(c, 19)-B10fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B11fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B11fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B11fsgrzbiet1(c, 19)-B11fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B12fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B12fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B12fsgrzbiet1(c, 19)-B12fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B13fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B13fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B13fsgrzbiet1(c, 19)-B13fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B14fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B14fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B14fsgrzbiet1(c, 19)-B14fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

if exist('B15fsgrzbiet1','var')
    newSize=size(finalResults,1)+1;
    for c=1:6
        if B15fsgrzbiet1(c, 8)>0
            finalResults(newSize,c)=B15fsgrzbiet1(c, 19)-B15fsgrzbiet1(c, 8);
        else
            finalResults(newSize,c)=-6666;
        end
    end
end

%--------------------------------1.05.2016 modification for hidden factor (diff) purpose
% if exist('B01fsgrzbiet1','var')
%     
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B01fsgrzbiet1(c,8)>50)
%             %if B01fsgrzbiet1(c, 12)-B01fsgrzbiet1(c, 8))<200 && B01fsgrzbiet1(c, 10)-B01fsgrzbiet1(c, 8))<200 && B01fsgrzbiet1(c, 11)-B01fsgrzbiet1(c, 8))<200 && B01fsgrzbiet1(c, 12)-B01fsgrzbiet1(c, 8))<200
%                 error1=error1+B01fsgrzbiet1(c, 9)-B01fsgrzbiet1(c, 8));
%                 error2=error2+B01fsgrzbiet1(c, 10)-B01fsgrzbiet1(c, 8));
%                 error3=error3+B01fsgrzbiet1(c, 11)-B01fsgrzbiet1(c, 8));
%                 error4=error4+B01fsgrzbiet1(c, 12)-B01fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B01fsgrzbiet1(7,9)=error1/counter;
%     B01fsgrzbiet1(7,10)=error2/counter;
%     B01fsgrzbiet1(7,11)=error3/counter;
%     B01fsgrzbiet1(7,12)=error4/counter;
%     
% end
% if exist('B02fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B02fsgrzbiet1(c,8)>50)
%             %if B02fsgrzbiet1(c, 12)-B02fsgrzbiet1(c, 8))<200 && B02fsgrzbiet1(c, 10)-B02fsgrzbiet1(c, 8))<200 && B02fsgrzbiet1(c, 11)-B02fsgrzbiet1(c, 8))<200 && B02fsgrzbiet1(c, 12)-B02fsgrzbiet1(c, 8))<200
%                 error1=error1+B02fsgrzbiet1(c, 9)-B02fsgrzbiet1(c, 8));
%                 error2=error2+B02fsgrzbiet1(c, 10)-B02fsgrzbiet1(c, 8));
%                 error3=error3+B02fsgrzbiet1(c, 11)-B02fsgrzbiet1(c, 8));
%                 error4=error4+B02fsgrzbiet1(c, 12)-B02fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B02fsgrzbiet1(7,9)=error1/counter;
%     B02fsgrzbiet1(7,10)=error2/counter;
%     B02fsgrzbiet1(7,11)=error3/counter;
%     B02fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B03fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B03fsgrzbiet1(c,8)>50)
%             %if B03fsgrzbiet1(c, 12)-B03fsgrzbiet1(c, 8))<200 && B03fsgrzbiet1(c, 10)-B03fsgrzbiet1(c, 8))<200 && B03fsgrzbiet1(c, 11)-B03fsgrzbiet1(c, 8))<200 && B03fsgrzbiet1(c, 12)-B03fsgrzbiet1(c, 8))<200
%                 error1=error1+B03fsgrzbiet1(c, 9)-B03fsgrzbiet1(c, 8));
%                 error2=error2+B03fsgrzbiet1(c, 10)-B03fsgrzbiet1(c, 8));
%                 error3=error3+B03fsgrzbiet1(c, 11)-B03fsgrzbiet1(c, 8));
%                 error4=error4+B03fsgrzbiet1(c, 12)-B03fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B03fsgrzbiet1(7,9)=error1/counter;
%     B03fsgrzbiet1(7,10)=error2/counter;
%     B03fsgrzbiet1(7,11)=error3/counter;
%     B03fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B04fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B04fsgrzbiet1(c,8)>50)
%             %if B04fsgrzbiet1(c, 12)-B04fsgrzbiet1(c, 8))<200 && B04fsgrzbiet1(c, 10)-B04fsgrzbiet1(c, 8))<200 && B04fsgrzbiet1(c, 11)-B04fsgrzbiet1(c, 8))<200 && B04fsgrzbiet1(c, 12)-B04fsgrzbiet1(c, 8))<200
%                 error1=error1+B04fsgrzbiet1(c, 9)-B04fsgrzbiet1(c, 8));
%                 error2=error2+B04fsgrzbiet1(c, 10)-B04fsgrzbiet1(c, 8));
%                 error3=error3+B04fsgrzbiet1(c, 11)-B04fsgrzbiet1(c, 8));
%                 error4=error4+B04fsgrzbiet1(c, 12)-B04fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B04fsgrzbiet1(7,9)=error1/counter;
%     B04fsgrzbiet1(7,10)=error2/counter;
%     B04fsgrzbiet1(7,11)=error3/counter;
%     B04fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B05fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B05fsgrzbiet1(c,8)>50)
%             %if B05fsgrzbiet1(c, 12)-B05fsgrzbiet1(c, 8))<200 && B05fsgrzbiet1(c, 10)-B05fsgrzbiet1(c, 8))<200 && B05fsgrzbiet1(c, 11)-B05fsgrzbiet1(c, 8))<200 && B05fsgrzbiet1(c, 12)-B05fsgrzbiet1(c, 8))<200
%                 error1=error1+B05fsgrzbiet1(c, 9)-B05fsgrzbiet1(c, 8));
%                 error2=error2+B05fsgrzbiet1(c, 10)-B05fsgrzbiet1(c, 8));
%                 error3=error3+B05fsgrzbiet1(c, 11)-B05fsgrzbiet1(c, 8));
%                 error4=error4+B05fsgrzbiet1(c, 12)-B05fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B05fsgrzbiet1(7,9)=error1/counter;
%     B05fsgrzbiet1(7,10)=error2/counter;
%     B05fsgrzbiet1(7,11)=error3/counter;
%     B05fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B06fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B06fsgrzbiet1(c,8)>50)
%             %if B06fsgrzbiet1(c, 12)-B06fsgrzbiet1(c, 8))<200 && B06fsgrzbiet1(c, 10)-B06fsgrzbiet1(c, 8))<200 && B06fsgrzbiet1(c, 11)-B06fsgrzbiet1(c, 8))<200 && B06fsgrzbiet1(c, 12)-B06fsgrzbiet1(c, 8))<200
%                 error1=error1+B06fsgrzbiet1(c, 9)-B06fsgrzbiet1(c, 8));
%                 error2=error2+B06fsgrzbiet1(c, 10)-B06fsgrzbiet1(c, 8));
%                 error3=error3+B06fsgrzbiet1(c, 11)-B06fsgrzbiet1(c, 8));
%                 error4=error4+B06fsgrzbiet1(c, 12)-B06fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B06fsgrzbiet1(7,9)=error1/counter;
%     B06fsgrzbiet1(7,10)=error2/counter;
%     B06fsgrzbiet1(7,11)=error3/counter;
%     B06fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B07fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B07fsgrzbiet1(c,8)>50)
%             %if B07fsgrzbiet1(c, 12)-B07fsgrzbiet1(c, 8))<200 && B07fsgrzbiet1(c, 10)-B07fsgrzbiet1(c, 8))<200 && B07fsgrzbiet1(c, 11)-B07fsgrzbiet1(c, 8))<200 && B07fsgrzbiet1(c, 12)-B07fsgrzbiet1(c, 8))<200
%                 error1=error1+B07fsgrzbiet1(c, 9)-B07fsgrzbiet1(c, 8));
%                 error2=error2+B07fsgrzbiet1(c, 10)-B07fsgrzbiet1(c, 8));
%                 error3=error3+B07fsgrzbiet1(c, 11)-B07fsgrzbiet1(c, 8));
%                 error4=error4+B07fsgrzbiet1(c, 12)-B07fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B07fsgrzbiet1(7,9)=error1/counter;
%     B07fsgrzbiet1(7,10)=error2/counter;
%     B07fsgrzbiet1(7,11)=error3/counter;
%     B07fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B08fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B08fsgrzbiet1(c,8)>50)
%             %if B08fsgrzbiet1(c, 12)-B08fsgrzbiet1(c, 8))<200 && B08fsgrzbiet1(c, 10)-B08fsgrzbiet1(c, 8))<200 && B08fsgrzbiet1(c, 11)-B08fsgrzbiet1(c, 8))<200 && B08fsgrzbiet1(c, 12)-B08fsgrzbiet1(c, 8))<200
%                 error1=error1+B08fsgrzbiet1(c, 9)-B08fsgrzbiet1(c, 8));
%                 error2=error2+B08fsgrzbiet1(c, 10)-B08fsgrzbiet1(c, 8));
%                 error3=error3+B08fsgrzbiet1(c, 11)-B08fsgrzbiet1(c, 8));
%                 error4=error4+B08fsgrzbiet1(c, 12)-B08fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B08fsgrzbiet1(7,9)=error1/counter;
%     B08fsgrzbiet1(7,10)=error2/counter;
%     B08fsgrzbiet1(7,11)=error3/counter;
%     B08fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B09fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B09fsgrzbiet1(c,8)>50)
%             %if B09fsgrzbiet1(c, 12)-B09fsgrzbiet1(c, 8))<200 && B09fsgrzbiet1(c, 10)-B09fsgrzbiet1(c, 8))<200 && B09fsgrzbiet1(c, 11)-B09fsgrzbiet1(c, 8))<200 && B09fsgrzbiet1(c, 12)-B09fsgrzbiet1(c, 8))<200
%                 error1=error1+B09fsgrzbiet1(c, 9)-B09fsgrzbiet1(c, 8));
%                 error2=error2+B09fsgrzbiet1(c, 10)-B09fsgrzbiet1(c, 8));
%                 error3=error3+B09fsgrzbiet1(c, 11)-B09fsgrzbiet1(c, 8));
%                 error4=error4+B09fsgrzbiet1(c, 12)-B09fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B09fsgrzbiet1(7,9)=error1/counter;
%     B09fsgrzbiet1(7,10)=error2/counter;
%     B09fsgrzbiet1(7,11)=error3/counter;
%     B09fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B10fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B10fsgrzbiet1(c,8)>50)
%             %if B10fsgrzbiet1(c, 12)-B10fsgrzbiet1(c, 8))<200 && B10fsgrzbiet1(c, 10)-B10fsgrzbiet1(c, 8))<200 && B10fsgrzbiet1(c, 11)-B10fsgrzbiet1(c, 8))<200 && B10fsgrzbiet1(c, 12)-B10fsgrzbiet1(c, 8))<200
%                 error1=error1+B10fsgrzbiet1(c, 9)-B10fsgrzbiet1(c, 8));
%                 error2=error2+B10fsgrzbiet1(c, 10)-B10fsgrzbiet1(c, 8));
%                 error3=error3+B10fsgrzbiet1(c, 11)-B10fsgrzbiet1(c, 8));
%                 error4=error4+B10fsgrzbiet1(c, 12)-B10fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B10fsgrzbiet1(7,9)=error1/counter;
%     B10fsgrzbiet1(7,10)=error2/counter;
%     B10fsgrzbiet1(7,11)=error3/counter;
%     B10fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B11fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B11fsgrzbiet1(c,8)>50)
%             %if B11fsgrzbiet1(c, 12)-B11fsgrzbiet1(c, 8))<200 && B11fsgrzbiet1(c, 10)-B11fsgrzbiet1(c, 8))<200 && B11fsgrzbiet1(c, 11)-B11fsgrzbiet1(c, 8))<200 && B11fsgrzbiet1(c, 12)-B11fsgrzbiet1(c, 8))<200
%                 error1=error1+B11fsgrzbiet1(c, 9)-B11fsgrzbiet1(c, 8));
%                 error2=error2+B11fsgrzbiet1(c, 10)-B11fsgrzbiet1(c, 8));
%                 error3=error3+B11fsgrzbiet1(c, 11)-B11fsgrzbiet1(c, 8));
%                 error4=error4+B11fsgrzbiet1(c, 12)-B11fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B11fsgrzbiet1(7,9)=error1/counter;
%     B11fsgrzbiet1(7,10)=error2/counter;
%     B11fsgrzbiet1(7,11)=error3/counter;
%     B11fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B12fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B12fsgrzbiet1(c,8)>50)
%             %if B12fsgrzbiet1(c, 12)-B12fsgrzbiet1(c, 8))<200 && B12fsgrzbiet1(c, 10)-B12fsgrzbiet1(c, 8))<200 && B12fsgrzbiet1(c, 11)-B12fsgrzbiet1(c, 8))<200 && B12fsgrzbiet1(c, 12)-B12fsgrzbiet1(c, 8))<200
%                 error1=error1+B12fsgrzbiet1(c, 9)-B12fsgrzbiet1(c, 8));
%                 error2=error2+B12fsgrzbiet1(c, 10)-B12fsgrzbiet1(c, 8));
%                 error3=error3+B12fsgrzbiet1(c, 11)-B12fsgrzbiet1(c, 8));
%                 error4=error4+B12fsgrzbiet1(c, 12)-B12fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B12fsgrzbiet1(7,9)=error1/counter;
%     B12fsgrzbiet1(7,10)=error2/counter;
%     B12fsgrzbiet1(7,11)=error3/counter;
%     B12fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B13fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B13fsgrzbiet1(c,8)>50)
%             %if B13fsgrzbiet1(c, 12)-B13fsgrzbiet1(c, 8))<200 && B13fsgrzbiet1(c, 10)-B13fsgrzbiet1(c, 8))<200 && B13fsgrzbiet1(c, 11)-B13fsgrzbiet1(c, 8))<200 && B13fsgrzbiet1(c, 12)-B13fsgrzbiet1(c, 8))<200
%                 error1=error1+B13fsgrzbiet1(c, 9)-B13fsgrzbiet1(c, 8));
%                 error2=error2+B13fsgrzbiet1(c, 10)-B13fsgrzbiet1(c, 8));
%                 error3=error3+B13fsgrzbiet1(c, 11)-B13fsgrzbiet1(c, 8));
%                 error4=error4+B13fsgrzbiet1(c, 12)-B13fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B13fsgrzbiet1(7,9)=error1/counter;
%     B13fsgrzbiet1(7,10)=error2/counter;
%     B13fsgrzbiet1(7,11)=error3/counter;
%     B13fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B14fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B14fsgrzbiet1(c,8)>50)
%             %if B14fsgrzbiet1(c, 12)-B14fsgrzbiet1(c, 8))<200 && B14fsgrzbiet1(c, 10)-B14fsgrzbiet1(c, 8))<200 && B14fsgrzbiet1(c, 11)-B14fsgrzbiet1(c, 8))<200 && B14fsgrzbiet1(c, 12)-B14fsgrzbiet1(c, 8))<200
%                 error1=error1+B14fsgrzbiet1(c, 9)-B14fsgrzbiet1(c, 8));
%                 error2=error2+B14fsgrzbiet1(c, 10)-B14fsgrzbiet1(c, 8));
%                 error3=error3+B14fsgrzbiet1(c, 11)-B14fsgrzbiet1(c, 8));
%                 error4=error4+B14fsgrzbiet1(c, 12)-B14fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B14fsgrzbiet1(7,9)=error1/counter;
%     B14fsgrzbiet1(7,10)=error2/counter;
%     B14fsgrzbiet1(7,11)=error3/counter;
%     B14fsgrzbiet1(7,12)=error4/counter;
% end
% if exist('B15fsgrzbiet1','var')
%     error1=0;
%     error2=0;
%     error3=0;
%     error4=0;
%     counter=0;
%     for c=1:6
%         if(B15fsgrzbiet1(c,8)>50)
%             %if B15fsgrzbiet1(c, 12)-B15fsgrzbiet1(c, 8))<200 && B15fsgrzbiet1(c, 10)-B15fsgrzbiet1(c, 8))<200 && B15fsgrzbiet1(c, 11)-B15fsgrzbiet1(c, 8))<200 && B15fsgrzbiet1(c, 12)-B15fsgrzbiet1(c, 8))<200
%                 error1=error1+B15fsgrzbiet1(c, 9)-B15fsgrzbiet1(c, 8));
%                 error2=error2+B15fsgrzbiet1(c, 10)-B15fsgrzbiet1(c, 8));
%                 error3=error3+B15fsgrzbiet1(c, 11)-B15fsgrzbiet1(c, 8));
%                 error4=error4+B15fsgrzbiet1(c, 12)-B15fsgrzbiet1(c, 8));
%                 counter=counter+1;
%             %end
%         end
%     end
%     if counter==0
%         counter=counter+1;
%     end
%     B15fsgrzbiet1(7,9)=error1/counter;
%     B15fsgrzbiet1(7,10)=error2/counter;
%     B15fsgrzbiet1(7,11)=error3/counter;
%     B15fsgrzbiet1(7,12)=error4/counter;
% end
