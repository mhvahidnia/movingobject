function relations = MakeRandomRelations( h )

relations=cell(2,h);

firstRelNum=round(rand*3+1);
if (firstRelNum==1)
    firstRel='DIS';
elseif (firstRelNum==2)
    firstRel='EQV';
elseif (firstRelNum==3)
    firstRel='CONV';
elseif (firstRelNum==4)
    firstRel='DIV';
end

for i=1:length(relations)
    relations{1,i}=i;
   % relations{2,i}=i;
   % relations{3,i}=i;
    
    
    
end

relations{2,1}=firstRel;

for i=2:length(relations)
    prevRel=relations{2,i-1};
    
    if (strcmp(prevRel,'DIS')==1)
        curRelNum=round(rand*1+1);
        if (curRelNum==1)
            curRel='CONV';
            relations{2,i}=curRel;
        elseif (curRelNum==2)
            curRel='DIS';
            relations{2,i}=curRel;
            relations{2,i+1}=curRel;
            i=i+1;
        end
        
        
    elseif (strcmp(prevRel,'EQV')==1)
        curRelNum=round(rand*1+1);
        if (curRelNum==1)
            curRel='DIV';
            relations{2,i}=curRel;
        elseif (curRelNum==2)
            curRel='EQV';
            relations{2,i}=curRel;
            relations{2,i+1}=curRel;
            i=i+1;
        end
        
        
    elseif (strcmp(prevRel,'CONV')==1)
        curRelNum=round(rand*1+1);
        if (curRelNum==1)
            curRel='DIV';
            relations{2,i}=curRel;
        elseif (curRelNum==2)
            curRel='EQV';
            relations{2,i}=curRel;
            relations{2,i+1}=curRel;
            i=i+1;
        end
        
        
    elseif (strcmp(prevRel,'DIV')==1)
        curRelNum=round(rand*1+1);
        if (curRelNum==1)
            curRel='CONV';
            relations{2,i}=curRel;
        elseif (curRelNum==2)
            curRel='DIS';
            relations{2,i}=curRel;
            relations{2,i+1}=curRel;
            i=i+1;
        end
        
        
    end
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes here
    
    
end

