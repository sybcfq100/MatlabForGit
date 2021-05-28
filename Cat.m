clear all
clc
x = linspace(1,10000,10000);
for i = 1:length(x)
    T(i) = mean(cat_in_holl(x(i)));
end
plot(x,T)