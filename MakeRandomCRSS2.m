function relations = MakeRandomCRSS2( h )

relations=cell(2,h);



for i=1:length(relations)
    relations{1,i}=i;
    % relations{2,i}=i;
    % relations{3,i}=i;
    
    
end

for i=1:round(h/3)
    relations{2,i}='DIS';
end

relations{2,round(h/3)+1}='CONV';

for i=round(h/3)+2:round(2*h/3)
    relations{2,i}='EQV';
end

relations{2,round(2*h/3)+1}='DIV';

for i=round(2*h/3)+2:h
    relations{2,i}='DIS';
end

end


