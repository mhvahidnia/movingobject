clc;
clear all;

warning('off','all');

%K=MakeRandomTrajectory(1000);
%L=MakeRandomTrajectory(1000);


%OUT = InitialPathRelation2( K,L );


% %------------------- A sample data for trajectory of two agents-----------
% K=zeros(3,11);
% L=zeros(3,10);
% 
% for i=1:length(K)
%     K(1,i)=i;
% end
% for i=1:length(L)
%     L(1,i)=i;
% end
% 
% %Position
% K(2,1)=1;
% K(2,2)=1;
% K(2,3)=2;
% K(2,4)=5;
% K(2,5)=6;
% K(2,6)=5;
% K(2,7)=11;
% K(2,8)=13;
% K(2,9)=12;
% K(2,10)=13;
% K(2,11)=13;
% 
% %Time 
% K(3,1)=1;
% K(3,2)=2;
% K(3,3)=3;
% K(3,4)=7;
% K(3,5)=10;
% K(3,6)=12;
% K(3,7)=14;
% K(3,8)=18;
% K(3,9)=20;
% K(3,10)=22;
% K(3,11)=23;
% 
% %-------------
% 
% L(2,1)=6;
% L(2,2)=7;
% L(2,3)=3;
% L(2,4)=9;
% L(2,5)=9;
% L(2,6)=11.5;
% L(2,7)=12.5;
% L(2,8)=15;
% L(2,9)=12;
% L(2,10)=15;
% 
% L(3,1)=4;
% L(3,2)=5;
% L(3,3)=8;
% L(3,4)=9;
% L(3,5)=14;
% L(3,6)=15;
% L(3,7)=17;
% L(3,8)=19;
% L(3,9)=20;
% L(3,10)=21;
%     OUT4 = InitialPathRelation4( K,L ); %heapsort
%     OUT2 = InitialPathRelation2( K,L ); % selectionsort
% %-----------------------------------------------------------------------




lev=0;

for tim=200:200:2000
    %1000:1000:20000
    clear K L OUT OUT2
    lev=lev+1;
    K=MakeRandomTrajectory(tim);
    L=MakeRandomTrajectory(tim);

    %L2=L;
    %Lr=L2;
    
    %InList=zeros(length(L),1);
    %OutList=zeros(length(L),1);
    
    tic;
    OUT4 = InitialPathRelation4( K,L ); %bruteforce & Allen Interavl
    toc;
    etime(1,lev)= toc;
    
    tic;
    OUT3 = InitialPathRelation3( K,L ); %heapsort
    toc;
    etime(2,lev)= toc;
    

    

end


