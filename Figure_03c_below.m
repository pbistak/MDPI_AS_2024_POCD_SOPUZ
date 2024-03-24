% Comparing PDmmR v FPID in SOPDTUZ control, no noise, w and di steps
%**************************************************************************
close all
Ts=0.001;Tsm=Ts;simT=30;Tmax=simT;  %simulation step and simulation time;
dy=.1;                              %noise amplitude
Kdy=0;                              %noise swiched on/off (1/0)
K=2;T0=1;T=2;                       %SOPDTUZ plant parameters
Ks=0.37;Tdp=1.526;                  %IPDT approximation of SOPDTUZ
rtol=1e-4;atol=1e-4;                % Simulink simulation parameters
Umin=-10;Umax=10;                   %control constraints
tw=Ts;ti=Ts;to=Ts;                  %input step times
do0=0;do=0;                         %initial/final output disturbance value
do0=0;do=0;                         %initial/final output disturbance value
di0=0;                              %initial disturbance value
w0=0;                               %initial reference setpoint value
%**************************************************************************
% *************************************************************************
w1=1;di1=0; % loop inputs for unit setpoint step responses 
%**************************************************************************
n=1;Te=0.5*Tdp;Tf=Te/n; Td=Tdp+Te;  % PD11R controller parameters 
%**************************************************************************
p=0;                                % Fp for p=0
PD1nR_2DOF_Qn                       % simulating loop with PD11R
%**************************************************************************
h=figure(1);                    %adjust the position and size of the image
set(h,'Position',[280 108 760 700]);
%**************************************************************************
subplot(3,1,1)
plot(t,wi,'k:','linewidth',1);hold on  % reference setpoint
plot(t,y,'k','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'k','linewidth',2);hold on     % controller output
subplot(3,1,3)
plot(t,dir,'k','linewidth',2);hold on   % reconstructed disturbance
%return
%**************************************************************************
n=3;Te=0.5*Tdp;Tf=Te/n; Td=Tdp+Te;% PD33R controller parameters 
% *************************************************************************
p=0;PD3nR_2DOF_Qn                     % simulating loop with PD3nR
%set(h,'Position',[280 108 560 700]);
subplot(3,1,1)
plot(t,y,'b','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'b','linewidth',2);hold on     % controller output
subplot(3,1,3)
plot(t,dir,'b','linewidth',2);hold on   % reconstructed disturbance
%return
%**************************************************************************
% n=5;Te=0.5*Tdp;Tf=Te/n; Td=Tdp+Te;% PD55R controller parameters
%**************************************************************************
% PD5nR_2DOF_Qn
% subplot(3,1,1)
% plot(t,y,'g','linewidth',2);hold on     % process output
% subplot(3,1,2)
% plot(t,u,'g','linewidth',2);hold on     % controller output
% subplot(3,1,3)
% plot(t,dir,'g','linewidth',2);hold on   % reconstructed disturbance
%**************************************************************************
% n=7;Te=0.75*Tdp;Tf=Te/n; Td=Tdp+Te;% PD77R controller parameters
%**************************************************************************
% PD7nR_2DOF_Qn
% subplot(3,1,1)
% plot(t,y,'r','linewidth',2);hold on     % process output
% subplot(3,1,2)
% plot(t,u,'r','linewidth',2);hold on     % controller output
% subplot(3,1,3)
% plot(t,dir,'r','linewidth',2);hold on   % reconstructed disturbance
%**************************************************************************
PID_MoReRT                  % filtered PID according to Alvaro and Vilanova
subplot(3,1,1)
plot(t,y,'m','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'m','linewidth',2);hold on     % controller output
%subplot(3,1,3)
%plot(t,dir,'m','linewidth',2);hold on  %not reconstructed
% *************************************************************************
% continuing with PDmmR setpoint step responses with Fp for p>1
% *************************************************************************
w=w1;din=di0; % loop inputs
% *************************************************************************
n=1;Te=Tdp/2;Tf=Te/n; Td=Tdp+Te;% PD11R controller parameters
%**************************************************************************
p=1;                            % Fp for p=1
PD1nR_2DOF_Qn                   % simulating loop with PD1nR
subplot(3,1,1)
plot(t,y,'k:','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'k:','linewidth',2);hold on     % controller output
subplot(3,1,3)
plot(t,dir,'k:','linewidth',2);hold on   % reconstructed disturbance
%**************************************************************************
p=2;                            % Fp for p=2
PD1nR_2DOF_Qn                   % simulating loop with PD1nR
subplot(3,1,1)
plot(t,y,'k--','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'k--','linewidth',2);hold on     % controller output
subplot(3,1,3)
plot(t,dir,'k--','linewidth',2);hold on   % reconstructed disturbance
%**************************************************************************
n=3;Te=Tdp/2;Tf=Te/n; Td=Tdp+Te;% PD33R controller parameters 
%**************************************************************************
p=1;                            % Fp for p=1
PD3nR_2DOF_Qn                   % simulating loop with PD3nR
subplot(3,1,1)
plot(t,y,'b:','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'b:','linewidth',2);hold on     % controller output
subplot(3,1,3)
plot(t,dir,'b:','linewidth',2);hold on   % reconstructed disturbance
%**************************************************************************
p=2;                            % Fp for p=2
PD3nR_2DOF_Qn                   % simulating loop with PD3nR
subplot(3,1,1)
plot(t,y,'b--','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'b--','linewidth',2);hold on     % controller output
subplot(3,1,3)
plot(t,dir,'b--','linewidth',2);hold on   % reconstructed disturbance
%**************************************************************************
%**************************************************************************
% description of figure with setpoint responses
%**************************************************************************
subplot(3,1,1)
ylabel('---> y_s(t)');grid
legend('w','m=1','m=3','AV','location','best')
%axis([0 simT -.4 1.4])
subplot(3,1,2)
ylabel('---> u_s(t)');
legend('m=1','m=3','AV','location','best')
%axis([0 simT -.02 0.8])
grid
subplot(3,1,3)
legend('m=1','m=3','location','best')
ylabel('---> d_{irec}(t)');
xlabel('---> Time t');
%axis([0 simT -0.75 .02 ])
grid
%**************************************************************************
%**************************************************************************
%**************************************************************************
% simulation of disturbance responses
%**************************************************************************
w1=0;di1=1;                     % loop inputs - input disturbance step
%**************************************************************************
%**************************************************************************
n=1;Te=0.5*Tdp;Tf=Te/n; Td=Tdp+Te;% PD11R controller parameters
%**************************************************************************
p=0;PD1nR_2DOF_Qn                     % simulating loop with PD11R
h=figure(2);%get(h);          %adjust the position and size of the image
set(h,'Position',[280 108 760 700]);
subplot(3,1,1)
plot(t,wi,'k:','linewidth',1);hold on  % reference setpoint
plot(t,y,'k','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'k','linewidth',2);hold on     % controller output
subplot(3,1,3)
plot(t,dir,'k','linewidth',2);hold on   % reconstructed disturbance
%return
%**************************************************************************
n=3;Te=0.5*Tdp;Tf=Te/n; Td=Tdp+Te;      % PD33R controller parameters
%**************************************************************************
p=0;PD3nR_2DOF_Qn                       % simulating loop with PD33R
subplot(3,1,1)
plot(t,y,'b','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'b','linewidth',2);hold on     % controller output
subplot(3,1,3)
plot(t,dir,'b','linewidth',2);hold on   % reconstructed disturbance
%return
%**************************************************************************
% n=5;Te=0.5*Tdp;Tf=Te/n; Td=Tdp+Te;    % PD55R controller parameters
%**************************************************************************
% p=0; PD5nR_2DOF_Qn
% subplot(3,1,1)
% plot(t,y,'g','linewidth',2);hold on     % process output
% subplot(3,1,2)
% plot(t,u,'g','linewidth',2);hold on     % controller output
% subplot(3,1,3)
% plot(t,dir,'g','linewidth',2);hold on   % reconstructed disturbance
%**************************************************************************
% n=7;Te=0.75*Tdp;Tf=Te/n; Td=Tdp+Te;% PD77R_2DOF_Qn controller parameters
%**************************************************************************
% p=0; PD7nR_2DOF_Qn
% subplot(3,1,1)
% plot(t,y,'r','linewidth',2);hold on     % process output
% subplot(3,1,2)
% plot(t,u,'r','linewidth',2);hold on     % controller output
% subplot(3,1,3)
% plot(t,dir,'r','linewidth',2);hold on   % reconstructed disturbance
%**************************************************************************
PID_MoReRT                  % filtered PID according to Alvaro and Vilanova
subplot(3,1,1)
plot(t,y,'m','linewidth',2);hold on     % process output
subplot(3,1,2)
plot(t,u,'m','linewidth',2);hold on     % controller output
%subplot(3,1,3)
%plot(t,dir,'m','linewidth',2);hold on  %not reconstructed
%**************************************************************************
%**************************************************************************
%**************************************************************************
% description of figure with disturbance responses
%**************************************************************************
subplot(3,1,1)
ylabel('---> y_d(t)');
legend('w','m=1','m=3','AV','location','best')
%axis([0 simT -.25 1.1])
grid
subplot(3,1,2)
ylabel('---> u_d(t)');grid
legend('m=1','m=3','AV','location','best')
subplot(3,1,3)
legend('m=1','m=3','location','best')
ylabel('---> d_{irec}(t)');
xlabel('---> Time t');
%axis([0 simT -1.5 0.4])
grid
return
%*************** sading figures by F9 *************************************
figure(1)
saveas(gcf,'PD11_33_Te_p5Tdp_SR.fig')
saveas(gcf,'PD11_33_Te_p5Tdp_SR.jpg')
saveas(gcf,'PD11_33_Te_p5Tdp_SR.eps')
figure(2)
saveas(gcf,'PD11_33_Te_p5Tdp_DR.fig')
saveas(gcf,'PD11_33_Te_p5Tdp_DR.jpg')
saveas(gcf,'PD11_33_Te_p5Tdp_DR.eps')

%*************** sading figures by F9 *************************************


