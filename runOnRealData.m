% This program has been written by Mohammad H. Vahidnia

% A sample trajectory with extracted qualitative relations between two moving agents
% is defined with the following structure: a row of edge identification and a row of relation
% type such as 'EXN', 'EQV', 'DIS', etc. The MakeRandomRelations and other
% similar functions such as MakeRandomDIS, MakeRandomCRSS2, MakeRandom2RTRN2 etc. 
% can make a random sequence of relations with a given length

% The PathCombination function solves the problem based on a divide and
% conquer strategy along with linked path structure
% The PathCombination2 function solve the problem based on simple brute
% force search.

% The TotalPathRelation function yields the combinatory qualitative
% trajectory relationships between two moving agents

clc;
clear all;

%-------------------------------------------------------------------------------------
% An example non-random trajectry structure with extracted qualitative relations:

 L=cell(2,255);
 for i=1:length(L)
     L{1,i}=i;
 end
 
 L(2,1:255)={'EQV';'EQV';'EQV';'DIV';'CRSS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'CONV';'EQV';'EQV';'DIV';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'CONV';'EQV';'DIV';'DIS';'DIS';'DIS';'DIS';'CONV';'DIV';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'CONV';'DIV';'DIS';'CRSS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS';'DIS'};
 
 
% end
% L{2,1}='EXN'; % L{2,2}='EXN'; % L{2,3}='DIS'; % L{2,4}='DIS'; % L{2,5}='CONV';
% L{2,6}='EQV'; % L{2,7}='EQV'; % L{2,8}='DIV'; % L{2,9}='DIS'; % L{2,10}='DIS';
% L{2,11}='CONV'; % L{2,12}='DIV'; % L{2,13}='DIS'; % L{2,14}='DIS'; % L{2,15}='EXNi';
% L{2,16}='EXNi'; % L{2,17}='EXNi';
%-------------------------------------------------------------------------------------

%L0=L;
lev=0;

% In order to test the performance of developed algorithm, we use different
% trajectories with varibale sizes from low ro high and compute the
% processing time

%for tim=1000:1000:20000
    %1000:1000:20000
   % clear L L2 Lr InList OutList R R2
    lev=lev+1;
   % L=MakeRandomRelations(tim);

    L2=L;
    %Lr=L2;
    
    InList=zeros(length(L),1);
    OutList=zeros(length(L),1);
    
    tic;
    [L, InList, OutList]=PathCombination( L,InList, OutList, 1, length(L) );
    R=TotalPathRelation(L,1,length(L));
    toc;
    etime(1,lev)= toc;
    
    tic;
    L2=PathCombination2( L2, 1, length(L2) );
    R2=TotalPathRelation2(L2,1,length(L2));
    toc;
    etime(2,lev)=toc;
    

%end





