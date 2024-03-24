% Comparing PDmmR v FPID in SOPDTUZ control, no noise, w and di steps
% constrained control
clear
close all
Ts=0.001;Tsm=Ts;simT=30;Tmax=simT;  %simulation step and simulation time;
dy=.1;                              %noise amplitude
Kdy=0;                              %noise swiched on/off (1/0)
K=2;T0=1;T=2;                       %SOPDTUZ plant parameters
Ks=0.37;Tdp=1.526;                  %IPDT approximation of SOPDTUZ
rtol=1e-4;atol=1e-4;                % Simulink simulation parameters
Umin=-0.52;Umax=0.52;               %control constraints
tw=Ts;ti=Ts;to=Ts;                  %input step times
do0=0;do=0;                         %initial/final output disturbance value
di0=0;                              %initial disturbance value
w0=0;                               %initial reference setpoint value
%**************************************************************************
% *************************************************************************
w1=1;di1=0; % loop inputs for unit setpoint step responses 
%**************************************************************************
m=1;n=3;Te=0.1;Tf=Te/n; Td=Tdp+Te;  % PD13R controller parameters 
%**************************************************************************
p=0;                                % Fp for p=0
PD1nR_2DOF_Qn                       % simulating loop with PD11R
%**************************************************************************
h=figure(1);                    %adjust the position and size of the image
set(h,'Position',[280 108 760 700]);
%**************************************************************************
subplot(2,1,1)
plot(t,wi,'k:','linewidth',1);hold on
plot(t,y,'k','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'k','linewidth',2);hold on
%return
%**************************************************************************
m=3;n=5;Te=0.5;Tf=Te/n; Td=Tdp+Te;%PD35R controller parameters
% *************************************************************************
p=0;PD3nR_2DOF_Qn                     % simulating loop with PD3nR
subplot(2,1,1)
plot(t,y,'b','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'b','linewidth',2);hold on
%return
%**************************************************************************
m=5;n=7;Te=1;Tf=Te/n; Td=Tdp+Te;% PD57R controller parameters
% *************************************************************************
p=0;PD5nR_2DOF_Qn;
subplot(2,1,1)
plot(t,y,'g','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'g','linewidth',2);hold on
%return
%**************************************************************************
m=7;n=9;Te=1.6;Tf=Te/n; Td=Tdp+Te;% PD57R controller parameters
% *************************************************************************
p=0;PD7nR_2DOF_Qn;
subplot(2,1,1)
plot(t,y,'r','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'r','linewidth',2);hold on
% *************************************************************************
%**************************************************************************
m=1;n=3;Te=0.1;Tf=Te/n; Td=Tdp+Te;  % PD13R controller parameters 
%**************************************************************************
p=1;                                % Fp for p=0
PD1nR_2DOF_Qn                       % simulating loop with PD11R
subplot(2,1,1)
plot(t,y,'k:','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'k:','linewidth',2);hold on
%return
%**************************************************************************
m=3;n=5;Te=0.5;Tf=Te/n; Td=Tdp+Te;%PD35R controller parameters
% *************************************************************************
p=1;PD3nR_2DOF_Qn                     % simulating loop with PD3nR
subplot(2,1,1)
plot(t,y,'b:','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'b:','linewidth',2);hold on
%**************************************************************************
m=5;n=7;Te=1;Tf=Te/n; Td=Tdp+Te;% PD57R controller parameters
% *************************************************************************
p=1;PD5nR_2DOF_Qn;
subplot(2,1,1)
plot(t,y,'g:','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'g:','linewidth',2);hold on
%**************************************************************************
m=7;n=9;Te=1.6;Tf=Te/n; Td=Tdp+Te;% PD57R controller parameters
% *************************************************************************
p=1;PD7nR_2DOF_Qn;
subplot(2,1,1)
plot(t,y,'r:','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'r:','linewidth',2);hold on
%return
% *************************************************************************
subplot(2,1,1)
ylabel('---> y_s(t)');grid
l1='m=1,n=3,T_e=0.1';
l3='m=3,n=5,T_e=0.5';
l5='m=5,n=7,T_e=1.0';
l7='m=7,n=9,T_e=1.6';
legend('w',l1,l3,l5,l7,'location','best')
axis([0 simT -.1 1.05])
subplot(2,1,2)
ylabel('---> u_s(t)');grid
legend(l1,l3,l5,l7,'location','best')
xlabel('---> Time t');
axis([0 simT -.0 0.53])
%return
% *************************************************************************
% *************************************************************************
w1=0;di1=1; % loop inputs - input disturbance step
%**************************************************************************
Umin=-1.02;Umax=0.02;
%**************************************************************************
%**************************************************************************
m=1;n=3;Te=0.1;Tf=Te/n; Td=Tdp+Te;  % PD13R controller parameters 
%**************************************************************************
p=0;PD1nR_2DOF_Qn                       % simulating loop with PD1nR 
%**************************************************************************
h=figure(2);%get(h);          %adjust the position and size of the image
set(h,'Position',[280 108 760 700]); 
%**************************************************************************
subplot(2,1,1)
plot(t,wi,'k:','linewidth',1);hold on
plot(t,y,'k','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'k','linewidth',2);hold on
%return
% %************************************************************************
m=3;n=5;Te=0.5;Tf=Te/n; Td=Tdp+Te;  % PD35R controller parameters
% *************************************************************************
p=0;PD3nR_2DOF_Qn                     % simulating loop with PD3nR
subplot(2,1,1)
plot(t,y,'b','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'b','linewidth',2);hold on
% *************************************************************************
m=5;n=7;Te=1;Tf=Te/n; Td=Tdp+Te;% controller parameters - full plant model
% *************************************************************************
p=0;PD5nR_2DOF_Qn;
subplot(2,1,1)
plot(t,y,'g','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'g','linewidth',2);hold on
%return
% *************************************************************************
m=7;n=9;Te=1.6;Tf=Te/n; Td=Tdp+Te;% controller parameters - full plant model
% *************************************************************************
p=0;PD7nR_2DOF_Qn;
subplot(2,1,1)
plot(t,y,'r','linewidth',2);hold on
subplot(2,1,2)
plot(t,u,'r','linewidth',2);hold on
%return
% *************************************************************************
subplot(2,1,1)
ylabel('---> y_d(t)');grid
legend('w',l1,l3,l5,l7,'location','best')
axis([0 simT -.2 0.7])
subplot(2,1,2)
ylabel('---> u_d(t)');grid
legend(l1,l3,l5,l7,'location','best')
xlabel('---> Time t');
axis([0 simT -1.1 0.1])
return
%******* saving figures by F9 *************************************
%figure(1)
saveas(gcf,'PDmnR_mn5_7_Te.fig')
saveas(gcf,'PDmnR_mn5_7_Te.jpg')
saveas(gcf,'PDmnR_mn5_7_Te.eps')


%******* saving figures by F9 *************************************
figure(1)
saveas(gcf,'PDmnR_mn1_7_Temin_cSR.fig')
saveas(gcf,'PDmnR_mn1_7_Temin_cSR.jpg')
saveas(gcf,'PDmnR_mn1_7_Temin_cSR.eps')
figure(2)
saveas(gcf,'PDmnR_mn1_7_Temin_cDR.fig')
saveas(gcf,'PDmnR_mn1_7_Temin_cDR.jpg')
saveas(gcf,'PDmnR_mn1_7_Temin_cDR.eps')


