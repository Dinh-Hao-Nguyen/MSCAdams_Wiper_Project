%% Chebyshev mechanism: Position analysis - General configuration
%  with: - points P and PP not necessarily aligned on the x-axis (angle phi0 between the two)
%        - point P not necessarily set at (0;0)

clear; close all; clc;

% Notations
c = @(theta) cos(theta);
s = @(theta) sin(theta);

%% Parameters

% Bars (estimated parameters in SW)
d1 = 0.050;  % length of the crank [m]
d2 = 0.610;  % [m]
d3 = 0.120;  % [m]
d4A = 0.140; % [m]
d4B = 0.100; % [m]
d5A = 0.040; % [m]
d5B = 0.030; % [m]
d0 = 0.640;  % [m]
alpha = deg2rad(110); % [rad]

% Angle of frame bar P-PP
phi0 = deg2rad(-10); % [rad]

% Time
tf = 10;        % final time [s]
dt = 0.01;      % time resolution [s]
time = 0:dt:tf; % time vector

% One DoF: express everything with respect to phi1
phi1d = 2;          % [rad/s]
phi10 = phi1d*time; % [rad]
phi1 = phi10 - phi0;

%% Computation of joint angles (vectors!)

phi2 = ones(1,length(phi1));
phi4A = ones(1,length(phi1));
phi5A = ones(1,length(phi1));
phi4B = ones(1,length(phi1));
phi5B = ones(1,length(phi1));

for i=1:length(phi1)

    % System of equations (F=0)
    F1 = @(phi2,phi4A,phi5A,phi4B,phi5B) phi5A + alpha - phi5B;
    F2 = @(phi2,phi4A,phi5A,phi4B,phi5B) d0 + c(phi1(i)).*d1 + c(phi2).*(d2+d3) + c(phi4A).*d4A + c(phi5A).*d5A;
    F3 = @(phi2,phi4A,phi5A,phi4B,phi5B) s(phi1(i)).*d1 + s(phi2).*(d2+d3) + s(phi4A).*d4A + s(phi5A).*d5A;
    F4 = @(phi2,phi4A,phi5A,phi4B,phi5B) s(phi1(i)).*d1 + s(phi2).*d2 + s(phi4B).*d4B + s(phi5B).*d5B;
    F5 = @(phi2,phi4A,phi5A,phi4B,phi5B) d0 + c(phi1(i)).*d1 + c(phi2).*d2 + c(phi4B).*d4B + c(phi5B).*d5B;
    
    F = @(X) [F1(X(1),X(2),X(3),X(4),X(5));
              F2(X(1),X(2),X(3),X(4),X(5));
              F3(X(1),X(2),X(3),X(4),X(5));
              F4(X(1),X(2),X(3),X(4),X(5));
              F5(X(1),X(2),X(3),X(4),X(5))];
    
    options = optimset('disp','iter','LargeScale','off','TolFun',0.001,'MaxIter',1000000,'MaxFunEvals',1000000);
    
    % Initial conditions
    if i==1
        x0 = [deg2rad(180),deg2rad(-45),deg2rad(-135),deg2rad(-135),deg2rad(-45)];
    else
        x0 = [phi2(i-1),phi4A(i-1),phi5A(i-1),phi4B(i-1),phi5B(i-1)]; % The current solution is closed to the previous one.
    end
    
    % Solving a system of non-linear equations
    sol = fsolve(F,x0,options);
    phi2(i) = sol(1); phi4A(i) = sol(2); phi5A(i) = sol(3); phi4B(i) = sol(4); phi5B(i) = sol(5);

end

phi20 = phi2 + phi0;
phi4A0 = phi4A + phi0;
phi5A0 = phi5A + phi0;
phi4B0 = phi4B + phi0;
phi5B0 = phi5B + phi0;

%% Computation of joint positions

% Point P (fixed)
Px = 0;
Py = 0;

% Point D
Dx = Px + d1*cos(phi10);
Dy = Py + d1*sin(phi10);

% Point E
Ex = Dx + d2*cos(phi20);
Ey = Dy + d2*sin(phi20);

% Point F
Fx = Ex + d3*cos(phi20);
Fy = Ey + d3*sin(phi20);

% Point PP (fixed)
PPx = Px - d0*cos(phi0);
PPy = Py - d0*sin(phi0);

% Point G
Gx = PPx - d5A*cos(phi5A0);
Gy = PPy - d5A*sin(phi5A0);

% Point H
Hx = PPx - d5B*cos(phi5B0);
Hy = PPy - d5B*sin(phi5B0);

%% Computation of joint angular velocities (vectors!)

phi2d = ones(1,length(phi1));
phi4Ad = ones(1,length(phi1));
phi5Ad = ones(1,length(phi1));
phi4Bd = ones(1,length(phi1));
phi5Bd = ones(1,length(phi1));

