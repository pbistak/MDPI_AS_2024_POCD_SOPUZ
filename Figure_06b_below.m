% Evaluating and comparing PDmnR in IPDT control, odd m 1-9, noise apl. 0.5
clear
close all
Ts=0.001;Tsm=Ts;simT=100;Tmax=simT;     %simulation step, simulation time
dy=.5;Kdy=1;                            %noise swiched on
K=2;T0=1;T=2;                           % SOPDTUZ process parameters
Ks=0.37;Tdp=1.526;                      % IPDT parameters
rtol=1e-4;atol=1e-4;                    % Simulink simulation parameters
Umax=10;Umin=-Umax;                     %control constraints
tw=Ts;ti=Ts;to=Ts;                      % step times
w0=0;w1=0;                              % initial/final setpoint values
di0=0;di1=1;do0=0;do=0;                 % initial/final disturbance values
%******************************  Labels ***********************************
f0='PD_1^1R';
f1='PD_2^1R';
f2='PD_3^1R';
f3='PD_3^3R';
f4='PD_4^3R';
f5='PD_5^3R';
f6='PD_5^5R';
f7='PD_5^5R';
f8='PD_5^6R';
f9='PD_5^7R';
%**************************************************************************
% vector of Te values
vTe=[.1 .2 .3 .4 .5 .6 .7 .8 .9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2];
vTe3=vTe+0.4;
vTe5=vTe+0.9;
vTe7=vTe+1.5;
%**************************************************************************
%**************************************************************************
dU_FTV1=[];dY_FIAE=[];dY_FTV1=[];
%**************************************************************************
m=1;n=1;p=0;                            % controller & prefilter parameters
%**************************************************************************
j=1;                                %simulation number
for Te=vTe                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD1nR_2DOF_Qn   
   figure(1);plot(t,y,'k','linewidth',1);hold on
   figure(2);plot(t,u,'k','linewidth',1);hold on           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU_FTV1(n,j)=inf;
        dY_FTV1(n,j)=inf;
        dY_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU_FTV1(n,j)=TV1;
        else
            dU_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y);  
        if (abs(u(usizem))<10) 
            dY_FTV1(n,j)= TV1;
            dY_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY_FTV1(n,j)=inf;dY_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
%**************************************************************************
figure(3);                  %SE characteristic
loglog(dU_FTV1(1,:), dY_FIAE(1,:),'k-','linewidth',3);hold on;grid;
xlabel('---> Excessive Control Effort TV_1(u_d)');
ylabel('---> Loop Retardation  IAE_d');
%**************************************************************************
figure(4);                  %SW characteristic
loglog(dY_FTV1(1,:), dY_FIAE(1,:),'k-','linewidth',3); hold on;grid;
xlabel('---> Excessive Output Changes TV_1(y_d)');
ylabel('---> Loop Retardation  IAE_d');
%return
%**************************************************************************
m=1;n=2;p=0;                            % controller & prefilter parameters
%**************************************************************************
j=1;
for Te=vTe                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD1nR_2DOF_Qn
   figure(1);plot(t,y,'k--','linewidth',1);
   figure(2);plot(t,u,'k--','linewidth',1);           
                               %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU_FTV1(n,j)=inf;
        dY_FTV1(n,j)=inf;
        dY_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);
        if (abs(u(usizem))<10) 
            dU_FTV1(n,j)=TV1;
        else
            dU_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y);  
        if (abs(u(usizem))<10) 
            dY_FTV1(n,j)= TV1;
            dY_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY_FTV1(n,j)=inf;dY_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3);
