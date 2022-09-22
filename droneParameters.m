%% DO HOANG VIET - 21150150
clear all;
clc;
close all;

%% Quadcopter parameter
Ix = 2.3951e-5;
Iy = 2.3951e-5;
Iz = 3.2347e-5;
I = diag([Ix, Iy, Iz]);
m = 0.023;
g = 9.81;
thrustConstant = 2.23e-8;  % b
dragConstant = 1.368e-10;  % d
armLength = 0.046;  % L (m)

%% Motor parameter
ks = 900.5899;
tau = 1/10;

%% State vector
omegaInit = [0;0;0];
attitudeInit = [0;0;0];
velInit = [0;0;0];
posInit = [0;0;0];
MotorSpeedInit = [0;0;0];

%% PID parameter
s = 0.7;
w = 2;
xKd = 2 * s * w * m;
xKp = w^2 * m / xKd;

s = 0.7;
w = 2;
yKd = 2 * s * w * m;
yKp = w^2 * m / yKd;

s = 0.6;
w = 2;
zKd = 2 * s * w * m;
zKp = w^2 * m / zKd;

s = 0.8;
w = 10;
pKd = 2 * s * w * Ix;
pKp = w^2 * Ix / pKd;

s = 0.6;
w = 10;
tKd = 2 * s * w * Iy;
tKp = w^2 * Iy / tKd;

s = 0.6;
w = 10;
sKd = 2 * s * w * Iz;
sKp = w^2 * Iz / sKd;

%% SMC parameter
k1 = 5;
K1 = 5;

k2 = 5;
K2 = 5;

k3 = 5;
K3 = 5;

k4 = 5;
K4 = 5;

k5 = 1;
K5 = 5;

k6 = 1;
K6 = 5;

