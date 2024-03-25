% 2DOF PD1nR, n (-[1,9] for SOPDTUZ process
% 240318 
% Practice-oriented controller design for an inverse-response process: 
% Heuristic optimization versus model-based approach
schema='s_2DOF_SOPDTUZ';                % simulation scheme
N1=K*[-T0 1];D1=[T^2 2*T 1];            % SOPDTUZ process parameters
Tf=Te/n;                                % Qn filter time constant
%Pn                                       Qn and/or PD1n denominator
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
                                        %normed parameters
kappa=0.0915;taui=0.1747;tauD1=2.4434;tauD2=0.7166;tauD3=0.0709;
t0=1/(5-sqrt(5));                       %normed dominant time constant
Kc=kappa/Ks/Td;                           %controller gain
Ti=taui*Td;                             %FR time constant
TD1=tauD1*Td;Kd1=Kc*TD1;                %derivative time constant/gain
TD2=tauD2*Td^2;Kd2=Kc*TD2;              %2nd-order derivative parameters
TD3=tauD3*Td^3;Kd3=Kc*TD3;              %3rd-order derivative parameters
Nc=[Kd3 Kd2 Kd1 Kc];                    %PD3nR numerator
%Np                                     %Fp numerator
if (p==0) Np=1; end
if (p==1) Np=[t0*Td 1]; end
if (p==2) Np=[t0^2*Td^2 2*t0*Td 1]; end
if (p==3) Np=[t0^3*Td^3 3*t0^2*Td^2 3*t0*Td 1]; end
Dp=conv([Ti 1],[TD3  TD2 TD1 1]);       %Fp denominator
   
sim(schema);                            % loop simulation


