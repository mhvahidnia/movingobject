function L2 = PathCombination2( L2, p, r )

% {1,i} -->

% {4,i} --> key
while true
  
    combinedItem=0;
%    L2_p=L2;
[row col]=size(L2);
%length(L2)
    for i=p:col-1
        [isCombinable, combineResult]=Combinable( L2{2,i} ,L2{2,i+1} );
        
        if (isCombinable==1)
            combinedItem=combinedItem+1;
            L2{2,i+1}=combineResult;
            L2{2,i}=combineResult;
            [row col]=size(L2);
            L2=[L2(:,1:i) L2(:,i+2:col)];
           break;
        end
        %UNTITLED2 Summary of this function goes here
        %   Detailed explanation goes here
        
    end
    
%    s=0;
%    for i=p:r
%        s=s+strcmp(L2{4,i},L2_p{4,i});
%    end
        
      
%    combinedItem
%    if (s==r)
%        break;
%    end
if (combinedItem==0)
    break;
end
end

%end
end

