%https://mathworld.wolfram.com/Circle-CircleIntersection.html

%% TREAT
clear; close all; clc;
load('simulation_results','time', 'dt', 'th3','th33')

L = 1.000; % [m]
c = -0.100; % [m]
h1 = 0.7; % [m]
h2 = 0.5; % [m]
gamma1 = deg2rad(45); % [rad]
gamma2 = deg2rad(25); % [rad]
w1 = abs((h1+c)/cos(gamma1));
w2 = abs((h2+c)/cos(gamma2)); % [m]
psi1 = th33 - min(th33) + gamma1;
psi2 = - th3 + max(th3) + gamma2;


% Point Q (fixed)
Qx = 0;
Qy = 0;

% Point R
Rx = Qx + w1*cos(psi1);
Ry = Qy + w1*sin(psi1);

% Point S
Sx = Rx + L*cos(psi1-gamma1);
Sy = Ry + L*sin(psi1-gamma1);

% Point QQ (fixed)
QQx = Qx + 1.850;
QQy = Qy;

% Point RR
RRx = QQx - w2*cos(psi2);
RRy = QQy + w2*sin(psi2);

% Point SS
SSx = RRx - L*cos(psi2-gamma2);
SSy = RRy + L*sin(psi2-gamma2);

%% PARAMETERS
d= 1.850;%distance between fixed points
Rmax= sqrt(Sx(1)^2+Sy(1)^2);%radius left MAX
Rmin= sqrt(Rx(1)^2+Ry(1)^2);%radius left MIN
r= sqrt((SSx(1)-QQx(1))^2+(SSy(1)-QQy(1))^2);%radius right

%% COMPUTATION

%WIPER CIRCLES INTERSECTION
xup=(d^2-r^2+Rmax^2)/(2*d)
yup=sqrt((4*d^2*Rmax^2-(d^2-r^2+Rmax^2)^2)/(4*d^2))

 
xlow=(d^2-r^2+Rmin^2)/(2*d)
ylow=sqrt((4*d^2*Rmin^2-(d^2-r^2+Rmin^2)^2)/(4*d^2))


%WIPER RIGHT MIDDLE
ym=(yup+ylow)/2
xm=(xup+xlow)/2

xm=d-xm;
xtop=sqrt(r^2/(1+(ym^2/xm^2)));
disp("wiper right middle point:")
ytop=xtop*ym/xm
xtop=d-xtop


%WIPER LEFT
disp("wiper left:")
x0 =  d-SSx(1)
y0 =   SSy(1)

A=sqrt((xtop-x0)^2+(y0-ytop)^2);
theta=2*asin(A/2/r);

e=theta*35/100; %due to non total uniformity of speed
%e=15*pi/180;
theta=theta-e;
%WIPER LEFT TOP

alpha=atan(Sy(1)/Sx(1));
x=Rmax*cos(alpha+theta)
y=Rmax*sin(alpha+theta)


%WIPER LEFT BOTTOM
disp("wiper left bottom:")

alpha=atan(Ry(1)/Rx(1));
x2=Rmin*cos(alpha+theta)
y2=Rmin*sin(alpha+theta)


%condition
pente1=(y-y2)/(x-x2);
pente2=(ytop-y2)/(xtop-x2);

if pente2<pente1 %optimum when pente=pente2
    disp("no overlap !")
else
    disp("overlap !")
end



%% Display of the mechanism

figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
axis equal; axis off;

% Set the axis limits
xrange = [Qx Rx Sx QQx RRx SSx];
yrange = [Qy Ry Sy QQy RRy SSy];
xlim([min(xrange)-0.2*(max(xrange)-min(xrange)), max(xrange)+0.2*(max(xrange)-min(xrange))]);
ylim([min(yrange)-0.2*(max(yrange)-min(yrange)), max(yrange)+0.2*(max(yrange)-min(yrange))]);

i=1;
for i=1:length(time)
%while not ((round(SSy(i),3)>=round(ytop,3)) && (round(SSx(i),3)>=round(xtop,3)))
    i=i+1;
    cla; % clear axes
    % Plot links
    plot([Qx Rx(i)], [Qy Ry(i)], 'r-', 'LineWidth', 4); % w1
    plot([Rx(i) Sx(i)], [Ry(i) Sy(i)], 'r-', 'LineWidth', 4); % w2
    plot([QQx RRx(i)], [QQy RRy(i)], 'g-', 'LineWidth', 4); % w11
    plot([RRx(i) SSx(i)], [RRy(i) SSy(i)], 'g-', 'LineWidth', 4); % w22

    % OVERLAP POINT REFERENCE
    %plot(xm, ym, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 8); 
    plot(xtop, ytop, 'k pentagram', 'MarkerFaceColor', 'k', 'MarkerSize', 15); 
    plot(x, y, 'k diamond', 'MarkerFaceColor', 'k', 'MarkerSize', 15); 
    plot(x2, y2, 'k diamond', 'MarkerFaceColor', 'k', 'MarkerSize', 15);
    plot([x x2], [y y2], 'b-', 'LineWidth', 4); 
    plot([xtop x2], [ytop y2], 'b--', 'LineWidth', 4); 
    
    %Plot joints
    plot(Qx, Qy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 8); % point Q
    plot(Rx(i), Ry(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % point R
    plot(Sx(i), Sy(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % point S
    plot(QQx, QQy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 8); % point QQ
    plot(RRx(i), RRy(i), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8); % point RR
    plot(SSx(i), SSy(i), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8); % point SS

    % Plot trajectories
    plot(Sx(1:i), Sy(1:i), 'r-', 'LineWidth', 2); % path of point S
    plot(Rx(1:i), Ry(1:i), 'r-', 'LineWidth', 2); % path of point R
    plot(SSx(1:i), SSy(1:i), 'g-', 'LineWidth', 2); % path of point SS
    plot(RRx(1:i), RRy(1:i), 'g-', 'LineWidth', 2); % path of point RR

    pause(dt);

end
