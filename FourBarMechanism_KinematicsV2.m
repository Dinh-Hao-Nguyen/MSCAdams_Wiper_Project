%% Four-bar mechanism: Kinematics - General configuration
%  with: - points O and OO not necessarily aligned on the x-axis (angle theta0 between the two)
%        - point O not necessarily set at (0;0)

% Reference: Tang, C.P., 2010. Lagrangian dynamic formulation of a four-bar mechanism with minimal coordinates.

clear; close all; clc;

%% Parameters

% Bars
l1 = 0.100; % length of the crank [m]
l2 = 0.260; % length of the coupler [m]
l3 = 0.190; % length of the rocker [m]
l0 = 0.180; % length of the frame bar [m]
l4 = 0.300; % length of the wiper [m]
% Grashof criterion: if s+l <= p+q (s=shortest, l=longest, p,q= remaining)
% then at least one link will be capable of making a full revolution.

% Angle of frame bar O-OO
th0 = deg2rad(10); % [rad]

% Time
tf = 10;        % final time [s]
dt = 0.01;      % time resolution [s]
time = 0:dt:tf; % time vector

% One DoF: express everything with respect to theta1
th1d = 1;         % [rad/s]
th10 = th1d*time; % [rad]
th1 = th10 - th0;

%% Computation of joint angles (vectors!)

% ki = f(theta1) | i=1,2,3
k1 = -2*l1*l3*sin(th1);
k2 = 2*l3*(l0 - l1*cos(th1));
k3 = l0^2 + l1^2 - l2^2 + l3^2 - 2*l0*l1*cos(th1);

% theta3 = f(theta1)
th3 = 2*atan2(-k1 - sqrt(k1.^2 + k2.^2 - k3.^2), k3 - k2);   % [rad]
% th3 = 2*atan2(-k1 + sqrt(k1.^2 + k2.^2 - k3.^2), k3 - k2); % another possible solution/configuration
th30 = th3 + th0;

% theta2 = f(theta1, theta3)
th2 = atan2(-l1*sin(th1) + l3*sin(th3), l0 - l1*cos(th1) + l3*cos(th3)); % [rad]
th20 = th2 + th0;

%% Computation of joint positions

% Point O (fixed)
Ox = 1;
Oy = 1;

% Point A
Ax = Ox + l1*cos(th10);
Ay = Oy + l1*sin(th10);

% Point OO (fixed)
OOx = Ox + l0*cos(th0);
OOy = Oy + l0*sin(th0);

% Point B
Bx = OOx + l3*cos(th30); % also: Bx = Ax + l2*cos(th20)
By = OOy + l3*sin(th30); % also: By = Ay + l2*sin(th20)

% Point C
Cx = OOx - l4*cos(th30);
Cy = OOy - l4*sin(th30);

%% Computation of joint angular velocities (vectors!)

% theta2d = f(theta1, theta2, theta3) * theta1d
th2d = (l1*sin(th3-th1)) ./ (l2*sin(th2-th3)) .* th1d; % [rad/s]

% theta3d = f(theta1, theta2, theta3) * theta1d
th3d = (l1*sin(th2-th1)) ./ (l3*sin(th2-th3)) .* th1d; % [rad/s]

th1d0 = ones(1,length(time)-1);
th2d0 = ones(1,length(time)-1);
th3d0 = ones(1,length(time)-1);

% First-order approximation of the derivative
for i=1:length(time)-1
    th1d0(i) = (th1(i+1)-th1(i)) / dt;
    th2d0(i) = (th2(i+1)-th2(i)) / dt;
    th3d0(i) = (th3(i+1)-th3(i)) / dt;
end

%% Display of the mechanism

figure;
hold on;
axis equal; axis off;

% Set the axis limits
xrange = [Ox OOx Ax Bx Cx];
yrange = [Oy OOy Ay By Cy];
xlim([min(xrange)-0.2*(max(xrange)-min(xrange)), max(xrange)+0.2*(max(xrange)-min(xrange))]);
ylim([min(yrange)-0.2*(max(yrange)-min(yrange)), max(yrange)+0.2*(max(yrange)-min(yrange))]);

% % Create and open video writer object
% set(gcf,'Position',[50 50 1280 720])
% v = VideoWriter('FourBar.mp4','MPEG-4');
% v.Quality = 100;
% v.FrameRate = 1/dt;
% open(v);

for i=1:length(time)

    cla; % clear axes

    % Plot links
    plot([Ox OOx], [Oy OOy], 'w-', 'LineWidth', 6);           % frame bar (l0)
    plot([Ax(i) Bx(i)], [Ay(i) By(i)], 'g-', 'LineWidth', 6); % coupler (l2)
    plot([Ox Ax(i)], [Oy Ay(i)], 'r-', 'LineWidth', 6);       % crank (l1)
    plot([Bx(i) OOx], [By(i) OOy], 'b-', 'LineWidth', 6);     % rocker (l3)
    plot([OOx Cx(i)], [OOy Cy(i)], 'c-', 'LineWidth', 6);     % wiper (l4)

    % Plot joints
    plot(Ox, Oy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 10);      % point O
    plot(OOx, OOy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 10);    % point OO
    plot(Ax(i), Ay(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % point A
    plot(Bx(i), By(i), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 8); % point B
    plot(Cx(i), Cy(i), 'co', 'MarkerFaceColor', 'c', 'MarkerSize', 8); % point C

    % Plot trajectories
    plot(Ax(1:i), Ay(1:i), 'r-', 'LineWidth', 3); % path of point A
    plot(Bx(1:i), By(1:i), 'b-', 'LineWidth', 3); % path of point B
    plot(Cx(1:i), Cy(1:i), 'c-', 'LineWidth', 3); % path of point C

%     % Add frame to the video
%     frame = getframe(gcf);
%     writeVideo(v,frame);

    pause(dt);

end

% close(v);

%% Time evolution of joint angles

figure;

% theta1 = f(t)
subplot(3,1,1);
hold on; grid on;
plot(time, rad2deg(th10));
title('Crank angle');
xlabel('time [s]');
ylabel('\theta_1 [°]');

% theta2 = f(t)
subplot(3,1,2);
hold on; grid on;
plot(time, rad2deg(th20));
title('Coupler angle');
xlabel('time [s]');
ylabel('\theta_2 [°]');

% theta3 = f(t)
subplot(3,1,3);
hold on; grid on;
plot(time, rad2deg(th30));
title('Rocker angle');
xlabel('time [s]');
ylabel('\theta_3 [°]');

%% Time evolution of joint angular velocities

figure;

% theta1dot = f(t)
subplot(3,1,1);
hold on; grid on;
plot(time, rad2deg(th1d)*ones(1,length(time)));
plot(time(1:end-1), rad2deg(th1d0));
title('Crank angular velocity');
xlabel('time [s]');
ylabel("\theta_1dot [°/s]");

% theta2dot = f(t)
subplot(3,1,2);
hold on; grid on;
plot(time, rad2deg(th2d));
plot(time(1:end-1), rad2deg(th2d0));
title('Coupler angular velocity');
xlabel('time [s]');
ylabel("\theta_2dot [°/s]");

% theta3dot = f(t)
subplot(3,1,3);
hold on; grid on;
plot(time, rad2deg(th3d));
plot(time(1:end-1), rad2deg(th3d0));
title('Rocker angular velocity');
xlabel('time [s]');
ylabel("\theta_3dot [°/s]");
