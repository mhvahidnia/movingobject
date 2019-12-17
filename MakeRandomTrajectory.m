function Tr = MakeRandomTrajectory( h )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Tr=zeros(3,h);
Tr(3,1)=round(rand*10);
for i=1:h
    Tr(1,i)=i;
    Tr(2,i)=round(rand*1000);
    if i>=2
        Tr(3,i)=Tr(3,i-1)+ round(rand*19+1);
    end
end

end

