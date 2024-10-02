clc;
clear;
close all;

list = listfonts

f = figure('Position',[200 200 392 294]),;
x = 0:pi/20:2*pi;
y = sin(x);
plot(x,y);
t = text(pi,0,'\leftarrow sin(\pi)');

S = uisetfont(t);