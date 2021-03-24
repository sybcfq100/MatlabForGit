clear all
clc
%%%% unit %%%%%%
mm = 1e-3;  GHz = 1e9;
%%%% constant
y0 = 1/377; c = 3e8; mu0 = 4*pi*1e-7;
%%%% variable
epsr = 2.2; % epsilon of delectric
ra = 300; % resistance of layer 1
rb = 330; % resistance of layer 2
wa = 0.4*mm; % width of the stirpline
wb = wa;
la_act = 1.76*mm; % length of the stripline in layer 1 试出来的值，不知道怎么和12mm联系起来？
lb1_act = 1.76*mm;
t = 1.76*mm; % thickness of dielectric
D = 0.3*mm; % Diameter
Lbig = 20*mm; % total length of the 3D absorber
Lsmall = 13.5*mm; % length of the vertical line bigger than L1 and L2
L1 = 10*mm; % distance from layer2 to layer1 
L2 = Lbig - L1; % distance from layer2 to conductor plane

%%%%% Strain variable
La = mu0*la_act*log10(1/sin(pi*wa/(2*la_act)))/(2*pi); % inductance value of the stripline in layer 1
Lb1 = mu0*lb1_act*log10(1/sin(pi*wb/(2*lb1_act)))/(2*pi); % inductance value of the stripline in layer 1
Dr = D/2; % radius of via
Lv1 = t*log((t+sqrt(Dr^2+t^2))/Dr);
Lv2 = 1.5*(Dr-sqrt(Dr^2 + t^2));
Lv = mu0*(Lv1+Lv2)/(2*pi);
Lb = Lb1 + 2*Lv;
% % 
% zs1 = log(8*t/wa)+(wa/2*t)^2/8;
% zs2 = (epsr - 1)/(2*epsr + 2) * (log(pi/2)+log(4/pi)/epsr);
% zs = 120*(zs1-zs2)/sqrt(epsr)
% f = linspace(1,18,2001).*1e9;
% for i = 1:length(f)
%     omega(i) = 2*pi*f(i);
%     theta_s(i) = 2*pi*f(i)*sqrt(epsr)*LL/c; 
%     
%     y1r(i) = ra/(ra^2+(omega(i)*La - zs*cot(theta_s(i)))^2);
%     y1i(i) = (omega(i)*La - zs*cot(theta_s(i)))/(ra^2+(omega(i)*La - zs*cot(theta_s(i)))^2);
%     
%     y1(i) = y1r(i) - j*y1i(i);
%     y1(i) = y1(i);
%     y2(i) = rb/(rb^2+omega(i)^2*Lb^2) - j*omega(i)*Lb/(rb^2+omega(i)^2*Lb^2);
%     y2(i) = y2(i);
%     theta1(i) = omega(i)*Lena;
%     theta2(i) = omega(i)*Lenb;
%     yiup(i) = y2(i)*cot(theta1(i)) + j*y0*(1-cot(theta1(i))*cot(theta2(i)));
%     yidown(i) = y0*(cot(theta1(i) + cot(theta2(i)))) + j*y2(i);
%     yin(i) = y1(i) + y0 * yiup(i)/yidown(i);
%     r(i) = abs((y0 - yin(i))/(y0 + yin(i)));
% end
% figure (1)
% plot(f, real(y1),'r',f,imag(y1),'g')