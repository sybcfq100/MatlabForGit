% clear all
% close all
% clc
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fid = fopen('C:\Users\sybcfq\Desktop\SK\parameter\Var_nFix_uw0.05.txt', 'r');    
% fidd= fopen('C:\Users\sybcfq\Documents\MATLAB\new.txt','w');
% while ~feof(fid)
%     tline = fgets(fid);
%     a=isletter(tline);
%     b=sum(a);
%     c=isspace(tline);
%     d=sum(c);
%     if (b<3) &~(d==2)
%         fprintf(fidd,tline);
%     else
%     end
% end
% fclose all;
% %%%%%%%%%%%%reread and matrix output
% fid= fopen('C:\Users\sybcfq\Documents\MATLAB\new.txt');
% S = textscan(fid, '%f %f %f');
% Data=cell2mat(S);
% n=size(Data);
% n=n(1)/1001;
% f=Data(1:1001,1);
% lambda=300./f;
% data=[];
% pc=Data(:,2);
% for i=1:n
%     ab=pc(1+(i-1)*1001:1001*i,1);
%     data=[data,ab];
% end
% 
% figure (1)
% plot(f, data', 'LineWidth', 2)
% grid on 
% xlabel('Frequency (GHz)')
% ylabel('Coefficiency of Polarization Conversion')
% legend('n = 11','n = 23', 'n = 31', 'n = 9', 'n = 47' )
% title('Variable n and Constant wd')
% set(gca, 'FontSize',12)
% set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
% set(0,'defaultTextFontName', 'Times New Roman');%文字
% box on

clear all
close all
clc
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('C:\Users\sybcfq\Desktop\SK\parameter\Var_R.txt', 'r');    
fidd= fopen('C:\Users\sybcfq\Documents\MATLAB\new.txt','w');
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
fid= fopen('C:\Users\sybcfq\Documents\MATLAB\new.txt');
S = textscan(fid, '%f %f %f');
Data=cell2mat(S);
n=size(Data);
n=n(1)/1001;
f=Data(1:1001,1);
lambda=300./f;
data=[];
pc=Data(:,2);
for i=1:n
    ab=pc(1+(i-1)*1001:1001*i,1);
    data=[data,ab];
end

figure (1)
plot(f, data', 'LineWidth', 2)
grid on 
xlabel('Frequency (GHz)')
ylabel('Coefficiency of Polarization Conversion')
legend('r = 2.7','r = 2.5', 'r = 2.3', 'r = 2.1' )
title('Variable wd and Constant n')
set(gca, 'FontSize',12)
set(0,'defaultAxesFontName', 'Times New Roman');%坐标轴
set(0,'defaultTextFontName', 'Times New Roman');%文字
box on

