% Illustration of minimal Te choise for PDmnR controllers in S2UZ control 
% no noise, w and di steps
%**************************************************************************
close all
clear
Ts=0.001;Tsm=Ts;simT=30;Tmax=simT;  %simulation step and simulation time;
dy=.1;                              %noise amplitude
Kdy=0;                              %noise swiched on/off (1/0)
K=2;T0=1;T=2;                       %SOPDTUZ plant parameters
Ks=0.37;Tdp=1.526;                  %IPDT approximation of SOPDTUZ
rtol=1e-4;atol=1e-4;                % Simulink simulation parameters
Umin=-10;Umax=10;                   %control constraints
tw=Ts;ti=Ts;to=Ts;                  %input step times
do0=0;do=0;                         %initial/final output disturbance value
di0=0;                              %initial disturbance value
w0=0;                               %initial reference setpoint value
%**************************************************************************
% *************************************************************************
w1=0;di1=1; % loop inputs for unit disturbance step responses 
% *************************************************************************
m=5;n=7;Te=1;Tf=Te/n; Td=Tdp+Te;    % PD57R controller parameters 
% *************************************************************************
p=0;PD5nR_2DOF_Qn;                  % simulating loop with PD5nR
h=figure(2);%get(h);                %adjust the position/size of the image
set(h,'Position',[280 108 760 700]);
subplot(2,1,1)
plot(t,y,'g','linewidth',2);hold on     % process outpu
subplot(2,1,2)
plot(t,u,'g','linewidth',2);hold on     % controller output
% subplot(3,1,3)
% plot(t,dir,'k','linewidth',2);hold on % reconstructed disturbance
%return
% *************************************************************************
m=7;n=9;Te=1.6;Tf=Te/n; Td=Tdp+Te;% PD57R controller parameters 
% *************************************************************************
p=0;PD7nR_2DOF_Qn
subplot(2,1,1)
plot(t,y,'r-','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'r-','linewidth',2);hold on
% subplot(3,1,3)
% plot(t,dir,'r','linewidth',2);hold on
%**************************************************************************
m=7;n=9;Te=1.5;Tf=Te/n; Td=Tdp+Te;% PD57R controller parameters 
% *************************************************************************
p=0;PD7nR_2DOF_Qn
subplot(2,1,1)
plot(t,y,'r:','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'r:','linewidth',2);hold on
% subplot(3,1,3)
% plot(t,dir,'m','linewidth',2);hold on
%**************************************************************************
subplot(2,1,1)
ylabel('---> y_d(t)');
grid
l1='m=5,n=7,T_e=1';l2='m=7,n=9,T_e=1.6';l3='m=7,n=9,T_e=1.5';
legend(l1,l2,l3,'location','best');
axis([0 simT -.3 0.8])
subplot(2,1,2)
ylabel('---> u_d(t)');grid
legend(l1,l2,l3,'location','best');
xlabel('---> Time t');
axis([0 simT -1.7 1.28])
return
%*************** saving figures by F9 *************************************
%figure(1)
saveas(gcf,'PDmnR_mn5_7_Te.fig')
saveas(gcf,'PDmnR_mn5_7_Te.jpg')
saveas(gcf,'PDmnR_mn5_7_Te.eps')



