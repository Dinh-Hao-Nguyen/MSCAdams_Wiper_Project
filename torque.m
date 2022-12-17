%% Four-bar mechanism

% Reference: Tang, C.P., 2010. Lagrangian dynamic formulation of a four-bar mechanism with minimal coordinates.

clear; close all; clc;

%% Parameters

% Bars
l1 = 0.1;  % length of the crank [m]
l2 = 0.26; % length of the coupler [m]
l3 = 0.18; % length of the rocker [m]
l0 = 0.18; % length of the frame bar [m]

% Determine theta2, theta3 as a function of theta1
th1 = deg2rad(-90);
th1d=10;
th1dd=10;

%masses
md= 7801;%masse density of bars kg/m³
d=20e-3;%depth
w=10e-3;%width
md=md*d*w; %LINEAR mass density
m1=md*l1
m2=md*l2
m3=md*l3

lc1=l1/2;
lc2=l2/2;
lc3=l3/2;

%from previous codes
th2=deg2rad(180);
th2d=10;
th3=deg2rad(90);
th3d=10;

%inertia
r=0.05;
%(m1*r^2)/2;
%m*(h^2/12+(7/12)*l^2)

I1=m1*(w^2/12+(7/12)*l1^2);
I2=m2*(w^2/12+(7/12)*l2^2);
I3=m3*(w^2/12+(7/12)*l3^2);

g=9.81;

c=@(th) cos(th);
s=@(th) sin(th);

%% Computation of the motor torque

S1=(l1*s(th3-th1))/(l2*s(th2-th3));
S2=(l1*s(th2-th1))/(l3*s(th2-th3));

S1d1 =-(l1*cos(th1 - th3))/(l2*sin(th2 - th3))
S1d2 =(l1*cos(th2 - th3)*sin(th1 - th3))/(l2*sin(th2 - th3)^2)
S1d3 =(l1*cos(th1 - th3))/(l2*sin(th2 - th3)) - (l1*cos(th2 - th3)*sin(th1 - th3))/(l2*sin(th2 - th3)^2)
S2d1 =-(l1*cos(th1 - th2))/(l3*sin(th2 - th3))
S2d2 =(l1*cos(th1 - th2))/(l3*sin(th2 - th3)) + (l1*cos(th2 - th3)*sin(th1 - th2))/(l3*sin(th2 - th3)^2)
S2d3 =-(l1*cos(th2 - th3)*sin(th1 - th2))/(l3*sin(th2 - th3)^2)

J1=(m1*lc1^2+I1+m2*l1^2)/2;
J2=(m2*lc2^2+I2)/2;
J3=(m3*lc3^2+I3)/2;

P1=m2*l1*lc2;
C1=c(th1-th2);
G=(-m1*g*lc1-m2*g*l1)*s(th1)-m2*g*lc2*s(th2)-m3*g*lc3*s(th3);

Gd1 =-cos(th1)*(g*l1*m2 + g*lc1*m1)
Gd2 =-g*lc2*m2*cos(th2)
Gd3 =-g*lc3*m3*cos(th3)
C1d1 =-sin(th1 - th2)
C1d2 =sin(th1 - th2)
C1d3 =0

M=2*(J1+J2*S1^2+J3*S2^2+P1*C1*S1)
C=2*J2*S1*(S1d1+S1*S1d2+S2*S1d3)+2*J3*S2*(S2d1+S1*S2d2+S2*S2d3)+P1*(C1*(S1d1+S1*S1d2+S2*S1d3)+S1*(C1d1+S1*C1d2))
K=-Gd1-S1*Gd2-S2*Gd3

Tau=M*th1dd+C*th1d+K



