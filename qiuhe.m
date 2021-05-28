clear all
clc
N = 1e6 + 1; k = [1: N]; x = 1+1e-6;
tic 
p1 = sum(k.*x.^[N-1:-1:0]); % 用sum函数的方法
p1, toc
tic, p2 = polyval(k,x),toc  % 调用polyvol函数方法
tic, p3 = k(1);
for i = 2: N
    p3 = p3 * i + k(i);
end
p3,toc