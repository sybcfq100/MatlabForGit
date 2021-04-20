clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% 导入S参数数据%%%%%
fid = fopen('C:\Users\sybcfq\Desktop\SK\data\tyy.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 11);%%%去掉前后10个数据
S1=cell2mat(S);
fclose(fid);
fid = fopen('C:\Users\sybcfq\Desktop\SK\data\txy.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 11);%%%去掉前后10个数据
S2=cell2mat(S);
fclose(fid);
fid = fopen('C:\Users\sybcfq\Desktop\SK\pyy.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 11);%%%去掉前后10个数据
P1=cell2mat(S);
fclose(fid);
fid = fopen('C:\Users\sybcfq\Desktop\SK\pxy---1.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 11);%%%去掉前后10个数据
P2=cell2mat(S);
fclose(fid)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('C:\Users\sybcfq\Desktop\SK\txxm.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Sm1=cell2mat(S);
fclose(fid);
fid = fopen('C:\Users\sybcfq\Desktop\SK\txym.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Sm2=cell2mat(S);
fclose(fid);
fid = fopen('C:\Users\sybcfq\Desktop\SK\pxxm.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Pm1=cell2mat(S);
fclose(fid);
fid = fopen('C:\Users\sybcfq\Desktop\SK\pxym.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Pm2=cell2mat(S);
fclose(fid)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=S1(:,1);
txx = S1(:,2); txy = S2(:,2);
pxx = P1(:,2); pxy = P2(:,2);
fm=Sm1(:,1);
txxm = Sm2(:,2); txym = Sm1(:,2);
pxxm = Pm1(:,2); pxym = Pm2(:,2);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1) % TE
hold on
plot(f./1e9, txx, 'ro',f./1e9, txy, 'gs', 'MarkerSize', 10)
plot(fm, txxm, 'r', fm, txym, 'g', 'LineWidth', 1.5)
grid on
xlabel("Frequency (GHz)")
ylabel("Transmittance (linear)")
legend('Exp.txx', 'Exp.txy','M.txx','M.txy','Location','southwest')
title('tx 方向的共极化和交叉极化')
set(gca, 'FontSize',12)
set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
set(0,'defaultTextFontName', 'Times New Roman');%文字
% figure(2)
% hold on
% plot(f./1e9, pxx-pxy, 'r--')
% plot(fm, pxxm-pxym, 'g', 'LineWidth', 1.5)
% grid on
% xlabel("Frequency (GHz)")
% ylabel("transmittance phase")
% legend('Exp.pxx', 'Exp.pxy','M.pxx','M.pxy','Location','northwest')
% title('tx 方向的共极化和交叉极化相位')
% set(gca, 'FontSize',12)
% set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
% set(0,'defaultTextFontName', 'Times New Roman');%文字
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
