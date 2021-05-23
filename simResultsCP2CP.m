clear all
close all
clc
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\cp2cp.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Scc = cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\SimR\cp2crcp.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
Scr=cell2mat(S); fclose(fid);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fm = Scc(:,1)
tcc = Scc(:,2); tcr = Scr(:,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3) %%

plot(fm, tcc, 'b', fm, tcr, 'k', 'LineWidth', 1.5)
hold on
grid on
xlim([5.8, 12.2])
xlabel("Frequency (GHz)")
ylabel("Transmittance (linear)")
legend('Tlr','Trr','Location','southwest')
% title('phi=0 TE/TM共极化透过率')
set(gca, 'FontSize',12)
set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
set(0,'defaultTextFontName', 'Times New Roman');%文字
box on
