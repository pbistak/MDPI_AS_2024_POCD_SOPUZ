% 2DOF PD7nR, n (-[1,9] for SOPDTUZ process
% 240318 
% Practice-oriented controller design for an inverse-response process: 
% Heuristic optimization versus model-based approach
schema='s_2DOF_SOPDTUZ';                % simulation scheme
N1=K*[-T0 1];D1=[T^2 2*T 1];            % SOPDTUZ process parameters
%Pn - Qn and/or PD7nR denominator with the time constant Tf
P1=[Tf 1];P2=conv(P1,P1);P3=conv(P2,P1);P4=conv(P2,P2);
P5=conv(P2,P3);P6=conv(P3,P3);P7=conv(P3,P4);P8=conv(P4,P4);P9=conv(P4,P5);
if (n==1) Pn=P1;end
if (n==2) Pn=P2;end
if (n==3) Pn=P3;end
if (n==4) Pn=P4;end
if (n==5) Pn=P5;end
if (n==6) Pn=P6;end
if (n==7) Pn=P7;end
if (n==8) Pn=P8;end
if (n==9) Pn=P9;end
kappa=0.1208;                                   %normed gain
taui=0.09748;                                   %normed FR time constant
tauD1=1.9025;tauD2=0.8808;tauD3=0.2026;         %normed derivative const.
tauD4=0.02726;tauD5=0.002210;tauD6=1.0127e-4;   %normed derivative const
tauD7=2.0359e-6;                                %normed derivative const
t0=1/(9-sqrt(9));                           %normed dominant time constant
Kc=kappa/Ks/Td;                             %controller gain
Ti=taui*Td;                                 %FR time constant
TD1=tauD1*Td;Kd1=Kc*TD1;                    %derivative constant/gain
TD2=tauD2*Td^2;Kd2=Kc*TD2;                  %derivative constant/gain
TD3=tauD3*Td^3;Kd3=Kc*TD3;                  %derivative constant/gain
TD4=tauD4*Td^4;Kd4=Kc*TD4;                  %derivative constant/gain
TD5=tauD5*Td^5;Kd5=Kc*TD5;                  %derivative constant/gain
TD6=tauD6*Td^6;Kd6=Kc*TD6;                  %derivative constant/gain
TD7=tauD7*Td^7;Kd7=Kc*TD7;                  %derivative constant/gain
Nc=[Kd7 Kd6 Kd5 Kd4 Kd3 Kd2 Kd1 Kc];        %PD7n numerator
%Np                                         %Fp numerator
if (p==0) Np=1; end
if (p==1) Np=[t0*Td 1]; end
if (p==2) Np=[t0^2*Td^2 2*t0*Td 1]; end
if (p==3) Np=[t0^3*Td^3 3*t0^2*Td^2 3*t0*Td 1]; end
Dp=conv([Ti 1],[TD7 TD6 TD5 TD4 TD3 TD2 TD1 1]);%Fp denominator   
sim(schema);                     % FPIDn simulation


