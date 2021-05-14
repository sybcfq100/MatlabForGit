clear all
clc
%%%% unit %%%%%%
mm = 1e-3;  GHz = 1e9;
%%%% constant
y0 = 1/377; c = 3e8; mu0 = 4*pi*1e-7;
%%%% variable
epsr = 2; % epsilon of delectric

ra = 345;% 340; % resistance of layer 1
rb = 315; %300; % resistance of layer 2
wa = 0.4*mm; % width of the stirpline
wb = 1*mm;
la_act = 12*mm; % length of the stripline in layer 1 ????????????????????????12mm??????????
lb1_act = 12*mm;

ra = 1;% 340; % resistance of layer 1
rb = 1; %300; % resistance of layer 2
wa = 0.4*mm; % width of the stirpline
wb = 1*mm;
la_act = 10*mm; % length of the stripline in layer 1 ????????????????????????12mm??????????
lb1_act = 10*mm;

t = 1*mm; % thickness of dielectric
D = 1*mm; % Diameter
Lbig = 20*mm; % total length of the 3D absorber
Lsmall = 13.5*mm; % length of the vertical line bigger than L1 and L2
L1 = 8.5*mm; % distance from layer2 to layer1
L2 = Lbig - L1; % distance from layer2 to conductor plane
 
%%%%% Strain variable
La = mu0*la_act*log10(1/sin(pi*wa/(2*la_act)))/(2*pi); % inductance value of the stripline in layer 1
Lb1 = mu0*lb1_act*log10(1/sin(pi*wb/(2*lb1_act)))/(2*pi); % inductance value of the stripline in layer 1
Dr = D/2; % radius of via
Lv1 = t*log((t+sqrt(Dr^2+t^2))/Dr);
Lv2 = 1.5*(Dr-sqrt(Dr^2 + t^2));
Lv = mu0*(Lv1+Lv2)/(2*pi);
Lb = Lb1 + 2*Lv;
zs1 = log(8*t/wa)+(wa/2/t)^2/8;
zs2 = (epsr - 1)/(2*epsr + 2) * (log(pi/2)+log(4/pi)/epsr);
zs = 120*(zs1-zs2)/sqrt(epsr);
f = linspace(1,18,2001);
for i = 1:length(f)
    fq(i) = f(i)*GHz;
    omega(i) = 2*pi*fq(i);
    lambda(i) = c/fq(i);
    k(i) = 2*pi/lambda(i);    
    theta_s(i) = k(i)*Lsmall*sqrt(epsr);
   %%%%
    y1r(i) = ra/(ra^2+(omega(i)*La - zs*cot(theta_s(i)))^2);
    y1i(i) = (omega(i)*La - zs*cot(theta_s(i)))/(ra^2+(omega(i)*La - zs*cot(theta_s(i)))^2);
    y1(i) = y1r(i) - j*y1i(i);
    
    y2(i) = rb/(rb^2+omega(i)^2*Lb^2) - j*omega(i)*Lb/(rb^2+omega(i)^2*Lb^2);
    theta1(i) = k(i)*L1;
    theta2(i) = k(i)*L2;
    
    yinup(i) = y2(i)*cot(theta1(i)) + j*y0*(1-cot(theta1(i))*cot(theta2(i)));
    yindown(i) = y0*(cot(theta1(i)) + cot(theta2(i))) + j*y2(i);
    yin(i) = y1(i) + y0 * yinup(i)/yindown(i);
    r1(i) = abs((y0 - y1(i))/(y0 + y1(i)));
    r(i) = abs((y0 - yin(i))/(y0 + yin(i)));
end
figure (1)
plot(f, real(y1),'r', f,imag(y1),'b--')
grid on
xlim([1, 18])
ylim([-0.004, 0.004])
figure(2)
hold on
plot(f, 20*log10(r))
grid on
xlim([1, 14])

figure(3)
plot(f, 20*log10(r1))
grid on
xlim([1, 14])

