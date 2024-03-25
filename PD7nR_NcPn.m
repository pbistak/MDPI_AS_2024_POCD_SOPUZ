% PD7nR controller for IPDT model + Qn ===> Nc/Pn + Ti
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
kpo=0.1208;
taui=0.09748;
tauD1=1.9025;tauD2=0.8808;tauD3=0.2026;
tauD4=0.02726;tauD5=0.002210;tauD6=1.0127e-4;
tauD7=2.0359e-6;
Kc=kpo/Ks/Td;
Ti=taui*Td;
TD1=tauD1*Td;Kd1=Kc*TD1;
TD2=tauD2*Td^2;Kd2=Kc*TD2;
TD3=tauD3*Td^3;Kd3=Kc*TD3;
TD4=tauD4*Td^4;Kd4=Kc*TD4;
TD5=tauD5*Td^5;Kd5=Kc*TD5;
TD6=tauD6*Td^6;Kd6=Kc*TD6;
TD7=tauD7*Td^7;Kd7=Kc*TD7;
Nc=[Kd7 Kd6 Kd5 Kd4 Kd3 Kd2 Kd1 Kc];



