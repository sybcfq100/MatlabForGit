clear all
close all
clc
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\txxphi0.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Sxx=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\tyxphi0.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Syx=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\tyyphi0.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Syy=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\txyphi0.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Sxy=cell2mat(S); fclose(fid);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fm = Sxx(:,1)
Txx =Sxx(:,2); Tyx =Syx(:,2)
Tyy =Syy(:,2); Txy =Sxy(:,2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\pxxphi0.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Pxx=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\pyxphi0.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Pyx=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\pyyphi0.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Pyy=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\pxyphi0.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Pxy=cell2mat(S); fclose(fid);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pxx =Pxx(:,2); pyx =Pyx(:,2)
pyy =Pyy(:,2); pxy =Pxy(:,2)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3) %%
set(gcf,'unit','centimeters','position',[3 5 7 12])
set(gca,'Position',[.15 .15 .8 .75]);
set(gca, 'FontSize',12)
set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
set(0,'defaultTextFontName', 'Times New Roman');%文字
subplot(2,1,1)
plot(fm, Txx, 'r', fm, Tyx, 'g', 'LineWidth', 1.5)
hold on
plot(fm, Tyy, 'b', fm, Txy, 'k', 'LineWidth', 1.5)
grid on
xlim([5.8, 12.2])
xlabel("Frequency (GHz)")
ylabel("Transmittance (linear)")
legend('Txx','Tyx','Tyy','Txy','Location','southwest')
% title('phi=0 TE/TM共极化透过率')
% set(gca, 'FontSize',12)
% set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
% set(0,'defaultTextFontName', 'Times New Roman');%文字
box on
subplot(2,1,2)
% plot(fm, pxx, 'r', fm, pyx, 'g', 'LineWidth', 1.5)
% hold on
% plot(fm, pyy, 'b', fm, pxy, 'k', 'LineWidth', 1.5)
plot(fm, pxx, 'r', fm, pxy,'k', fm, pxx-pxy, 'b:', 'LineWidth', 1.5)
grid on
xlim([5.8, 12.2])
xlabel("Frequency (GHz)")
ylabel("Transmittance (linear)")
legend('Pxx','Pxy','P.diff','Location','southwest')
% title('phi=0 TE/TM共极化透过率')
% set(gca, 'FontSize',12)
% set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
% set(0,'defaultTextFontName', 'Times New Roman');%文字
box on
