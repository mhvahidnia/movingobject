function R = TotalPathRelation( L, p, r )
R=cell(0,0);
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i=p:r
    %if (L{1,i}==L{3,i})
        R=[R L{2,i}];
    %end
end


end