for i=1:length(phi1)

    % System of equations (Fd=0)
    F1d = @(phi2d,phi4Ad,phi5Ad,phi4Bd,phi5Bd) phi5Ad - phi5Bd;
    F2d = @(phi2d,phi4Ad,phi5Ad,phi4Bd,phi5Bd) c(phi1(i)).*d1.*phi1d + c(phi2(i)).*(d2+d3).*phi2d + c(phi4A(i)).*d4A.*phi4Ad + c(phi5A(i)).*d5A.*phi5Ad;
    F3d = @(phi2d,phi4Ad,phi5Ad,phi4Bd,phi5Bd) s(phi1(i)).*d1.*phi1d + s(phi2(i)).*(d2+d3).*phi2d + s(phi4A(i)).*d4A.*phi4Ad + s(phi5A(i)).*d5A.*phi5Ad;
    F4d = @(phi2d,phi4Ad,phi5Ad,phi4Bd,phi5Bd) s(phi1(i)).*d1.*phi1d + s(phi2(i)).*d2.*phi2d + s(phi4B(i)).*d4B.*phi4Bd + s(phi5B(i)).*d5B.*phi5Bd;
    F5d = @(phi2d,phi4Ad,phi5Ad,phi4Bd,phi5Bd) c(phi1(i)).*d1.*phi1d + c(phi2(i)).*d2.*phi2d + c(phi4B(i)).*d4B.*phi4Bd + c(phi5B(i)).*d5B.*phi5Bd;
    
    Fd = @(X) [F1d(X(1),X(2),X(3),X(4),X(5));
               F2d(X(1),X(2),X(3),X(4),X(5));
               F3d(X(1),X(2),X(3),X(4),X(5));
               F4d(X(1),X(2),X(3),X(4),X(5));
               F5d(X(1),X(2),X(3),X(4),X(5))];
    
    options=optimset('disp','iter','LargeScale','off','TolFun',.001,'MaxIter',1000000,'MaxFunEvals',1000000);
    
    % Initial conditions
    if i==1
        x0d = [deg2rad(10),deg2rad(10),deg2rad(10),deg2rad(10),deg2rad(10)];
    else
        x0d = [phi2d(i-1),phi4Ad(i-1),phi5Ad(i-1),phi4Bd(i-1),phi5B(i-1)]; % The current solution is closed to the previous one.
    end
    
    % Solving a system of non-linear equations
    sold = fsolve(Fd,x0d,options);
    phi2d(i) = sold(1); phi4Ad(i) = sold(2); phi5Ad(i) = sold(3); phi4Bd(i) = sold(4); phi5Bd(i) = sold(5);

end

phi1d0 = ones(1,length(phi1));
phi2d0 = ones(1,length(phi1));
phi4Ad0 = ones(1,length(phi1));
phi5Ad0 = ones(1,length(phi1));
phi4Bd0 = ones(1,length(phi1));
phi5Bd0 = ones(1,length(phi1));

% First-order approximation of the derivative
for i=1:length(time)-1
    phi1d0(i) = (phi1(i+1)-phi1(i)) / dt;
    phi2d0(i) = (phi2(i+1)-phi2(i)) / dt;
    phi4Ad0(i) = (phi4A(i+1)-phi4A(i)) / dt;
    phi4Bd0(i) = (phi4B(i+1)-phi4B(i)) / dt;
    phi5Ad0(i) = (phi5A(i+1)-phi5A(i)) / dt;
    phi5Bd0(i) = (phi5B(i+1)-phi5B(i)) / dt;
end

%% Display of the mechanism

figure;
hold on;
axis equal; axis off;

% Set the axis limits
xrange = [Px PPx Dx Ex Fx Gx Hx];
yrange = [Py PPy Dy Ey Fy Gy Hy];
xlim([min(xrange)-0.2*(max(xrange)-min(xrange)), max(xrange)+0.2*(max(xrange)-min(xrange))]);
ylim([min(yrange)-0.2*(max(yrange)-min(yrange)), max(yrange)+0.2*(max(yrange)-min(yrange))]);

% % Create and open video writer object
% set(gcf,'Position',[50 50 1280 720])
% v = VideoWriter('Chebyshev.mp4','MPEG-4');
% v.Quality = 100;
% v.FrameRate = 1/dt;
% open(v);