loglog(dU_FTV1(2,:), dY_FIAE(2,:),'k--','linewidth',3); 
figure(4);
loglog(dY_FTV1(2,:), dY_FIAE(2,:),'k--','linewidth',3); 
%*************************************************************************
m=1;n=3;p=0;
%**************************************************************************
j=1;
for Te=vTe                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD1nR_2DOF_Qn
   figure(1);plot(t,y,'k:','linewidth',1);
   %axis([0 40 -.2 1.35 ])
   figure(2);plot(t,u,'k:','linewidth',1);  
   %axis([0 40 -1.35 0.4])
                               %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU_FTV1(n,j)=inf;
        dY_FTV1(n,j)=inf;
        dY_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);
        if (abs(u(usizem))<10) 
            dU_FTV1(n,j)=TV1;
        else
            dU_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y);  
        if (abs(u(usizem))<10) 
            dY_FTV1(n,j)= TV1;
            dY_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY_FTV1(n,j)=inf;dY_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3);
loglog(dU_FTV1(3,:), dY_FIAE(3,:),'k:','linewidth',3); 
figure(4);
loglog(dY_FTV1(3,:), dY_FIAE(3,:),'k:','linewidth',3); 
%return
%**************************************************************************
dU3_FTV1=[];dY3_FIAE=[];dY3_FTV1=[];
%**************************************************************************
m=3;n=3;p=0;
%**************************************************************************
j=1;
for Te=vTe3                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD3nR_2DOF_Qn
   figure(1);plot(t,y,'b','linewidth',1);
   figure(2);plot(t,u,'b','linewidth',1);           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU3_FTV1(n,j)=inf;
        dY3_FTV1(n,j)=inf;
        dY3_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU3_FTV1(n,j)=TV1;
        else
            dU3_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dY3_FTV1(n,j)= TV1;
            dY3_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY3_FTV1(n,j)=inf;dY3_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3); 
loglog(dU3_FTV1(3,:), dY3_FIAE(3,:),'b','linewidth',3);
figure(4);
loglog(dY3_FTV1(3,:), dY3_FIAE(3,:),'b','linewidth',3);
%**************************************************************************
m=3;n=4;p=0;
%**************************************************************************
j=1;
for Te=vTe3                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD3nR_2DOF_Qn
   figure(1);plot(t,y,'b--','linewidth',1);
   figure(2);plot(t,u,'b--','linewidth',1);           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU3_FTV1(n,j)=inf;
        dY3_FTV1(n,j)=inf;
        dY3_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU3_FTV1(n,j)=TV1;
        else
            dU3_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dY3_FTV1(n,j)= TV1;
            dY3_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY3_FTV1(n,j)=inf;dY3_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3); 
loglog(dU3_FTV1(4,:), dY3_FIAE(4,:),'b--','linewidth',3);
figure(4);
loglog(dY3_FTV1(4,:), dY3_FIAE(4,:),'b--','linewidth',3);
%**************************************************************************
m=3;n=5;p=0;
%**************************************************************************
j=1;
for Te=vTe3                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD3nR_2DOF_Qn
   figure(1);plot(t,y,'b:','linewidth',1);
   figure(2);plot(t,u,'b:','linewidth',1);           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU3_FTV1(n,j)=inf;
        dY3_FTV1(n,j)=inf;
        dY3_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU3_FTV1(n,j)=TV1;
        else
            dU3_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dY3_FTV1(n,j)= TV1;
            dY3_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY3_FTV1(n,j)=inf;dY3_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3); 
loglog(dU3_FTV1(5,:), dY3_FIAE(5,:),'b:','linewidth',3);
figure(4);
loglog(dY3_FTV1(5,:), dY3_FIAE(5,:),'b:','linewidth',3);
%return
%**************************************************************************
dU5_FTV1=[];dY5_FIAE=[];dY5_FTV1=[];
%**************************************************************************
m=5;n=5;p=0;
j=1;
for Te=vTe5                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD5nR_2DOF_Qn
   figure(1);plot(t,y,'g','linewidth',1);
   figure(2);plot(t,u,'g','linewidth',1);           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU5_FTV1(n,j)=inf;
        dY5_FTV1(n,j)=inf;
        dY5_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU5_FTV1(n,j)=TV1;
        else
            dU5_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dY5_FTV1(n,j)= TV1;
            dY5_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY5_FTV1(n,j)=inf;dY5_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3); 
