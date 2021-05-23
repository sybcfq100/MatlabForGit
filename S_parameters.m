clear all
close all
clc
% Smith method 
%%%%%%%此程序中变量为厚度d及由单位决定的波矢的表达式，********号处为变量%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
le=1e-3;%长度单位
fr=1e9;%频率单位
d1=200*le;
d2=200*le;
d=24.034*le;   %%% CHANGE WITH THINCKNESS
%%%%%%%%%%%% 导入S参数数据%%%%%
fid = fopen('S11.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 200);%%%去掉前后10个数据
S11=cell2mat(S);
fclose(fid);
fid = fopen('S21.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 200);%%%去掉前后10个数据
S21=cell2mat(S);
fclose(fid);
fid = fopen('P11.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 200);%%%去掉前后10个数据
P11=cell2mat(S);
fclose(fid);
fid = fopen('P21.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 200);%%%去掉前后10个数据
P21=cell2mat(S);
fclose(fid);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=S11(:,1);
%%%%%%%%%求波矢%%%%%%%%%%%
%********注意：此处的表达式依照单位的选取，如例中f取GHz，lambda=0.3./f
% beta=1.08;
k=2*pi*f*fr/3e8;
omega=2*pi*f*fr;
% k=2*pi*f*fr/3e8;
  %********d是变量，例中为(2.5)*1e-3
R1=exp(i*k*d1);
R2=exp(i*k*d2);
s1=S11(:,2);
s2=S21(:,2);
s3=P11(:,2)*pi/180;
s4=P21(:,2)*pi/180;
% %%%%%%%%% s参数复数表达式 %%%%%%
s11=s1.*exp(-i*s3);          %s11复数
s21=s2.*exp(-i*s4);          %s21复数
s11=s11./(R1.^2);
s21=s21./(R1.*R2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%% S参数幅值分布图 %%%%%%%%%%
figure;
plot(f,abs(s11)); hold on; grid;
plot(f,abs(s21),'r');
xlabel('Frequency [GHz]');ylabel('Magnitude of S');
title('Magnitude of S v.s. f');
legend('S11','S21');
%axis([f(1) f(length(f)) 0 1.2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%% S参数位相分布图 %%%%%%%%%%
figure;
plot(f,angle(s11)); hold on;grid;
plot(f,angle(s21),'r');
xlabel('Frequency [GHz]');ylabel('Phase of S');
title('Phase of S v.s. f');
legend('S_1_1','S_2_1');
%axis([f(1) f(length(f)) -10 5]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% Beta Method %%%%%%%%%%%%%%%%
%%%%%%%%%%% n、z、miu、epsilon的求解%%%%%%%%
alpha=(1-s11.^2+s21.^2)./(2*s21);
h=0.1;
mm=0;
m1=20;
for m=1:length(alpha)
  z(m)=sqrt(((1+s11(m)).^2-s21(m).^2)./((1-s11(m)).^2-s21(m).^2));
  x(m)=s21(m)/(1-s11(m)*(z(m)-1)/(z(m)+1));
  n(m)=(log(x(m))+i*2*mm*pi)/(i*k(m)*d);
  if abs(real(z(m)))>h
      x(m)=s21(m)/(1-s11(m)*(z(m)-1)/(z(m)+1));
      n(m)=(log(x(m))+i*2*mm*pi)/(i*k(m)*d);
      %%%%%%%%%%%%%%%%
      if m>m1
      if abs(abs(real(n(m)-n(m-1)))-2*pi/(k(m)*d))<0.2*pi/(k(m)*d)
      if real(n(m)-n(m-1))>0    
          mm=mm-1;
      else
          mm=mm+1;
      end
      end
      x(m)=s21(m)/(1-s11(m)*(z(m)-1)/(z(m)+1));
      n(m)=(log(x(m))+i*2*mm*pi)/(i*k(m)*d);
      %%%%%%%%%%%%%%%%%%%%%%%%%
      if abs(abs(real(n(m)-n(m-1)))-pi/(k(m)*d))<0.2*pi/(k(m)*d)
      if real(n(m)-n(m-1))>0   
          mm=mm-0.5;
      else
          mm=mm+0.5;
      end
      end
      end
      x(m)=s21(m)/(1-s11(m)*(z(m)-1)/(z(m)+1));
      n(m)=(log(x(m))+i*2*mm*pi)/(i*k(m)*d);
      %%%%%%%%%%%%%%%%%%%%%
  else
      if abs(x(m))>1.05
          z(m)=-z(m);
      end


      x(m)=s21(m)/(1-s11(m)*(z(m)-1)/(z(m)+1));
      n(m)=(log(x(m))+i*2*mm*pi)/(i*k(m)*d);
      %%%%%%%%%%%%%%%%%%%
      if m>m1
      if abs(abs(real(n(m)-n(m-1)))-2*pi/(k(m)*d))<0.2*pi/(k(m)*d)
      if real(n(m)-n(m-1))>0   
          mm=mm-1;
      else
          mm=mm+1;
      end
      end
      x(m)=s21(m)/(1-s11(m)*(z(m)-1)/(z(m)+1));
      n(m)=(log(x(m))+i*2*mm*pi)/(i*k(m)*d);
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
      if abs(abs(real(n(m)-n(m-1)))-pi/(k(m)*d))<0.2*pi/(k(m)*d)
      if real(n(m)-n(m-1))>0   
          mm=mm-0.5;
      else
          mm=mm+0.5;
      end
      end
      end
      x(m)=s21(m)/(1-s11(m)*(z(m)-1)/(z(m)+1));
      n(m)=(log(x(m))+i*2*mm*pi)/(i*k(m)*d);
      %%%%%%%%%%%%%%%%%%%%%
  end
% 
% if m>2 & real(z(m))<0.01
%     if abs(imag(z(m))+imag(z(m-1)))<0.01
%     z(m)=conj(z(m));
%     end
% end

  epsilon(m)=n(m)/z(m);
  mu(m)=n(m)*z(m);
  mm1(m)=mm;
end
n_r = [f,real(n)'];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% n的实、虚部分布%%%%%%%%%%%%%%
figure
plot(f,real(n)); hold on;
plot(f,imag(n),'r');
xlabel('Frequency [GHz]');ylabel('n');
title('Propagation Index v.s. f');
legend('Re(n)','Im(n)');
grid on
save('n_r.txt','n_r','-ascii')
%axis([2 f(length(f)) -6 10]);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%% z的实、虚部分布%%%%%%%%%%%%%
% figure
% plot(f,real(z)); hold on;
% plot(f,imag(z),'r');
% grid on
% xlabel('Frequency [GHz]');ylabel('Impedance');
% title('Impedance v.s. f');
% legend('Re(z)','Im(z)');
% %axis([2 f(length(f)) -2 2]);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%% z的实、虚部分布%%%%%%%%%%%%%
% figure
% plot(f,angle(z).*180/pi);
% xlabel('Frequency [GHz]');ylabel('Impedance');
% title('Impedance v.s. f');
% legend('Re(z)','Im(z)');
% %axis([2 f(length(f)) -2 2]);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%% epsilon的实、虚部分布%%%%%%%%
% figure;
% plot(f,real(epsilon)); hold on;
% plot(f,imag(epsilon),'r');
% xlabel('Frequency [GHz]');ylabel('\epsilon');
% title('\epsilon v.s. f');
% legend('Re(\epsilon)','Im(\epsilon)');
% %axis([2 f(length(f)) -20 3]);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%% mu的实、虚部分布%%%%%%%%%%%%%%
% figure;
% plot(f,real(mu));hold on;
% plot(f,imag(mu),'r');
% xlabel('Frequency [GHz]');ylabel('\mu');
% title('\mu v.s. f');
% legend('Re(\mu)','Im(\mu)');
% % %axis([2 f(length(f)) -10 15]);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure;plot (f,imag(alpha),'r'); hold on ;plot (f,real(alpha)); grid;
% plot (f,acos(alpha),'k'); 
% epp1=real(epsilon)';
% epp2=imag(epsilon)';