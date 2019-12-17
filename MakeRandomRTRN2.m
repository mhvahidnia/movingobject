function relations = MakeRandomRTRN2( h )

relations=cell(2,h);



for i=1:length(relations)
    relations{1,i}=i;
    % relations{2,i}=i;
    % relations{3,i}=i;
    
    
end

relations{2,1}='DIV';
for i=2:round(h/2)
    relations{2,i}='DIS';
end
relations{2,round(h/2)+1}='CONV';
for i=round(h/2)+2:h
    relations{2,i}='EQV';
end

end

