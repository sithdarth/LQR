clc
clear all;
close all
mw=60;
mb=300;
kt=190000;
ks=16000;
bs=1000;
bw = 1000;
A=[0 0 1 0;0 0 0 1;(-ks/mb) (ks/mb) (-bs/mb)
(bs/mb);(ks/mw) (-(ks+kt)/mw) (bs/mw) -(bw+bs)/mw]
B=[0;0;1/mb;-1/mw]
C=[1 0 0 0; 0 1 0 0; 0 0 1 0;
 0 1 0 1]
D=[0;0;0;0]
Q=1000*eye(4);
R=0.0001;
k=lqr(A,B,Q,R)
t = 0:0.01:10;
sys_withLQR = ss(A-B*k, 0.1*B, C, D);
sys_woLQR = ss(A, 0.1*B, C, D);
figure(1)
step(sys_woLQR,t)
hold on
figure(2)
step(sys_withLQR,t)
hold on
figure(3)
step(sys_woLQR,sys_withLQR,t)