loglog(dU5_FTV1(5,:), dY5_FIAE(5,:),'g','linewidth',3);
figure(4);
loglog(dY5_FTV1(5,:), dY5_FIAE(5,:),'g','linewidth',3);
%**************************************************************************
m=5;n=6;p=0;
%**************************************************************************
j=1;
for Te=vTe5                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD5nR_2DOF_Qn
   figure(1);plot(t,y,'g--','linewidth',1);
   figure(2);plot(t,u,'g--','linewidth',1);           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU5_FTV1(n,j)=inf;
        dY5_FTV1(n,j)=inf;
        dY5_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU5_FTV1(n,j)=TV1;
        else
            dU5_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dY5_FTV1(n,j)= TV1;
            dY5_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY5_FTV1(n,j)=inf;dY5_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3); 
loglog(dU5_FTV1(6,:), dY5_FIAE(6,:),'g--','linewidth',3);
figure(4);
loglog(dY5_FTV1(6,:), dY5_FIAE(6,:),'g--','linewidth',3);
%**************************************************************************
m=5;n=7;p=0;
%**************************************************************************
j=1;
for Te=vTe5                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD5nR_2DOF_Qn
   figure(1);plot(t,y,'g:','linewidth',1);
   figure(2);plot(t,u,'g:','linewidth',1);           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU5_FTV1(n,j)=inf;
        dY5_FTV1(n,j)=inf;
        dY5_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU5_FTV1(n,j)=TV1;
        else
            dU5_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dY5_FTV1(n,j)= TV1;
            dY5_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY5_FTV1(n,j)=inf;dY5_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3); 
loglog(dU5_FTV1(7,:), dY5_FIAE(7,:),'g:','linewidth',3);
figure(4);
loglog(dY5_FTV1(7,:), dY5_FIAE(7,:),'g:','linewidth',3);
%return
%**************************************************************************
dU7_FTV1=[];dY7_FIAE=[];dY7_FTV1=[];
%**************************************************************************
m=7;n=7;p=0;
%**************************************************************************
j=1;
for Te=vTe7                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD7nR_2DOF_Qn
   figure(1);plot(t,y,'r','linewidth',1);hold on
   figure(2);plot(t,u,'r','linewidth',1);hold on           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU7_FTV1(n,j)=inf;
        dY7_FTV1(n,j)=inf;
        dY7_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU7_FTV1(n,j)=TV1;
        else
            dU7_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dY7_FTV1(n,j)= TV1;
            dY7_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY7_FTV1(n,j)=inf;dY7_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3); 
loglog(dU7_FTV1(7,:), dY7_FIAE(7,:),'r','linewidth',3);
figure(4);
loglog(dY7_FTV1(7,:), dY7_FIAE(7,:),'r','linewidth',3);
%**************************************************************************
m=7;n=8;p=0;
%**************************************************************************
j=1;
for Te=vTe7                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD7nR_2DOF_Qn
   figure(1);plot(t,y,'r--','linewidth',1);
   figure(2);plot(t,u,'r--','linewidth',1);           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU7_FTV1(n,j)=inf;
        dY7_FTV1(n,j)=inf;
        dY7_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU7_FTV1(n,j)=TV1;
        else
            dU7_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dY7_FTV1(n,j)= TV1;
            dY7_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY7_FTV1(n,j)=inf;dY7_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
figure(3); 
loglog(dU7_FTV1(8,:), dY7_FIAE(8,:),'r--','linewidth',3);
figure(4);
loglog(dY7_FTV1(8,:), dY7_FIAE(8,:),'r--','linewidth',3);
%**************************************************************************
m=7;n=9;p=0;
%**************************************************************************
j=1;
for Te=vTe7                          %j=1,2,... (index of Te)
   Td=Tdp+Te;
   Tf=Te/n;
   PD7nR_2DOF_Qn
   figure(1);plot(t,y,'r:','linewidth',1);
   figure(2);plot(t,u,'r:','linewidth',1);           
   
                            %performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dU7_FTV1(n,j)=inf;
        dY7_FTV1(n,j)=inf;
        dY7_FIAE(n,j)= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dU7_FTV1(n,j)=TV1;
        else
            dU7_FTV1(n,j)=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dY7_FTV1(n,j)= TV1;
            dY7_FIAE(n,j)= Ts*sum(abs(wi-y));                
        else
            dY7_FTV1(n,j)=inf;dY7_FIAE(n,j)=inf;
        end 
    end
    j=j+1;
