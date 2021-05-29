clear all
clc
% m = 227.65*1e-3;   %物块质量
% E = 2*1e11;   %弹簧弹性系数
% G = 8*1e10;  %弹簧扭转系数
% D = 24*1e-2;   %弹簧大径
% d = 1*1e-3;  %弹簧直径
% n = 256;  % 弹簧匝数
% I = 0.006;  %重物的转动惯量
% c = 1;
% eff_down = (G*d^4*I/(8*n*D^3)+m*pi*d^3*n*E/64);
% item1 = (G*d^4*I/(8*n*D^3)+m*pi*d^3*n*E/64)+sqrt((G*d^4*I/(8*n*D^3)+m*pi*d^3*n*E/64)^2-4*m*I*(pi*G*d^7*n*E/(512*n*D^3)-c^2));
% item2 = 4*m*I*(pi*G*d^7*n*E/(512*n*D^3)-c^2);
% eff = 2*pi*sqrt(2*m*I)/eff_down;
% fir = sqrt((-eff_down+sqrt(item1))/(2*I*m));
% sec = sqrt((eff_down+sqrt(item1))/(2*I*m));
% T = abs(eff*(fir + sec))


%% change m
m = linspace(10,900,9901).*1e-3; %227.65*1e-3;   %物块质量
E = 2*1e11;   %弹簧弹性系数
G = 8*1e10;  %弹簧扭转系数
D = 24*1e-2;   %弹簧大径
d = 1*1e-3;  %弹簧直径
n = 256;  % 弹簧匝数
I = 0.006;  %重物的转动惯量
c = 0.003;
for i = 1:length(m)
    eff_down(i) = G*d^4*I/(8*n*D^3)+m(i)*pi*d^3*n*E/64;
    eff(i) = 2*pi*sqrt(2*m(i)*I)/eff_down(i);
    item(i) = 4*m(i)*I*(pi*G*d^7*n*E/(512*n*D^3)-c^2);
    fir(i) = sqrt((-eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m(i)));
    sec(i) = sqrt((eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m(i)));
    T(i) = abs(eff(i)*(fir(i) + sec(i)));
end

plot(m./1e-3, T,'o')
grid on
legend('m vs T')
xlabel("m (g)")
ylabel("T (s)")

