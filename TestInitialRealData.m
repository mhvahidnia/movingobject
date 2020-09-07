
clc
clear all
Data=xlsread('E:\PathRelationships\ICLP2018-master\ICLP2018-master\dataRegion.xls');

K=zeros(3,256);
%L=zeros(3,256);

for i=1:length(K)
    K(1,i)=i;
    K(2,i)=Data(1,i);
    K(3,i)=i;
end
% for i=1:length(L)
%     L(1,i)=i;
%     L(2,i)=Data(2,i);
%     L(3,i)=i;
% end

figure(3)



plot(K(2,1:length(K)),K(3,1:length(K)),'k','Linewidth',5);

    xlabel('Regions','FontSize',12, 'FontWeight', 'bold') % x-axis label
    ylabel('Time','FontSize',12, 'FontWeight', 'bold') % y-axis label
    
hold on


O=[];
dim=0;

lev=0;
for f=2:15
    L=[];
    dim=0;
    for i=1:length(K)
        if ~isnan((Data(f,i)))  %f=2
            dim=dim+1;
            L(1,i)=i;
            L(2,i)=Data(f,i); %f=2
            L(3,i)=i;
            
        end
        
    end
    
      lev=lev+1;
    tic;
    OUT4 = InitialPathRelation4( K,L ); %bruteforce & Allen Interval
    toc;
    etime(1,lev)= toc;
    
    tic;
    OUT3 = InitialPathRelation3( K,L ); %heapsort
    toc;
    etime(2,lev)= toc;
    
    
    
       

    if lev==1
         plot(L(2,1:dim),L(3,1:dim), 'r','LineWidth',4);
    else
         plot(L(2,1:dim),L(3,1:dim),'--', 'color',[rand,rand,rand],'LineWidth',1);
    end
    

    
end




figure(2)

x=[1:14];


y1i=etime(1,1:1:14);


plot(x,y1i,'-ro', 'LineWidth', 2,...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'r',...
    'MarkerSize', 10);
y1=etime(2,1:1:14);
%y=data(1,:);
hold all
plot(x,y1,'--bs', 'LineWidth', 2,...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'g',...
    'MarkerSize', 10);

legend('The algorithm with brute-force search and Allen interval algebra','The algorithm with heapsort and linked list data structure', 'Location','northwest')
title('Test of IQTRs Algorithms on Real Data ')
xlabel('Number of Test') % x-axis label
ylabel('Running Time in Seconds') % y-axis label

xlim([1 14])
ylim([0 10])