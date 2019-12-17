function relations = MakeRandomRelations2( h )

relations=cell(2,h);

for i=1:length(relations)
    relations{1,i}=i;
    curRelNum=round(rand*5+0);
    % relations{2,i}=i;
    % relations{3,i}=i;
    if (curRelNum==0)
        curRel='EXN';
        relations{2,i}=curRel;
        relations{2,i+1}=curRel;
        i=i+1;
    elseif (curRelNum==1)
        curRel='DIS';
        relations{2,i}=curRel;
        relations{2,i+1}=curRel;
        i=i+1;
    elseif (curRelNum==2)
        curRel='EQV';
        relations{2,i}=curRel;
        relations{2,i+1}=curRel;
        i=i+1;
    elseif (curRelNum==3)
        curRel='CONV';
        relations{2,i}=curRel;
    elseif (curRelNum==4)
        curRel='DIV';
        relations{2,i}=curRel;
    elseif (curRelNum==5)
        curRel='EXNi';
        relations{2,i}=curRel;
        relations{2,i+1}=curRel;
        i=i+1;
    end
    
    
end

end

