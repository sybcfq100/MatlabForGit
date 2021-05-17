clear all
clc
f1 = 200;
fs = 44100;
t = 0:1/fs:5;
x = sin(2*pi*f1*t);
sound(x, fs)