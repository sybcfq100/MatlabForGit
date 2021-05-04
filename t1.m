clear;%线极化波入射参数提取

s11=load('C:\Users\sybcfq\Desktop\SK\yuan\s11.txt');
s12=load('C:\Users\sybcfq\Desktop\SK\yuan\s12.txt');
s21=load('C:\Users\sybcfq\Desktop\SK\yuan\s21.txt');
s22=load('C:\Users\sybcfq\Desktop\SK\yuan\s22.txt');
s00=load('C:\Users\sybcfq\Desktop\SK\yuan\t00.txt');
fre(:,1)=s11(: ,1)*1e9;
C=3e8;  
d0=0e-3;
d=3e-3;                    %晶格常数
lamda(:,1)=C./fre(:,1);
k(:,1)=2*pi./lamda(:,1);
n=zeros(size(fre));

S11(:,1)=s11(:,2).*exp(-i*(s11(:,3)*pi/180)-i*k(:,1)*d0);  %
S21(:,1)=s21(:,2).*exp(-i*(s21(:,3)*pi/180)-i*k(:,1)*d0);
S12(:,1)=s12(:,2).*exp(-i*(s12(:,3)*pi/180)-i*k(:,1)*d0);
S22(:,1)=s22(:,2).*exp(-i*(s22(:,3)*pi/180)-i*k(:,1)*d0);


T11(:,1)=((S11(:,1)+S22(:,1))-i*(S12(:,1)-S21(:,1)))/2;
T22(:,1)=((S11(:,1)+S22(:,1))+i*(S12(:,1)-S21(:,1)))/2;%T11,左旋，T22右旋
T12(:,1)=((S11(:,1)-S22(:,1))-i*(S12(:,1)+S21(:,1)))/2;
T21(:,1)=((S11(:,1)-S22(:,1))+i*(S12(:,1)+S21(:,1)))/2;

azimuth(:,1)=(angle(T22(:,1))-angle(T11(:,1)))/2/pi*180;

T(:,1)=(abs(T11(:,1))).^2+(abs(T22(:,1))).^2;
T_(:,1)=(abs(T22(:,1))).^2-(abs(T11(:,1))).^2;
ellipticity(:,1)=atan(T_(:,1)./T(:,1))/2/pi*180;

a12(:,1)=azimuth(:,1)*pi/180./k(:,1)/d;
a13(:,1)=abs(T11(:,1))-abs(T22(:,1));
a14(:,1)=a13(:,1)/2./k(:,1)/d;

for p=1:201
  if(-pi<(angle(T11(p,1))-angle(T22(p,1)))<pi)
    m(p,1)=0;
  end  
  if((angle(T11(p,1))-angle(T22(p,1)))<-pi)
      m(p,1)=1;
  end    
  if((angle(T11(p,1))-angle(T22(p,1)))>pi)
     m(p,1)=-1;
  end
  if((angle(T11(p,1))-angle(T22(p,1)))<-3*pi)
      m(p,1)=2;
  end    
  if((angle(T11(p,1))-angle(T22(p,1)))>3*pi)
     m(p,1)=-2;
  end
 end
% chirality(:,1)=a12(:,1)+i*a14(:,1);
chirality(:,1)=a12(:,1)+i*a14(:,1)+m(:,1)*pi./k(:,1)/d;


M(:,1)=abs(T11);  %T11,左旋，T22右旋
M(:,2)=abs(T22);
M(:,3)=azimuth(:,1);  %旋转角
M(:,4)=ellipticity(:,1);  %椭圆率
M(:,5)=abs(T12);  
M(:,6)=abs(T21);   %T21,左旋，T12右旋

D=[s11(:,1),M(:,1),M(:,2),M(:,5),M(:,6)];
hold on
plot(s11(:,1), M(:,2))