% 2DOF PD1nR, n (-[1,9] for SOPDTUZ process
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
kappa=0.0598;taui=0.2846;tauD1=3.4475;  %normed parameters
t0=1/(3-sqrt(3));                       %normed dominant time constant
Kc=kappa/Ks/Td;                         %controller gain
Ti=taui*Td;                             %FR time constant
TD1=tauD1*Td;Kd1=Kc*TD1;                %derivative time constant/gain
Nc=[Kd1 Kc];                            %PD1n numerator
%Np                                     %Fp numerator
if (p==0) Np=1; end
if (p==1) Np=[t0*Td 1]; end
if (p==2) Np=[t0^2*Td^2 2*t0*Td 1]; end
if (p==3) Np=[t0^3*Td^3 3*t0^2*Td^2 3*t0*Td 1]; end
Dp=conv([Ti 1],[TD1 1]);                %Fp denominator
sim(schema);                            % loop simulation


