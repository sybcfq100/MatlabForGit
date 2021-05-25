function RandDisplayJiong
axis off;
set(gcf, 'menubar', 'none', 'toolbar', 'none'); % 不显示当前figure菜单栏和工具栏
for k = 1:100;
    %每次在（rand，rand）这个随机位置，选择20~50之间随机分布的一个数字作为字体大小，以隶书
    %形式，随机生成RGB颜色，并随机旋转一定的角度来显示’囧‘字
    h = text(rand, rand, ['\fontsize{',num2str(unifrnd(20, 50)),'}\fontname {隶书} 囧'], 'color', rand(1,3), 'Rotation', 360*rand);
%     h = text(rand, rand, ['\fontsize{45}\fontname {隶书} 囧'], 'color', rand(1,3), 'Rotation', 360*rand);
    pause(0.2);
end
% rand  返回一个在区间 (0,1) 内均匀分布的随机数
% rand(sz1, szN) 返回由随机数组成的 sz1×...×szN 数组，其中 sz1,...,szN 指示每个维度的大小。例如：rand(1, 3) 返回一个 1×3 的矩阵。
% rand(1,3) 产生1行2列的 3个在0~1之间的数
%R = unifrnd(A,B) returns an array R of random numbers generated from the continuous
%    uniform distributions with lower and upper endpoints specified by A and B, respectively.
%['\fontsize{45}\fontname{隶书} 囧']