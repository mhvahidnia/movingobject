clc;
clear all;


% In this program we examine the stability of our algorithm for extracting
% combinatory trajectory relationships between two agents. The goal is firstly to
% create 5 random set of length 20000 with given initial path relationships
% using MakeRandomRelations2 function. after that, we extract the posible
% combinations using the PathCombination function and then the total path
% relationships based on the TotalPathRelation. For each of 5 set, the
% processing time will be find 50 times. The result can then be evaluated 
% through Box plot in such a way that we can infer whether there is a
% significant difference in processing time which indicates an unstable
% case or not. 



%-------------------------------------------------------------------------------------
% An example non-random trajectry structure with extracted qualitative relations:

% L=cell(2,17);
% for i=1:length(L)
%     L{1,i}=i;
% end
% L{2,1}='EXN'; % L{2,2}='EXN'; % L{2,3}='DIS'; % L{2,4}='DIS'; % L{2,5}='CONV';
% L{2,6}='EQV'; % L{2,7}='EQV'; % L{2,8}='DIV'; % L{2,9}='DIS'; % L{2,10}='DIS';
% L{2,11}='CONV'; % L{2,12}='DIV'; % L{2,13}='DIS'; % L{2,14}='DIS'; % L{2,15}='EXNi';
% L{2,16}='EXNi'; % L{2,17}='EXNi';
%-------------------------------------------------------------------------------------

%L0=L;
lev=0;
for tim=1:1:5
    %hug=10000
    %1000:1000:20000
    clear L
    lev=lev+1;
    L=MakeRandomRelations2(20000);
    %L=[L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L L];
    %L=MakeRandomRelations( tim );
    %L=out;
    L2=L;
    %Lr=L2;
    
    
    
    for j=1:50
        clear InList OutList R L
        L=L2;
        InList=zeros(length(L),1);
        OutList=zeros(length(L),1);
        
        tic;
        [L, InList, OutList]=PathCombination( L,InList, OutList, 1, length(L) );
        R=TotalPathRelation(L,1,length(L));
        toc;
        etime(j,lev)= toc;
    end
    
    
    
    
    %     tic;
    %     L2=PathCombination2( L2, 1, length(L2) );
    %     R2=TotalPathRelation2(L2,1,length(L2));
    %     toc;
    %     etime(2,lev)=toc;
    
    %for i=1:2:15
    %    [isCombinable, combineResult]=Combinable( L{2,L{3,i}} ,L{2,L{3,i+1}} )
    
    %end
end





