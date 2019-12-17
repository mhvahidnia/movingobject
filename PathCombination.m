function [L, InList, OutList] = PathCombination( L, InList, OutList,  p, r )
%L=L;
%PATHCOMBINATION Summary of this function goes here
%   Detailed explanation goes here
% {1,i} -->
% {2,i} --> InLink
% {3,i} --> ToLink
% {4,i} --> key

% if (p<r)
%     q=floor((p+r)/2);
%     L=PathCombination(L, p, q);
%     L=PathCombination(L, q+1, r);
%     [isCombinable, combineResult]=Combinable( L{4,L{3,q}} ,L{4,L{3,q+1}} );
%     if (isCombinable==1)
%         L{4,L{3,q+1}}=combineResult;
%         L{2,L{3,q+1}}=L{1,L{3,q}};
%         L{3,L{3,q}}=L{1,L{3,q+1}};
%         L{3,L{2,q}}=L{1,L{3,q+1}};
%     end
% end


if (p<r)
    q=floor((p+r)/2);
    [L, InList, OutList]=PathCombination(L, InList, OutList, p, q);
    [L, InList, OutList]=PathCombination(L, InList, OutList, q+1, r);
    

    
        %q
        %q+1
    %[isCombinable, combineResult]=Combinable( L{2,L{3,q}} ,L{2,L{3,q+1}} );
    if (strcmp(L{2,q},'')==1) % if current relation is null
        rel1=L{2,OutList(q,1)};
        q_c=1;
    else
        rel1=L{2,q};
        q_c=0;
    end
    if (strcmp(L{2,q+1},'')==1)
        rel2=L{2,OutList(q+1,1)};
        q_plus_c=1;
    else
        rel2=L{2,q+1};
        q_plus_c=0;
    end
    
    [isCombinable, combineResult]=Combinable(rel1 ,rel2 );
    if (isCombinable==1)
        if (q_c==1 && q_plus_c==0) % ?????
            L{2,OutList(q,1)}='';
            L{2,q+1}=combineResult;
            OutList(q,1)=q+1;
            InList(q+1,1)=InList(q+1,1)+1;
            InList(q+1,InList(q+1,1)+1)=q;
            if InList(q,1)>0
                for t=1:InList(q,1)
                    InList(q+1,t+InList(q+1,1)+1)=InList(q,t+1);
                    OutList(InList(q,t+1),1)=q+1;
                    InList(q,t+1)=0;
                end
                InList(q+1,1)=InList(q+1,1)+InList(q,1);
                InList(q,1)=0;
            end
        elseif (q_c==0 && q_plus_c==0) % ??? ?? ?? ????? ????? ?????
            L{2,q}='';
            L{2,q+1}=combineResult;
            OutList(q,1)=q+1;
            InList(q+1,1)=InList(q+1,1)+1;
            InList(q+1,InList(q+1,1)+1)=q;
            if InList(q,1)>0
                for t=1:InList(q,1)
                    InList(q+1,t+InList(q+1,1)+1)=InList(q,t+1);
                    OutList(InList(q,t+1),1)=q+1;
                    InList(q,t+1)=0;
                end
                InList(q+1,1)=InList(q+1,1)+InList(q,1);
                InList(q,1)=0;
            end
        elseif (q_c==0 && q_plus_c==1) % ???  ??? ????? ????? ???? ??? ??????? ????? ?? ????
            L{2,q}='';
            L{2,OutList(q+1,1)}=combineResult;
            OutList(q,1)=OutList(q+1,1);
            InList(OutList(q+1,1),1)=InList(OutList(q+1,1),1)+1;
            InList(OutList(q+1,1),InList(OutList(q+1,1),1)+1)=q;
            if InList(q,1)>0
                for t=1:InList(q,1)
                    InList(OutList(q+1,1),t+InList(OutList(q+1,1),1)+1)=InList(q,t+1);
                    OutList(InList(q,t+1),1)=OutList(q+1,1);
                    InList(q,t+1)=0;
                end
                InList(OutList(q+1,1),1)=InList(OutList(q+1,1),1)+InList(q,1);
                InList(q,1)=0;
            end
        elseif (q_c==1 && q_plus_c==1) % ??? ?? ?? ????? ?? ?????
            L{2,OutList(q,1)}='';
            L{2,OutList(q+1,1)}=combineResult;
            OutList(OutList(q,1),1)=OutList(q+1,1);
            InList(OutList(q+1,1),1)=InList(OutList(q+1,1),1)+1;
            InList(OutList(q+1,1),InList(OutList(q+1,1),1)+1)=OutList(q,1);
            if InList(OutList(q,1),1)>0
                for t=1:InList(OutList(q,1),1)
                    InList(OutList(q+1,1),t+InList(OutList(q+1,1),1)+1)=InList(OutList(q,1),t+1);
                    OutList(InList(OutList(q,1),t+1),1)=OutList(q+1,1);
                    InList(OutList(q,1),t+1)=0;
                end
                InList(OutList(q+1,1),1)=InList(OutList(q+1,1),1)+InList(OutList(q,1),1);
                InList(OutList(q,1),1)=0;
            end
        end
        
%         if (q_plus_c==1)
%             L{4,OutList(q+1,1)}=combineResult;
%             OutList(q,1)=OutList(q+1,1);
%         elseif (q_plus_c==0)
%             L{4,q+1}=combineResult;
%             OutList(q,1)=q+1;
%         end
%         L{4,L{3,q}}='';
%         L{4,L{3,q+1}}=combineResult;
%         OutList(q,1)=
%         %L{4,L{3,q}}=combineResult;
%         L{2,L{3,q+1}}=L{1,L{3,q}};
%         L{3,L{3,q}}=L{1,L{3,q+1}};
%         L{3,L{2,q}}=L{1,L{3,q+1}};
%         L{3,L{2,L{2,q}}}=L{1,L{3,q+1}};

        %combineResult
    end
end


end

