% PD1nR controller for IPDT model + Qn ===> Nc/Pn + Ti
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
kpo=0.0598;taui=0.2846;tauD1=3.4475;
Kc=kpo/Ks/Td;
Ti=taui*Td;
TD1=tauD1*Td;Kd1=Kc*TD1;
Nc=[Kd1 Kc];


