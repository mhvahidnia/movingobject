function [ a,r ] = Combinable( k,l )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if (strcmp(k,'EXN')==1) && (strcmp(l,'EXN')==1)
    a=1;
    r='EXN';
elseif (strcmp(k,'EXNi')==1) && (strcmp(l,'EXNi')==1)
    a=1;
    r='EXNi';
elseif (strcmp(k,'DIS')==1) && (strcmp(l,'DIS')==1)
    a=1;
    r='DIS';
elseif (strcmp(k,'EQV')==1) && (strcmp(l,'EQV')==1)
    a=1;
    r='EQV';
elseif (strcmp(k,'DIS')==1) && (strcmp(l,'CONV')==1)
    a=1;
    r='CONV';
elseif (strcmp(k,'DIV')==1) && (strcmp(l,'DIS')==1)
    a=1;
    r='DIV';
elseif (strcmp(k,'CONV')==1) && (strcmp(l,'EQV')==1)...
        || (strcmp(k,'CONV2')==1) && (strcmp(l,'EQV')==1)...
        || (strcmp(k,'DIS')==1) && (strcmp(l,'CONV2')==1)
    a=1;
    r='CONV2';
elseif (strcmp(k,'EQV')==1) && (strcmp(l,'DIV')==1)...
        || (strcmp(k,'EQV')==1) && (strcmp(l,'DIV2')==1)...
        || (strcmp(k,'DIV2')==1) && (strcmp(l,'DIS')==1)
    a=1;
    r='DIV2';
elseif (strcmp(k,'EXN')==1) && (strcmp(l,'EQV')==1)...
        || (strcmp(k,'END')==1) && (strcmp(l,'EQV')==1)...
        || (strcmp(k,'EXN')==1) && (strcmp(l,'END')==1)
    a=1;
    r='END';    
elseif (strcmp(k,'EQV')==1) && (strcmp(l,'EXN')==1)...
        || (strcmp(k,'STRT')==1) && (strcmp(l,'EXN')==1)...
        || (strcmp(k,'EQV')==1) && (strcmp(l,'STRT')==1)
    a=1;
    r='STRT';      
elseif (strcmp(k,'EXNi')==1) && (strcmp(l,'EQV')==1)...
        || (strcmp(k,'ENDi')==1) && (strcmp(l,'EQV')==1)...
        || (strcmp(k,'EXNi')==1) && (strcmp(l,'END')==1)
    a=1;
    r='ENDi';
elseif (strcmp(k,'EQV')==1) && (strcmp(l,'EXNi')==1)...
        || (strcmp(k,'STRTi')==1) && (strcmp(l,'EXNi')==1)...
        || (strcmp(k,'EQV')==1) && (strcmp(l,'STRTi')==1)
    a=1;
    r='STRTi';
elseif (strcmp(k,'ENDi')==1) && (strcmp(l,'EXNi')==1)...
        || (strcmp(k,'EXNi')==1) && (strcmp(l,'STRTi')==1)...
        || (strcmp(k,'ENDi')==1) && (strcmp(l,'STRTi')==1)
    a=1;
    r='DUR';
elseif (strcmp(k,'END')==1) && (strcmp(l,'EXN')==1)...
        || (strcmp(k,'EXN')==1) && (strcmp(l,'STRT')==1)...
        || (strcmp(k,'END')==1) && (strcmp(l,'STRT')==1)
    a=1;
    r='CONT';
elseif (strcmp(k,'CONV')==1) && (strcmp(l,'DIV')==1)...
        || (strcmp(k,'DIS')==1) && (strcmp(l,'CRSS')==1)...
        || (strcmp(k,'CRSS')==1) && (strcmp(l,'DIS')==1)
    a=1;
    r='CRSS';
elseif (strcmp(k,'CONV2')==1) && (strcmp(l,'DIV')==1)...
        || (strcmp(k,'CONV2')==1) && (strcmp(l,'DIV2')==1)...
        || (strcmp(k,'CONV')==1) && (strcmp(l,'DIV2')==1)...
        || (strcmp(k,'DIS')==1) && (strcmp(l,'CRSS2')==1)...
        || (strcmp(k,'CRSS2')==1) && (strcmp(l,'DIS')==1)
    a=1;
    r='CRSS2';
elseif (strcmp(k,'DIV')==1) && (strcmp(l,'CONV')==1)
    a=1;
    r='RTRN';
elseif (strcmp(k,'RTRN')==1) && (strcmp(l,'EQV')==1)...
        || (strcmp(k,'RTRN2')==1) && (strcmp(l,'EQV')==1)...
        || (strcmp(k,'DIV')==1) && (strcmp(l,'CONV2')==1)
    a=1;
    r='RTRN2';
elseif (strcmp(k,'EQV')==1) && (strcmp(l,'RTRN')==1)...
        || (strcmp(k,'EQV')==1) && (strcmp(l,'2RTRN')==1)...
        || (strcmp(k,'DIV2')==1) && (strcmp(l,'CONV')==1)
    a=1;
    r='2RTRN';
elseif (strcmp(k,'EQV')==1) && (strcmp(l,'RTRN2')==1)...
        || (strcmp(k,'DIV2')==1) && (strcmp(l,'CONV2')==1)...
        || (strcmp(k,'EQV')==1) && (strcmp(l,'2RTRN2')==1)...
        || (strcmp(k,'2RTRN')==1) && (strcmp(l,'EQV')==1)...
        || (strcmp(k,'2RTRN2')==1) && (strcmp(l,'EQV')==1)
    a=1;
    r='2RTRN2';
else
    a=0;
    r='';
end
    
end

