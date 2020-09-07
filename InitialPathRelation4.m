function OUT = InitialPathRelation4( K,L )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


enum=0;
for i=1:length(K)-1
    for j=1:length(L)-1
        tK1=K(3,i);
        tK2=K(3,i+1);
        xK1=K(2,i);
        xK2=K(2,i+1);
        
        tL1=L(3,j);
        tL2=L(3,j+1);
        xL1=L(2,j);
        xL2=L(2,j+1);
        
       
        

        
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
        
        
        if (tK1==tL1) && (tK2==tL2)  % k equals l
            
            if (strcmp(res,'Parallel')==1)
                rel='DIS';
            elseif (strcmp(res,'Colinear')==1)
                rel='EQV';
            elseif (strcmp(res,'Intersect')==1)
                if (KL(1,2)>tK2) || (KL(1,2)<tK1)
                    rel='DIS';
                elseif (KL(1,2)<tK2) && (KL(1,2)>tK1)
                    rel='CRSS';
                elseif (KL(1,2)==tK2) && (KL(1,2)~=tK1)
                    rel='CONV';
                elseif (KL(1,2)~=tK2) && (KL(1,2)==tK1)
                    rel='DIV';
                    
                end
            end
            % between  [tK1, tK2]
            
            enum=enum+1;
            OUT{1,enum}=enum;
            OUT{2,enum}=rel;
            %disp(['Equals', ' ', rel])
            
        elseif (tK2<tL1)  % k  before  l
            if (j==1)
                rel='EXN';
                % between  [tK1, tK2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Before', ' ', rel])
            end
            if (i==length(K)-1)
                rel='EXNi';
                % between  [tL1, tL2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Before', ' ', rel])
            end
            
            
        elseif (tL2<tK1)  % k  after  l
            if (i==1)
                rel='EXNi';
                % between  [tL1, tL2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['After', ' ', rel])
            end
            if (j==length(L)-1)
                rel='EXN';
                % between  [tK1, tK2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['After', ' ', rel])
            end
            
            
        elseif (tK2==tL1)  % k  meets  l
            if (j==1)
                rel='EXN';
                % between  [tK1, tK2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Meets', ' ', rel])
            end
            if (i==length(K)-1)
                rel='EXNi';
                % between  [tL1, tL2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Meets', ' ', rel])
            end
            
            
        elseif (tL2==tK1)  %  k  met by  l
            if (i==1)
                rel='EXNi';
                % between  [tL1, tL2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Met by', ' ', rel])
            end
            if (j==length(L)-1)
                rel='EXN';
                % between  [tK1, tK2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Met by', ' ', rel])
            end
            
            
        elseif (tK1<tL1) && (tK2>tL1) && (tK2<tL2)  %  k  overlaps  l
            
            if (j==1)
                rel='EXN';
                % between  [tK1, tL1]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Overlaps', ' ', rel])
            end
            
            if (strcmp(res,'Parallel')==1)
                rel='DIS';
            elseif (strcmp(res,'Colinear')==1)
                rel='EQV';
            elseif (strcmp(res,'Intersect')==1)
                if (KL(1,2)>tK2) || (KL(1,2)<tL1)
                    rel='DIS';
                elseif (KL(1,2)<tK2) && (KL(1,2)>tL1)
                    rel='CRSS';
                elseif (KL(1,2)==tK2) && (KL(1,2)~=tL1)
                    rel='CONV';
                elseif (KL(1,2)~=tK2) && (KL(1,2)==tL1)
                    rel='DIV';
                    
                end
            end
            % between  [tL1, tK2]
            enum=enum+1;
            OUT{1,enum}=enum;
            OUT{2,enum}=rel;
            %disp(['Overlaps', ' ', rel, ' <<', res, '>>', ' ', num2str(KL(1,2)), ' ','tL1=',num2str(tL1),' tL2=', num2str(tL2), 'tK1=', num2str(tK1), 'tK2=', num2str(tK2), ' xL1=', num2str(xL1), ' xL2=', num2str(xL2), ' xK1=', num2str(xK1), ' xK2=', num2str(xK2)])
 
            if (i==length(K)-1)
                rel='EXNi';
                % between  [tK2, tL2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Overlaps', ' ', rel])
            end
            
            
        elseif (tL1<tK1) && (tL2>tK1) && (tL2<tK2)  %  k  overlapped by  l
            
            if (i==1)
                rel='EXNi';
                % between  [tL1, tK1]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Overlapped by', ' ', rel])
            end
            
            if (strcmp(res,'Parallel')==1)
                rel='DIS';
            elseif (strcmp(res,'Colinear')==1)
                rel='EQV';
            elseif (strcmp(res,'Intersect')==1)
                if (KL(1,2)>tL2) || (KL(1,2)<tK1)
                    rel='DIS';
                elseif (KL(1,2)<tL2) && (KL(1,2)>tK1)
                    rel='CRSS';
                elseif (KL(1,2)==tL2) && (KL(1,2)~=tK1)
                    rel='CONV';
                elseif (KL(1,2)~=tL2) && (KL(1,2)==tK1)
                    rel='DIV';
                    
                end
            end
            % between  [tK1, tL2]
            enum=enum+1;
            OUT{1,enum}=enum;
            OUT{2,enum}=rel;
            %disp(['Overlapped by', ' ', rel])
            
            if (j==length(L)-1)
                rel='EXN';
                % between  [tL2, tK2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Overlapped by', ' ', rel])
            end
            
            
        elseif (tK1>tL1) && (tK2<tL2)  %  k  during  l
            
            if (i==1)
                rel='EXNi';
                % between  [tL1, tK1]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['During', ' ', rel])
            end
            
            if (strcmp(res,'Parallel')==1)
                rel='DIS';
            elseif (strcmp(res,'Colinear')==1)
                rel='EQV';
            elseif (strcmp(res,'Intersect')==1)
                if (KL(1,2)>tK2) || (KL(1,2)<tK1)
                    rel='DIS';
                elseif (KL(1,2)<tK2) && (KL(1,2)>tK1)
                    rel='CRSS';
                elseif (KL(1,2)==tK2) && (KL(1,2)~=tK1)
                    rel='CONV';
                elseif (KL(1,2)~=tK2) && (KL(1,2)==tK1)
                    rel='DIV';
                    
                end
            end
            % between  [tK1, tK2]
            enum=enum+1;
            OUT{1,enum}=enum;
            OUT{2,enum}=rel;
            %disp(['During', ' ', rel])

            if (i==length(K)-1)
                rel='EXNi';
                % between  [tK2, tL2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['During', ' ', rel])
            end
            
            
        elseif (tL1>tK1) && (tL2<tK2)  %  k  contains  l
            if (j==1)
                rel='EXN';
                % between  [tK1, tL1]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Contains', ' ', rel])
            end
            
            if (strcmp(res,'Parallel')==1)
                rel='DIS';
            elseif (strcmp(res,'Colinear')==1)
                rel='EQV';
            elseif (strcmp(res,'Intersect')==1)
                if (KL(1,2)>tL2) || (KL(1,2)<tL1)
                    rel='DIS';
                elseif (KL(1,2)<tL2) && (KL(1,2)>tL1)
                    rel='CRSS';
                elseif (KL(1,2)==tL2) && (KL(1,2)~=tL1)
                    rel='CONV';
                elseif (KL(1,2)~=tL2) && (KL(1,2)==tL1)
                    rel='DIV';
                    
                end
            end
            % between  [tL1, tL2]
            enum=enum+1;
            OUT{1,enum}=enum;
            OUT{2,enum}=rel;
            %disp(['Contains', ' ', rel])
            
            if (j==length(L)-1)
                rel='EXN';
                % between  [tL2, tK2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Contains', ' ', rel])
            end
            
                        
        elseif (tK1==tL1) && (tK2<tL2)  %  k  starts  l
            if (strcmp(res,'Parallel')==1)
                rel='DIS';
            elseif (strcmp(res,'Colinear')==1)
                rel='EQV';
            elseif (strcmp(res,'Intersect')==1)
                if (KL(1,2)>tK2) || (KL(1,2)<tK1)
                    rel='DIS';
                elseif (KL(1,2)<tK2) && (KL(1,2)>tK1)
                    rel='CRSS';
                elseif (KL(1,2)==tK2) && (KL(1,2)~=tK1)
                    rel='CONV';
                elseif (KL(1,2)~=tK2) && (KL(1,2)==tK1)
                    rel='DIV';
                end
            end
            % between  [tK1, tK2]
            enum=enum+1;
            OUT{1,enum}=enum;
            OUT{2,enum}=rel;
            %disp(['Starts', ' ', rel])
            
          %  if (j==1)
          %      rel='EXN';
          %      % between  [tK1, tL1]
          %  end
            if (i==length(K)-1)
                rel='EXNi';
                % between  [tK2, tL2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Starts', ' ', rel])
            end
            
            
        elseif (tL1==tK1) && (tL2<tK2)  %  k  started by  l
            if (strcmp(res,'Parallel')==1)
                rel='DIS';
            elseif (strcmp(res,'Colinear')==1)
                rel='EQV';
            elseif (strcmp(res,'Intersect')==1)
                if (KL(1,2)>tL2) || (KL(1,2)<tL1)
                    rel='DIS';
                elseif (KL(1,2)<tL2) && (KL(1,2)>tL1)
                    rel='CRSS';
                elseif (KL(1,2)==tL2) && (KL(1,2)~=tL1)
                    rel='CONV';
                elseif (KL(1,2)~=tL2) && (KL(1,2)==tL1)
                    rel='DIV';
                end
            end
            % between  [tL1, tL2]
            enum=enum+1;
            OUT{1,enum}=enum;
            OUT{2,enum}=rel;
            %disp(['Started by', ' ', rel])
            
          %  if (j==1)
          %      rel='EXN';
          %      % between  [tK1, tL1]
          %  end
            if (j==length(L)-1)
                rel='EXN';
                % between  [tL2, tK2]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Started by', ' ', rel])
            end
                        
        elseif (tK2==tL2) && (tK1>tL1)  %  k  finishes  l
           
            if (i==1)
                rel='EXNi';
                % between  [tL1, tK1]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Finishes', ' ', rel])
            end
            
            if (strcmp(res,'Parallel')==1)
                rel='DIS';
            elseif (strcmp(res,'Colinear')==1)
                rel='EQV';
            elseif (strcmp(res,'Intersect')==1)
                if (KL(1,2)>tK2) || (KL(1,2)<tK1)
                    rel='DIS';
                elseif (KL(1,2)<tK2) && (KL(1,2)>tK1)
                    rel='CRSS';
                elseif (KL(1,2)==tK2) && (KL(1,2)~=tK1)
                    rel='CONV';
                elseif (KL(1,2)~=tK2) && (KL(1,2)==tK1)
                    rel='DIV';
                end
            end
            % between  [tK1, tK2]
            enum=enum+1;
            OUT{1,enum}=enum;
            OUT{2,enum}=rel;
            %disp(['Finishes', ' ', rel])
           % if (j==length(L)-1)
           %     rel='EXN';
           %     % between  [tL2, tK2]
           % end
            
        elseif (tL2==tK2) && (tL1>tK1)  %  k  finished by  l
            
            if (j==1)
                rel='EXN';
                % between  [tK1, tL1]
                enum=enum+1;
                OUT{1,enum}=enum;
                OUT{2,enum}=rel;
                %disp(['Finished by', ' ', rel])
            end
            
            if (strcmp(res,'Parallel')==1)
                rel='DIS';
            elseif (strcmp(res,'Colinear')==1)
                rel='EQV';
            elseif (strcmp(res,'Intersect')==1)
                if (KL(1,2)>tL2) || (KL(1,2)<tL1)
                    rel='DIS';
                elseif (KL(1,2)<tL2) && (KL(1,2)>tL1)
                    rel='CRSS';
                elseif (KL(1,2)==tL2) && (KL(1,2)~=tL1)
                    rel='CONV';
                elseif (KL(1,2)~=tL2) && (KL(1,2)==tL1)
                    rel='DIV';
                end
            end
            % between  [tL1, tL2]
            enum=enum+1;
            OUT{1,enum}=enum;
            OUT{2,enum}=rel;
            %disp(['Finished by', ' ', rel])

           % if (j==length(L)-1)
           %     rel='EXN';
           %     % between  [tL2, tK2]
           % end
        end
        
    end % for j (L)
end % for i  (K)

end

