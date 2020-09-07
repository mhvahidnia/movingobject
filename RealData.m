
clc
clear X Y T L i j s  d e f lat lon


row=15;
col=256;

%data=xlsread('E:\PathRelationships\ICLP2018-master\ICLP2018-master\data.xls');

X=zeros(row,col);
Y=zeros(row,col);
T=[1:col];
L=zeros(row,1);

for i=1:row
    s=0;
    for j=1:col
        
       d= data{i,j};
       
       if ~isempty(d)
           s=s+1;
           e=regexp(d,'[^(]+.*[^)]+','match');
           f=strsplit(e{1},',');
           lat=str2double(f(1));
           lon=str2double(f(2));
           X(i,j)=lat;
           Y(i,j)=lon;
           L(i)=s;
       end
    
    
    
    end
end

figure(1)
plot3(X(1,1:L(1)),Y(1,1:L(1)),T(1:L(1)),'k','LineWidth',5);

for i=2:row
    grid on
    
    if i>=2
       hold on 
    end
    if  i==2
        lw=5;
        plot3(X(i,1:L(i)),Y(i,1:L(i)),T(1:L(i)),'r','LineWidth',lw);
    else
        lw=1;
        plot3(X(i,1:L(i)),Y(i,1:L(i)),T(1:L(i)),'-','color',[rand,rand,rand],'LineWidth',lw);
    end
    
    xlabel('Latitude','FontSize',12, 'FontWeight', 'bold') % x-axis label
    ylabel('Longitude','FontSize',12, 'FontWeight', 'bold') % y-axis label
    zlabel('Time','FontSize',12, 'FontWeight', 'bold')

    
end

