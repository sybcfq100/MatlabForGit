function JITAcceleratorTest
u = rand(1e6, 1);
v = zeros(1e6, 1);
tic 
u1 = u + 1;
time=toc;
disp(['用向量化方法的时间是：', num2str(time),'秒！'])
tic 
for ii = 1:1000000
    v(ii)=u(ii)+1;
end
time=toc;
disp(['循环的时间是：', num2str(time),'秒！'])

feature jit off;
tic 
for ii = 1:1000000
    v(ii)=u(ii)+1;
end
time=toc;
disp(['只关闭jit的时间是：', num2str(time), '秒！']);

feature accel off;
tic 
for ii = 1:1000000
    v(ii)=u(ii)+1;
end
time=toc;
disp(['关闭jit和accel的时间是：', num2str(time), '秒！']);

feature accel on;
feature jit on;
end
