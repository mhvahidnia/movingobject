function relations = MakeRandom2RTRN( h )

relations=cell(2,h);



for i=1:length(relations)
    relations{1,i}=i;
    % relations{2,i}=i;
    % relations{3,i}=i;
    
    
end

for i=1:round(h/2)
    relations{2,i}='EQV';
end
relations{2,round(h/2)+1}='DIV';
for i=round(h/2)+2:h-1
    relations{2,i}='DIS';
end
relations{2,h}='CONV';


end