% %% 
% m = 277.65*1e-3;   %物块质量
% % E = 2*1e11;   %弹簧弹性系数
% G = 8*1e10;  %弹簧扭转系数
% D = 24*1e-2;   %弹簧大径
% d = 1*1e-3;  %弹簧直径
% n = 256;  % 弹簧匝数
% I = 0.006;  %重物的转动惯量
% c = 0.003;
% E = linspace(0.5, 10, 1501).*1e11;
% for i = 1:length(E)
%     eff_down(i) = G*d^4*I/(8*n*D^3)+m*pi*d^3*n*E(i)/64;
%     eff(i) = 2*pi*sqrt(2*m*I)/eff_down(i);
%     item(i) = 4*m*I*(pi*G*d^7*n*E(i)/(512*n*D^3)-c^2);
%     fir(i) = sqrt((-eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     sec(i) = sqrt((eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     T(i) = abs(eff(i)*(fir(i) + sec(i)));
% end
% 
% plot(E, T,'o')
% grid on
% legend('E vs T')
% xlabel("E (N/m^2)")
% ylabel("T (s)")
%%
% m = 277.65*1e-3;   %物块质量
% E = 2*1e11;   %弹簧弹性系数
% % G = 8*1e10;  %弹簧扭转系数
% D = 24*1e-2;   %弹簧大径
% d = 1*1e-3;  %弹簧直径
% n = 256;  % 弹簧匝数
% I = 0.006;  %重物的转动惯量
% c = 0.003;
% G = linspace(0.5, 10, 1501).*1e10;
% for i = 1:length(G)
%     eff_down(i) = G(i)*d^4*I/(8*n*D^3)+m*pi*d^3*n*E/64;
%     eff(i) = 2*pi*sqrt(2*m*I)/eff_down(i);
%     item(i) = 4*m*I*(pi*G(i)*d^7*n*E/(512*n*D^3)-c^2);
%     fir(i) = sqrt((-eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     sec(i) = sqrt((eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     T(i) = abs(eff(i)*(fir(i) + sec(i)));
% end
% 
% plot(G, T,'o')
% grid on
% legend('G vs T')
% xlabel("G (Pa)")
% ylabel("T (s)")
%%
% m = 277.65*1e-3;   %物块质量
% E = 2*1e11;   %弹簧弹性系数
% G = 8*1e10;  %弹簧扭转系数
% % D = 24*1e-2;   %弹簧大径
% d = 1*1e-3;  %弹簧直径
% n = 256;  % 弹簧匝数
% I = 0.006;  %重物的转动惯量
% c = 0.003;
% D = linspace(10, 250, 2451).*1e-2;
% for i = 1:length(D)
%     eff_down(i) = G*d^4*I/(8*n*D(i)^3)+m*pi*d^3*n*E/64;
%     eff(i) = 2*pi*sqrt(2*m*I)/eff_down(i);
%     item(i) = 4*m*I*(pi*G*d^7*n*E/(512*n*D(i)^3)-c^2);
%     fir(i) = sqrt((-eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     sec(i) = sqrt((eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     T(i) = abs(eff(i)*(fir(i) + sec(i)));
% end
% 
% plot(D./1e-2, T,'o')
% grid on
% legend('D vs T')
% xlabel("D (cm)")
% ylabel("T (s)")
%%
% m = 277.65*1e-3;   %物块质量
% E = 2*1e11;   %弹簧弹性系数
% G = 8*1e10;  %弹簧扭转系数
% D = 24*1e-2;   %弹簧大径
% d = 1*1e-3;  %弹簧直径
% n = 256;  % 弹簧匝数
% I = 0.006;  %重物的转动惯量
% c = 0.003;
% d = linspace(0.1, 10, 1000).*1e-3;
% for i = 1:length(d)
%     eff_down(i) = G*d(i)^4*I/(8*n*D^3)+m*pi*d(i)^3*n*E/64;
%     eff(i) = 2*pi*sqrt(2*m*I)/eff_down(i);
%     item(i) = 4*m*I*(pi*G*d(i)^7*n*E/(512*n*D^3)-c^2);
%     fir(i) = sqrt((-eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     sec(i) = sqrt((eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     T(i) = abs(eff(i)*(fir(i) + sec(i)));
% end
% 
% plot(d./1e-3, T,'o')
% grid on
% legend('d vs T')
% xlabel("d (mm)")
% ylabel("T (s)")
% %%
% m = 277.65*1e-3;   %物块质量
% E = 2*1e11;   %弹簧弹性系数
% G = 8*1e10;  %弹簧扭转系数
% D = 24*1e-2;   %弹簧大径
% d = 1*1e-3;  %弹簧直径
% % n = 256;  % 弹簧匝数
% I = 0.006;  %重物的转动惯量
% c = 0.003;
% n = linspace(50, 2500, 2451);
% for i = 1:length(n)
%     eff_down(i) = G*d^4*I/(8*n(i)*D^3)+m*pi*d^3*n(i)*E/64;
%     eff(i) = 2*pi*sqrt(2*m*I)/eff_down(i);
%     item(i) = 4*m*I*(pi*G*d^7*n(i)*E/(512*n(i)*D^3)-c^2);
%     fir(i) = sqrt((-eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     sec(i) = sqrt((eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I*m));
%     T(i) = abs(eff(i)*(fir(i) + sec(i)));
% end
% 
% plot(n, T, 'o')
% grid on
% legend('n vs T')
% xlabel("n (匝数)")
% ylabel("T (s)")
%%
% m = 277.65*1e-3;   %物块质量
% E = 2*1e11;   %弹簧弹性系数
% G = 8*1e10;  %弹簧扭转系数
% D = 24*1e-2;   %弹簧大径
% d = 1*1e-3;  %弹簧直径
% n = 256;  % 弹簧匝数
% % I = 0.006;  %重物的转动惯量
% c = 0.003;
% I = linspace(0.1, 10, 1001).*1e-3;
% for i = 1:length(I)
%     eff_down(i) = G*d^4*I(i)/(8*n*D^3)+m*pi*d^3*n*E/64;
%     eff(i) = 2*pi*sqrt(2*m*I(i))/eff_down(i);
%     item(i) = 4*m*I(i)*(pi*G*d^7*n*E/(512*n*D^3)-c^2);
%     fir(i) = sqrt((-eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I(i)*m));
%     sec(i) = sqrt((eff_down(i)+sqrt(eff_down(i)^2-item(i)))/(2*I(i)*m));
%     T(i) = abs(eff(i)*(fir(i) + sec(i)));
% end
% 
% plot(I, T, 'o')
% grid on
% legend('I vs T')
% xlabel("I (Kg*m^2)")
% ylabel("T (s)")
