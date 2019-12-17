function relations = MakeRandomDISEQV( h )

relations=cell(2,h);



for i=1:2:length(relations)
    relations{1,i}=i;
    relations{1,i+1}=i;
    relations{2,i}='DIS';
    relations{2,i+1}='EQV';
    % relations{2,i}=i;
    % relations{3,i}=i;
    
    
end


end


