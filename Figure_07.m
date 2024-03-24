%Nyquist curve of IPDT model approximating SOPDTUZ system
clear
close all
Ks=1;Tdp=1.526;% exact value of Ksp is cancelled by gain of PDmnR 
Ss=tf(Ks,[1 0],'InputDelay',Tdp);   % transfer function of IPDT model  
%**************************************************************************
%**************************************************************************
m=1;n=3;Te=0.1;Tf=Te/n;             % PD1n specification
%**************************************************************************
Td=Tdp+Te;
PD1nR_NcPn;                         % parameters of PD1nR controller
C=tf(Nc,Pn);                        % transfer function of PD13 controller
FoPD1n=C*Ss-tf(1,[Ti 1]);           % Ls(s) for PD1nR + IPDT
[Re_PD1n,Im_PD1n,w_PD1n]=nyquist(FoPD1n,{.0001,10^1});  
[i,ii,iii]=size(Re_PD1n);
x=[];j=1:iii-ceil(iii/5);x(j)=Re_PD1n(1,1,j);
y=[];j=1:iii-ceil(iii/5);y(j)=Im_PD1n(1,1,j);
plot(x,y,'k','linewidth',2);hold on; % Nyquist curve of PD1nR + IPDT
axis([-1.3 .35 -.35 1.25])
%**************************************************************************
%return
%**************************************************************************
m=3;n=5;Te=.4;Tf=Te/n;                % PD3n specification
%**************************************************************************
Td=Tdp+Te;
PD3nR_NcPn;                          %parameters of PD3nR controller
C=tf(Nc,Pn);                         %transfer function of PD33 controller
FoPD3n=C*Ss-tf(1,[Ti 1]);            % Ls(s)
[Re_PD3n,Im_PD3n,w_PD3n]=nyquist(FoPD3n,{.0001,10^2});  
[i,ii,iii]=size(Re_PD3n);
x=[];j=1:iii-ceil(iii/1.3);x(j)=Re_PD3n(1,1,j);
y=[];j=1:iii-ceil(iii/1.3);y(j)=Im_PD3n(1,1,j);
plot(x,y,'b','linewidth',2);hold on  % Nyquist curve of PD3nR + IPDT
%**************************************************************************
%return
%**************************************************************************
m=5;n=7;Te=.9;Tf=Te/n;             % PD57 specification
%**************************************************************************
Td=Tdp+Te;
PD5nR_NcPn;                            %parameters of PD5nR controller
C=tf(Nc,Pn);                         %transfer function of PD5nR controller
FoPD5n=C*Ss-tf(1,[Ti 1]);            % Ls(s)
[Re_PD5n,Im_PD5n,w_PD5n]=nyquist(FoPD5n,{.0001,10^2});  
[i,ii,iii]=size(Re_PD5n);
x=[];j=1:iii-ceil(iii/1.5);x(j)=Re_PD5n(1,1,j);
y=[];j=1:iii-ceil(iii/1.5);y(j)=Im_PD5n(1,1,j);
plot(x,y,'g','linewidth',2);hold on  % Nyquist curve of PD5nR + IPDT
%**************************************************************************
%return
%**************************************************************************
m=7;n=9;Te=1.4;Tf=Te/n;             % PD7n specification
%**************************************************************************
Td=Tdp+Te;
PD7nR_NcPn;                            %parameters of PD7nR controller
C=tf(Nc,Pn);                         %transfer function of PD7nR controller
FoPD7n=C*Ss-tf(1,[Ti 1]);            % Ls(s)
[Re_PD7n,Im_PD7n,w_PD7n]=nyquist(FoPD7n,{.0001,10^2});  
[i,ii,iii]=size(Re_PD7n);
x=[];j=1:iii-ceil(iii/1.5);x(j)=Re_PD7n(1,1,j);
y=[];j=1:iii-ceil(iii/1.5);y(j)=Im_PD7n(1,1,j);
plot(x,y,'r','linewidth',2);hold on  % Nyquist curve of PD7nR + IPDT
%**************************************************************************
plot([-1 -1],[1.2 -.3],'k','linewidth',3)%critical circle/line CC
legend('m=1','m=3','m=5','m=7','CC','location','best')
xlabel('Re L_s(j\omega)');
ylabel('Im L_s(j\omega)');
axis([-1.2 .35 -.35 1.25])
grid
return
%**************************************************************************
saveas(gcf,'PDmnR_Nyquist_IPDT.fig')  
saveas(gcf,'PDmnR_Nyquist_IPDT.jpg') 
saveas(gcf,'PDmnR_Nyquist_IPDT.eps') 
%**************************************************************************
