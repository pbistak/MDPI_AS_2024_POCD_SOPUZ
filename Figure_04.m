% Drawing set of PD11R responses of SOPDT process input/output , no noisese
% the path to the PD11R controller must be set
clear
close all
Ts=0.001;Tsm=Ts;simT=100;Tmax=simT;  %simulation step and simulation time;
dy=.05;Kdy=0;                       %noise swiched off

K=2;T0=1;T=2;                           % SOPDTUZ process parameters
Ks=0.37;Tdp=1.526;                      % IPDT parameters
rtol=1e-4;atol=1e-4;                    % Simulink simulation parameters
Umax=10;Umin=-Umax;                     %control constraints
tw=Ts;ti=Ts;to=Ts;do0=0;                 % step times
w0=0;w1=0;                              % initial/final setpoint values
di0=0;di1=1;do=0;                            % initial/final disturbance values
%**************************************************************************
% vector of Te values
vTe=[.1 .2 .3 .4 .5 .6 .7 .8 .9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2];
%**************************************************************************
m=1;n=1;p=0;                            % controller & prefilter parameters
%**************************************************************************
for Te=vTe                          
   Td=Tdp+Te;
   Tf=Te/n;
   PD1nR_2DOF_Qn
   figure(1);plot(t,y,'k','linewidth',1);hold on    % process output
   figure(2);plot(t,u,'k','linewidth',1);hold on    % controller output   
end
%**************************************************************************
figure(1)
xlabel('---> Time t');
ylabel('---> Proces Output y_d(t)');
axis([0 40 -.2 1.30]);
grid
figure(2)
xlabel('---> Time t');
ylabel('---> Process Input u_d(t)');
axis([0 40 -1.35 0.4]);
grid
return
%*************** saving figures by F9 *************************************
figure(1)
saveas(gcf,'PD11R_S2UZ_y_nn.fig')  
saveas(gcf,'PD11R_S2UZ_y_nn.jpg') 
saveas(gcf,'PD11R_S2UZ_y_nn.eps') 

figure(2)
saveas(gcf,'PD11R_S2UZ_u_nn.fig')
saveas(gcf,'PD11R_S2UZ_nn.jpg')
saveas(gcf,'PPD11R_S2UZ_u_nn.eps')