end
%**************************************************************************
%**************************************************************************
PID_MoReRT
%performance & shape analysis
   [usizem,uin]=size(u);[ysizem, yin] = size(y);
    if (max(t)<0.9*simT)
        dUAV_FTV1=inf;
        dYAV_FTV1=inf;
        dYAV_FIAE= inf;
    else
        [~, ~, TV1, ~, ~, ~]=ShapePar4(u);

        if (abs(u(usizem))<10) 
            dUAV_FTV1=TV1;
        else
            dUAV_FTV1=inf;
        end
        [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
        if (abs(u(usizem))<10) 
            dYAV_FTV1= TV1;
            dYAV_FIAE= Ts*sum(abs(wi-y));                
        else
            dYAV_FTV1=inf;dYAV_FIAE=inf;
        end 
    end
figure(3); 
loglog(dU7_FTV1(9,:), dY7_FIAE(9,:),'r:','linewidth',3);
h=loglog(dUAV_FTV1, dYAV_FIAE,'m+','linewidth',3);set(h,'MarkerSize',12)
figure(4);
loglog(dY7_FTV1(9,:), dY7_FIAE(9,:),'r:','linewidth',3);
h=loglog(dYAV_FTV1, dYAV_FIAE,'m+','linewidth',3);set(h,'MarkerSize',12)
%axis([10^(-5) .4 3.5 50])
%**************************************************************************
figure(3); 
%loglog(dU9_FTV1(n,:), dY9_FIAE(n,:),'m:','linewidth',3);
axis([.8 670000 4.4 22])
%axis([10^(-.1) 4*10^4 3.5 45]) %noise .1
%axis([10^(-.1) 5*10^4 3.0 45]) 
%axis([10^(-.1) 8*10^4 2.7 45])
figure(4);
%loglog(dY9_FTV1(n,:), dY9_FIAE(n,:),'m:','linewidth',3);
axis([2.1 300 4.4 22])
% axis([2 25 3.5 45]) %noise .1
% axis([10^(-3.5) 35 3.0 45])
% axis([10^(-3.5) 55 2.7 45])
return
%**************************************************************************
legend(f0,f1,f2,f3,f4,f5,f6,'AV',location','best');
return
%*************** saving figures by F9 *************************************
figure(1)
xlabel('---> Time t');
ylabel('---> Proces Output y_d(t)');
axis([0 40 -.2 1.30]);
grid
%legend(f0,'location','best');
saveas(gcf,'PD1_7nR_S2UZ_y_np5.fig')  
saveas(gcf,'PD1_7nR_S2UZ_y_np5.jpg') 
saveas(gcf,'PD1_7nR_S2UZ_y_np5.eps') 

figure(2)
xlabel('---> Time t');
ylabel('---> Process Input u_d(t)');
%legend(f0,'location','best');
axis([0 40 -1.35 0.4]);
grid
saveas(gcf,'PD1_7nR_S2UZ_u_np5.fig')
saveas(gcf,'PD1_7nR_S2UZ_u_np5.jpg')
saveas(gcf,'PD1_7nR_S2UZ_u_np5.eps')

figure(3)
saveas(gcf,'PD1_7nR_S2UZ_IAE_uTV1_np5.fig')  
saveas(gcf,'PD1_7nR_S2UZ_IAE_uTV1_np5.jpg') 
saveas(gcf,'PD1_7nR_S2UZ_IAE_uTV1_np5.eps') 
figure(4)
saveas(gcf,'PD1_7nR_S2UZ_IAE_yTV1_np5.fig')
saveas(gcf,'PD1_7nR_S2UZ_IAE_yTV1_np5.jpg')
saveas(gcf,'PD1_7nR_S2UZ_IAE_yTV1_np5.eps')

