clear all
clc
%%%%%%%%%%%%read in and data processing
% fid = fopen('C:\Users\sybcf\Documents\MATLAB\LCP-RCP.txt');
% fid = fopen('C:\Users\sybcf\Documents\MATLAB\TE-RCP.txt');
% fid = fopen('C:\Users\sybcf\Documents\MATLAB\TM-LCP.txt');
% fid = fopen('C:\Users\sybcf\Documents\MATLAB\TM2TE.txt');
fid = fopen('C:\Users\sybcf\Documents\MATLAB\TE2TM.txt');
fidd= fopen('C:\Users\sybcf\Documents\MATLAB\new.txt','w');
while ~feof(fid)
    tline = fgets(fid);
    a=isletter(tline);
    b=sum(a);
    c=isspace(tline);
    d=sum(c);
    if (b<3) &~(d==2)
        fprintf(fidd,tline);
    else
    end
end
fclose all;
%%%%%%%%%%%%reread and matrix output
fid= fopen('C:\Users\sybcf\Documents\MATLAB\new.txt');
S = textscan(fid, '%f %f %f');
S11=cell2mat(S);
n=size(S11);
n=n(1)/1001;
f=S11(1:1001,1);
lambda=300./f;
L2R=[];
% r=1-S11(:,2).^2;
l2r=S11(:,2);
for i=1:n
    ab=l2r(1+(i-1)*1001:1001*i,1);
    L2R=[L2R,ab];
end
angle=[0:n-1]*85/(n-1);
angle1=[0:10*n-1]*85/(10*n-1);
f1=6:0.01:12;

[A,F]=meshgrid(angle,f);

[A1,F1]=meshgrid(angle1,f1);

meshedL2R=interp2(A,F,L2R,A1,F1);
L2R=[meshedL2R];
figure (1)
imagesc(angle,f,L2R)
ylabel('Frequency (GHz)');xlabel('Angular(Degree)');
% title('LCP-RCP vs incidence angle')
% title('TE-RCP vs incidence angle')
title('TE-TM vs incidence angle')
set(gca, 'Clim', [0,1])
set(0,'defaultAxesFontName', 'Times New Roman');%×ø±êÖá
set(0,'defaultTextFontName', 'Times New Roman');%ÎÄ×Ö
hold on 
[c, h]=contourf(angle1, f1, L2R);
set(h, 'ShowText', 'On', 'LevelList', [0.9])
% [c, h] = contour(angle1, f1, L2R, 0.9);
% % set(c, h, 'LabelSpacing', 0.9)
colormap jet
colorbar
axis xy
% % % figure (2)
% % % imagesc(angle,lambda,Absorption)
% % % colormap (hot)
% % % % axis([0.1 0.66 0.66 2])
% % % ylabel('Frequency (GHz)');xlabel('width(mm)');
% % % colormap jet
% % 
% % 
% % % Absorption1=[0,angle1;Absorption];
% % % save 'Absorption.txt' Absorption -ascii
% % % figure(2)
% % % mesh(A1,F1,-Absorption)
% % % ylabel('Frequency (GHz)');xlabel('AOI (deg)');
% % % lighting phong; light; drawnow;