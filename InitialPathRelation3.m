function OUT = InitialPathRelation3( K,L )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%H=MinHeap(100000);

% Input time of each node into a minheap
for i=1:length(K)
    H(i)=K(3,i);
    %    H.InsertKey(K(3,i));
end
for i=1:length(L)
    H(i+length(K))=L(3,i);
    %    H.InsertKey(L(3,i));
end

H=heapsort(H);

% create a linked list of nodes for each trajectory
for i=1:length(K)
    nK(i)=NamedNode('K',[K(2,i) K(3,i)]); % K(i,2) is X (location) and K(i,3) is T (time)
end
for i=2:length(K)
    nK(i).insertAfter(nK(i-1));
end
headK=nK(1);

for i=1:length(L)
    nL(i)=NamedNode('L',[L(2,i) L(3,i)]); % L(i,2) is X (location) and L(i,3) is T (time)
end
for i=2:length(L)
    nL(i).insertAfter(nL(i-1));
end
headL=nL(1);

enum=0;
%t1=H.ExtractMin();
t1=H(1);
for s=2:length(H)
    
    if (t1~=H(s))
        t2=H(s);
    else
        while (t1==H(s)) && (s<length(H))
            s=s+1;
            t2=H(s);
        end
    end
    
    if t1<t2
        enum=enum+1;
        if (~isempty(headK.Next)) && (~isempty(headL.Next))
            tK1=headK.Data(1,2);
            tK2=headK.Next.Data(1,2);
            xK1=headK.Data(1,1);
            xK2=headK.Next.Data(1,1);
            
            tL1=headL.Data(1,2);
            tL2=headL.Next.Data(1,2);
            xL1=headL.Data(1,1);
            xL2=headL.Next.Data(1,1);
            
            
            
            
        elseif (~isempty(headK.Next)) && (isempty(headL.Next))
            tK1=headK.Data(1,2);
            tK2=headK.Next.Data(1,2);
            xK1=headK.Data(1,1);
            xK2=headK.Next.Data(1,1);
            
            
            
            
        elseif (isempty(headK.Next)) && (~isempty(headL.Next))
            tL1=headL.Data(1,2);
            tL2=headL.Next.Data(1,2);
            xL1=headL.Data(1,1);
            xL2=headL.Next.Data(1,1);
            
            
        elseif (isempty(headK.Next)) && (isempty(headL.Next))
            break;
        end
        
        if (t1==tK1) && (t1<tL1)
            if (t2==tK2) && (t2<=tL1)
                headK=headK.Next;
            elseif (t2==tL1) && (t2<tK2)
                if (xK1==xK2)
                    headK.Data=[xK1 t2];
                else
                    X=xK1+(xK2-xK1)*(t2-tK1)/(tK2-tK1);
                    headK.Data=[X t2];
                end
                %         elseif (t2==tL1) && (t2==tK2)
                %
            end
            rel='EXN';
            
        elseif (t1==tL1) && (t1<tK1)
            if (t2==tL2) && (t2<=tK1)
               % headK=headK.Next;
               headL=headL.Next;
            elseif (t2==tK1) && (t2<tL2)
                if (xL1==xL2)
                    headL.Data=[xL1 t2];
                else
                    X=xL1+(xL2-xL1)*(t2-tL1)/(tL2-tL1);
                    headL.Data=[X t2];
                end
                %         elseif (t2==tL1) && (t2==tK2)
                %
            end
            rel='EXNi';
            
        elseif (t1==tL1) && (t1==tK1)
            
            KL = [xK1*tK2-xK2*tK1,xL1*tL2-xL2*tL1]/[tK2-tK1,tL2-tL1;-(xK2-xK1),-(xL2-xL1)];
            
                    
            % **********************************Rounding*************************************************************
            KL=roundn(KL,-3);
            %******************************************************************************************************
            
            
            if (KL(1,1)==Inf) || (KL(1,1)==-Inf) || (KL(1,2)==Inf) || (KL(1,2)==-Inf)
                res='Parallel';
            elseif isnan(KL(1,1)) || isnan(KL(1,2))
                res='Colinear';
            else
                res='Intersect';
                
            end
            
            if (t2==tL2) && (t2==tK2)
                
                
                if (strcmp(res,'Parallel')==1)
                    rel='DIS';
                elseif (strcmp(res,'Colinear')==1)
                    rel='EQV';
                elseif (strcmp(res,'Intersect')==1)
                    if (KL(1,2)>t2) || (KL(1,2)<t1)
                        rel='DIS';
                    elseif (KL(1,2)<t2) && (KL(1,2)>t1)
                        rel='CRSS';
                    elseif (KL(1,2)==t2) && (KL(1,2)~=t1)
                        rel='CONV';
                    elseif (KL(1,2)~=t2) && (KL(1,2)==t1)
                        rel='DIV';
                        
                    end
                end
                
                headK=headK.Next;
                headL=headL.Next;
                
                
            elseif (t2==tK2) && (t2<tL2)
                if (strcmp(res,'Parallel')==1)
                    rel='DIS';
                elseif (strcmp(res,'Colinear')==1)
                    rel='EQV';
                elseif (strcmp(res,'Intersect')==1)
                    if (KL(1,2)>t2) || (KL(1,2)<t1)
                        rel='DIS';
                    elseif (KL(1,2)<t2) && (KL(1,2)>t1)
                        rel='CRSS';
                    elseif (KL(1,2)==t2) && (KL(1,2)~=t1)
                        rel='CONV';
                    elseif (KL(1,2)~=t2) && (KL(1,2)==t1)
                        rel='DIV';
                        
                    end
                end
                
                headK=headK.Next;
                
                X=xL1+(xL2-xL1)*(t2-tL1)/(tL2-tL1);
                headL.Data=[X t2];
                
            elseif (t2==tL2) && (t2<tK2)
                if (strcmp(res,'Parallel')==1)
                    rel='DIS';
                elseif (strcmp(res,'Colinear')==1)
                    rel='EQV';
                elseif (strcmp(res,'Intersect')==1)
                    if (KL(1,2)>t2) || (KL(1,2)<t1)
                        rel='DIS';
                    elseif (KL(1,2)<t2) && (KL(1,2)>t1)
                        rel='CRSS';
                    elseif (KL(1,2)==t2) && (KL(1,2)~=t1)
                        rel='CONV';
                    elseif (KL(1,2)~=t2) && (KL(1,2)==t1)
                        rel='DIV';
                        
                    end
                end
                
                headL=headL.Next;
                
                X=xK1+(xK2-xK1)*(t2-tK1)/(tK2-tK1);
                headK.Data=[X t2];
            end
        elseif (t1==tK1) && (t1>tL1)  %??????? (t1>tL2) ?????????????????????????????????
            rel='EXN';
        elseif (t1==tL1) && (t1>tK1)  %??????? (t1>tK2) ?????????????????????????????????
            rel='EXNi';
        end
        
        %rel
        
        OUT{1,enum}=enum;
        OUT{2,enum}=rel;
        
        
        t1=t2;
    end
    
end

end

