T=2;a=1;b=0.5;K=2;T0=1;
N1=K*[-T0 1];D1=[T^2 2*T 1];
%Ms=2
c0=[	3.808	0.8608	0.2728	0.316	0.4172];
c1=[	0.4111	0.988	0.4044	0.1914	-0.08662];
c2=[	-6.217	1.599	0.4831	1.082	0.2333];
c3=[	-0.3489	0.03134	0.09845	-0.01138	-0.05651];
c4=[	4.25	-0.9303	-0.3138	-0.4785	-0.07367];
c5=[	0.09239	-0.06749	-0.0327	-0.03542	0.01223];
c6=[	-0.9784	0.2252	0.06335	0.1128	0.01114];

kp=c0(1)+c1(1)*a+c2(1)*b+c3(1)*a*b+c4(1)*b^2+c5(1)*a*b^2+c6(1)*b^3;
ti=c0(2)+c1(2)*a+c2(2)*b+c3(2)*a*b+c4(2)*b^2+c5(2)*a*b^2+c6(2)*b^3;
td=c0(3)+c1(3)*a+c2(3)*b+c3(3)*a*b+c4(3)*b^2+c5(3)*a*b^2+c6(3)*b^3;
tf=c0(4)+c1(4)*a+c2(4)*b+c3(4)*a*b+c4(4)*b^2+c5(4)*a*b^2+c6(4)*b^3;
beta=c0(5)+c1(5)*a+c2(5)*b+c3(5)*a*b+c4(5)*b^2+c5(5)*a*b^2+c6(5)*b^3;
Kp=kp/K;Ti=ti*T;TD=td*T;Tf=tf*T;
sch='s_FPID_SOPDTUZ';
sim(sch)

% 
% %performance & shape analysis
%    [usizem,uin]=size(u);[ysizem, yin] = size(y);
%     if (max(t)<0.9*simT)
%         dUAV_FTV1=inf;
%         dYAV_FTV1=inf;
%         dYAV_FIAE= inf;
%     else
%         [~, ~, TV1, ~, ~, ~]=ShapePar4(u);
% 
%         if (abs(u(usizem))<10) 
%             dUAV_FTV1=TV1;
%         else
%             dUAV_FTV1=inf;
%         end
%         [~, ~, TV1, ~, ~, ~]=ShapePar4(y); 
%         if (abs(u(usizem))<10) 
%             dYAV_FTV1= TV1;
%             dYAV_FIAE= Ts*sum(abs(wi-y));                
%         else
%             dYAV_FTV1=inf;dYAV_FIAE=inf;
%         end 
%     end
