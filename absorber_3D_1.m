clear all
clc
c = 3e8;
epsr = 3; y0 = 1/377;
L = 10*1e-3
L0 = 12*1e-3
zs = 167; La = 0.16e-9; ra = 310;
f = linspace(1,18,1701).*1e9;
rb = 300;
L_a = 20e-3 - L0;

for i = 1:length(f)
    omega(i) = 2*pi*f(i);
    
    thetas(i) = 2*pi*f(i)*L*sqrt(epsr)/c;
    cpx(i) = omega(i)*La - zs*cot(thetas(i));
    y1r(i) = ra/(ra^2 + cpx(i)^2);
    y1i(i) = (omega(i)*La - zs*cot(thetas(i)))/(ra^2+cpx(i)^2);
    y1(i) = y1r(i) - j*y1i(i);
    thetat(i) = 2*pi*f(i)*L0*sqrt(epsr)/c;
    thetaa(i) = 2*pi*f(i)*L_a*sqrt(epsr)/c;
    yint(i) = -j*y0*cot(thetat(i));
    y2(i) = y1(i) + yint(i); 
%     r(i) = abs((y0 - y2(i))/(y0+y2(i)));
    yd(i) = rb/(rb^2+omega(i)^2*L0^2)-j*omega(i)*L0/(rb^2+omega(i)^2*L0^2);
    ycom(i) = yd(i)*cot(thetat(i))+j*y0*(1-cot(thetat(i))*cot(thetaa(i)))/(y0*(cot(thetat(i)+cot(thetaa(i))))+j*yd(i));
%     yin = y2(i)+y0;
    yin(i)=y2(i)+y0*ycom(i);
    r(i) = abs((y0 - yin(i))/(y0+yin(i)));
end
figure (1)
plot(f./1e9, y1r,'r', f./1e9, -y1i,'-s')
grid on
xlim([1, 18])
figure(2)
plot(f./1e9, 20*log10(r))
grid on
xlim([1, 14])
figure(3)
plot(f./1e9, real(y2),'r', f./1e9, imag(y2),'-s')
grid on
xlim([1, 14])
ylim([-5e-3, 5e-3])