for i=1:length(time)

    cla; % clear axes

    % Plot links
    plot([Px PPx], [Py PPy], 'w-', 'LineWidth', 6);           % d0
    plot([Dx(i) Ex(i)], [Dy(i) Ey(i)], 'g-', 'LineWidth', 6); % d2
    plot([Ex(i) Fx(i)], [Ey(i) Fy(i)], 'g-', 'LineWidth', 6); % d3
    plot([Px Dx(i)], [Py Dy(i)], 'r-', 'LineWidth', 6);       % d1
    plot([Fx(i) Gx(i)], [Fy(i) Gy(i)], 'b-', 'LineWidth', 6); % d4A
    plot([Ex(i) Hx(i)], [Ey(i) Hy(i)], 'b-', 'LineWidth', 6); % d4B
    plot([Hx(i) PPx], [Hy(i) PPy], 'c-', 'LineWidth', 6);     % d5A
    plot([Gx(i) PPx], [Gy(i) PPy], 'c-', 'LineWidth', 6);     % d5B

    % Plot joints
    plot(Px, Py, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 10);      % point P
    plot(PPx, PPy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 10);    % point PP
    plot(Dx(i), Dy(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % point D
    plot(Ex(i), Ey(i), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 8); % point E
    plot(Fx(i), Fy(i), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 8); % point F
    plot(Gx(i), Gy(i), 'co', 'MarkerFaceColor', 'c', 'MarkerSize', 8); % point G
    plot(Hx(i), Hy(i), 'co', 'MarkerFaceColor', 'c', 'MarkerSize', 8); % point H

    % Plot trajectories
    plot(Dx(1:i), Dy(1:i), 'r-', 'LineWidth', 3); % path of point D
    plot(Hx(1:i), Hy(1:i), 'c-', 'LineWidth', 3); % path of point H

%     % Add frame to the video
%     frame = getframe(gcf);
%     writeVideo(v,frame);

    pause(dt);

end

% close(v);

%% Time evolution of joint angles

figure;

% phi1 = f(t)
subplot(3,2,1);
hold on; grid on;
plot(time, rad2deg(phi10));
title('phi1 angle');
xlabel('time [s]');
ylabel('\phi_1 [°]');

% phi2 = f(t)
subplot(3,2,2);
hold on; grid on;
plot(time, rad2deg(phi20));
title('phi2 angle');
xlabel('time [s]');
ylabel('\phi_2 [°]');

% phi4A = f(t)
subplot(3,2,3);
hold on; grid on;
plot(time, rad2deg(phi4A0));
title('phi4A angle');
xlabel('time [s]');
ylabel('\phi_{4A} [°]');

% phi4B = f(t)
subplot(3,2,4);
hold on; grid on;
plot(time, rad2deg(phi4B0));
title('phi4B angle');
xlabel('time [s]');
ylabel('\phi_{4B} [°]');

% phi5A = f(t)
subplot(3,2,5);
hold on; grid on;
plot(time, rad2deg(phi5A0));
title('phi5A angle');
xlabel('time [s]');
ylabel('\phi_{5A} [°]');

% phi5B = f(t)
subplot(3,2,6);
hold on; grid on;
plot(time, rad2deg(phi5B0));
title('phi5B angle');
xlabel('time [s]');
ylabel('\phi_{5B} [°]');

%% Time evolution of joint angular velocities

figure;

% phi1dot = f(t)
subplot(3,2,1);
hold on; grid on;
plot(time, rad2deg(phi1d)*ones(1,length(time)), 'LineWidth', 2);
plot(time, rad2deg(phi1d0));
title('phi1 angular velocity');
xlabel('time [s]');
ylabel('\phi_1dot [°/s]');

% phi2dot = f(t)
subplot(3,2,2);
hold on; grid on;
plot(time, rad2deg(phi2d), 'LineWidth', 2);
plot(time, rad2deg(phi2d0));
title('phi2 angular velocity');
xlabel('time [s]');
ylabel('\phi_2dot [°/s]');

% phi4Adot = f(t)
subplot(3,2,3);
hold on; grid on;
plot(time, rad2deg(phi4Ad), 'LineWidth', 2);
plot(time, rad2deg(phi4Ad0));
title('phi4A angular velocity');
xlabel('time [s]');
ylabel('\phi_{4A}dot [°/s]');

% phi4Bdot = f(t)
subplot(3,2,4);
hold on; grid on;
plot(time, rad2deg(phi4Bd), 'LineWidth', 2);
plot(time, rad2deg(phi4Bd0));
title('phi4B angular velocity');
xlabel('time [s]');
ylabel('\phi_{4B}dot [°/s]');

% phi5Adot = f(t)
subplot(3,2,5);
hold on; grid on;
plot(time, rad2deg(phi5Ad), 'LineWidth', 2);
plot(time, rad2deg(phi5Ad0));
title('phi5A angular velocity');
xlabel('time [s]');
ylabel('\phi_{5A}dot [°/s]');

% phi5Bdot = f(t)
subplot(3,2,6);
hold on; grid on;
plot(time, rad2deg(phi5Bd), 'LineWidth', 2);
plot(time, rad2deg(phi5Bd0));
title('phi5B angular velocity');
xlabel('time [s]');
ylabel('\phi_{5B}dot [°/s]');
