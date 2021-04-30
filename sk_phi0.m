clear all
close all
clc
%%%% co-polarization %%%%
fid = fopen('C:\Users\sybcfq\Desktop\SK\txy---1.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 11);%%%去掉前后10个数据
Ste=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\tyx---1.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 11);%%%去掉前后10个数据
Stm=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\phi0\t00.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 11);%%%去掉前后10个数据
S0=cell2mat(S); fclose(fid);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('C:\Users\sybcfq\Desktop\SK\phi0\pss---1111.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 11);%%%去掉前后10个数据
Pte=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\phi0\pyy----1.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 11);%%%去掉前后10个数据
Ptm=cell2mat(S); fclose(fid)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('C:\Users\sybcfq\Desktop\SK\phi0\Sphi0TEco.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
SMte=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\phi0\Sphi0TMco.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
SMtm=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\phi0\Pphi0TEco.txt', 'r');    
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
PMte=cell2mat(S); fclose(fid);

fid = fopen('C:\Users\sybcfq\Desktop\SK\phi0\Pphi0TMco.txt', 'r');
S = textscan(fid, '%f %f %f', 980, 'headerlines', 2);%%%去掉前后10个数据
PMtm=cell2mat(S); fclose(fid);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = Ste(:,1);
t_te = Ste(:,2); t_tm = Stm(:,2)
t0 = S0(:,2)
p_te = Pte(:,2); p_tm = Ptm(:,2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fm = SMte(:,1)
tm_tm =SMte(:,2); tm_te =SMtm(:,2)
pm_tm =PMte(:,2); pm_te =PMtm(:,2)
Wpm_tm = wrapTo360(pm_tm);
Wpm_te = wrapTo360(pm_te);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3) %%
hold on
plot(f./1e9, t_te-t0+1.03, 'ro',f./1e9, t_tm-t0+1, 'gs', 'MarkerSize', 10)
plot(fm, tm_te, 'r', fm, tm_tm, 'g', 'LineWidth', 1.5)
grid on
xlim([5.8, 12.2])
xlabel("Frequency (GHz)")
ylabel("Transmittance (linear)")
legend('Exp.t_{TE}', 'Exp.t_{TM}','Med.t_{TE}','Med.t_{TM}','Location','southwest')
% title('phi=0 TE/TM共极化透过率')
set(gca, 'FontSize',12)
set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
set(0,'defaultTextFontName', 'Times New Roman');%文字
box on
figure(4)
hold on
% plot(f./1e9, p_te, 'r--',f./1e9, p_tm, 'g--')
% plot(fm, pm_tm, 'r', fm, pm_te, 'g', 'LineWidth', 1.5)
plot(f./1e9, p_te-p_tm, 'ro')
plot(fm, Wpm_te-Wpm_tm, 'g')
grid on
xlabel("Frequency (GHz)")
ylabel("Transmittance Phase (degree)")
legend('Exp.Diff of TE','Med.Diff of TM','Location','southwest')
% title('phi=0 TE/TM共极化透过相位')
set(gca, 'FontSize',12)
set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
set(0,'defaultTextFontName', 'Times New Roman');%文字
box on
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%