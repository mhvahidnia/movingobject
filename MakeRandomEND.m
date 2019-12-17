function relations = MakeRandomEND( h )

relations=cell(2,h);



for i=1:length(relations)
    relations{1,i}=i;
    % relations{2,i}=i;
    % relations{3,i}=i;
    
    
end

for i=1:round(h/2)
    relations{2,i}='EXN';
end

%relations{2,round(h/3)+1}='DIV';

for i=round(h/2)+1:h
    relations{2,i}='EQV';
end

%relations{2,round(h/3)+3}='CONV';

%for i=round(2*h/3)+1:h
%    relations{2,i}='EXNi';
%end

end



