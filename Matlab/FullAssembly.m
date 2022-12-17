%% Full assembly: Position analysis
%  Right wiper: Chebyshev + 4-bar mechanisms ; Left wiper: 4-bar mechanism

clear; close all; clc;

% Notations
c = @(theta) cos(theta);
s = @(theta) sin(theta);

%% Attempt to optimize the parameters of the right wiper bars (Chebyshev + 4-bar)

% param = 0;

% param = [0.040 0.045 0.050 0.055 0.060]; % d1 = 0.050
% param = [0.600 0.605 0.610 0.615 0.620]; % d2 = 0.610
% param = [0.120 0.125 0.130 0.135 0.140]; % d3 = 0.120
% param = [0.110 0.115 0.120 0.125 0.130]; % d4A = 0.120
% param = [0.090 0.095 0.100 0.105 0.110]; % d4B = 0.100
% param = [0.030 0.035 0.040 0.045 0.050]; % d5A = 0.040
% param = [0.020 0.025 0.030 0.035 0.040]; % d5B = 0.030
% param = [0.630 0.635 0.640 0.645 0.650]; % d0 = 0.640
% param = [100 105 110 115 120]; % alpha = 120
% param = [0 5 10]; % phi0 = 10

% param = [0.040 0.045 0.050 0.055 0.060]; % l1 = 0.050 (significant variation of the angle)
% param = [0.610 0.620 0.630 0.640]; % l2 = 0.630 (limited range, small variation of the angle)
% param = [0.065 0.070 0.075 0.080 0.085]; % l3 = 0.070 (small variation of the angle)
% param = [0.620 0.630 0.640 0.650 0.660]; % l0 = 0.620
% param = [60 70 80 90 100]; % beta = 80
% param = [0 5 10 15 20]; % th0 = 0;

% for j=1:length(param)

%% Parameters - Chebyshev mechanism

d1 = 0.050;  % length of bar P-D [m] - input of the Chebyshev system
d2 = 0.610;  % length of bar D-E [m]
d3 = 0.120;  % length of bar E-F [m]
d4A = 0.140; % length of bar F-G [m]
d4B = 0.100; % length of bar E-H [m]
d5A = 0.040; % length of bar G-PP [m]
d5B = 0.030; % length of bar H-PP [m] - output of the Chebyshev system
d0 = 0.640;  % distance between fixed points P-PP [m]
alpha = deg2rad(110); % angle G-PP-H [rad]
phi0 = deg2rad(10); % angle of bar P-PP [rad]

%% Parameters - 4-bar mechanism

l1 = 0.055; % length of the crank O-A [m] - input of the 4-bar mechanism
l2 = 0.630; % length of the coupler A-B [m]
l3 = 0.070; % length of the rocker B-OO [m]
l4 = 0.300; % length of the wiper OO-C [m] - output of the 4-bar mechanism
l0 = 0.620; % length of the frame bar O-OO [m]
beta = deg2rad(80); % angle H-O-A [rad]
th0 = deg2rad(0); % angle of frame bar O-OO [rad]

%% Parameters - Left wiper

l11 = d1;    % length of the crank OOO-AA [m] - input of the left wiper
l22 = 0.610; % length of the coupler AA-BB [m]
l33 = 0.070; % length of the rocker BB-OOOO[m]
l44 = 0.300; % length of the wiper OOOO-CC [m] - output of the left wiper
l00 = 0.609930; % length of the frame bar OOO-OOOO [m]
% Grashof criterion: if s+l <= p+q (s=shortest, l=longest, p,q= remaining)
% then at least one link will be capable of making a full revolution.
th00 = deg2rad(-10.498); % angle of frame bar OOO-OOOO [rad]

% Methodology to dimension the left wiper:
% 1/ Fix l11 & l33
% 2/ Satisfy the distance between the two wiper fixation points: l00*cos(th00) = 1.850 - OOx
% 3/ Align O, OO and OOOO horizontally: l00*sin(th00) = OOy
% 4/ Find l00 and th00 (do not forget to round the distance OO-OOOO to be exactly equal to 1.850 m)
% 5/ Use Grashof criterion to fix l22

%% Time

tf = 15;        % final time [s]
dt = 0.01;      % time resolution [s]
time = 0:dt:tf; % time vector

%% Actuated joint: phi1 = th11

phi1d = 2;          % [rad/s]
phi10 = phi1d*time; % [rad]
phi1 = phi10 - phi0;

% Connect the crank to the left mechanism
th11d = phi1d; % [rad/s]
th110 = phi10; % [rad]
th11 = phi1;

%% Computation of joint angles - Chebyshev mechanism

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

%% Relation between the two systems: output of the Chebyshev = input of the 4-bar

th10 = phi5B0 + beta;
th1 = th10 - th0;

%% Computation of joint angles - 4-bar mechanism

% ki = f(theta1) | i=1,2,3
k1 = -2*l1*l3*sin(th1);
k2 = 2*l3*(l0 - l1*cos(th1));
k3 = l0^2 + l1^2 - l2^2 + l3^2 - 2*l0*l1*cos(th1);

% theta3 = f(theta1)
th3 = 2*atan2(-k1 + sqrt(k1.^2 + k2.^2 - k3.^2), k3 - k2);   % [rad]
% th3 = 2*atan2(-k1 - sqrt(k1.^2 + k2.^2 - k3.^2), k3 - k2); % another possible solution/configuration
th30 = th3 + th0;

% theta2 = f(theta1, theta3)
th2 = atan2(-l1*sin(th1) + l3*sin(th3), l0 - l1*cos(th1) + l3*cos(th3)); % [rad]
th20 = th2 + th0;

%% Computation of joint angles - Left wiper

% ki = f(theta11) | i=1,2,3
k1 = -2*l11*l33*sin(th11);
k2 = 2*l33*(l00 - l11*cos(th11));
k3 = l00^2 + l11^2 - l22^2 + l33^2 - 2*l00*l11*cos(th11);

% theta33 = f(theta11)
th33 = 2*atan2(-k1 - sqrt(k1.^2 + k2.^2 - k3.^2), k3 - k2);   % [rad]
% th33 = 2*atan2(-k1 + sqrt(k1.^2 + k2.^2 - k3.^2), k3 - k2); % another possible solution/configuration
th330 = th33 + th00;

% theta22 = f(theta11, theta33)
th22 = atan2(-l11*sin(th11) + l33*sin(th33), l00 - l11*cos(th11) + l33*cos(th33)); % [rad]
th220 = th22 + th00;

%% Computation of joint positions - Chebyshev mechanism
%  To connect the two systems: x-coord. --> -x ; y-coord. --> -y

% Point P (fixed)
Px = 0;
Py = 0;

% Point D
Dx = Px - d1*cos(phi10);
Dy = Py - d1*sin(phi10);

% Point E
Ex = Dx - d2*cos(phi20);
Ey = Dy - d2*sin(phi20);

% Point F
Fx = Ex - d3*cos(phi20);
Fy = Ey - d3*sin(phi20);

% Point PP (fixed)
PPx = Px + d0*cos(phi0);
PPy = Py + d0*sin(phi0);

% Point G
Gx = PPx + d5A*cos(phi5A0);
Gy = PPy + d5A*sin(phi5A0);

% Point H
Hx = PPx + d5B*cos(phi5B0);
Hy = PPy + d5B*sin(phi5B0);

%% Computation of joint positions - 4-bar mechanism
%  To connect the two systems: x-coord. --> x ; y-coord. --> y (nothing changes)

% Point O (fixed) = point PP
Ox = PPx;
Oy = PPy;

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

%% Computation of joint positions - Left wiper
%  To reorientate the system: x-coord. --> -x ; y-coord. --> -y

% Point OOO (fixed)
OOOx = Px;
OOOy = Py;

% Point AA
AAx = OOOx - l11*cos(th110);
AAy = OOOy - l11*sin(th110);

% Point OOOO (fixed)
OOOOx = OOOx - l00*cos(th00);
OOOOy = OOOy - l00*sin(th00);

% Point BB
BBx = OOOOx - l33*cos(th330); % also: BBx = AAx + l22*cos(th220)
BBy = OOOOy - l33*sin(th330); % also: BBy = AAy + l22*sin(th220)

% Point CC
CCx = OOOOx + l44*cos(th330);
CCy = OOOOy + l44*sin(th330);

%% Computation of joint velocities - Chebyshev mechanism

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

%% Relation between the two systems: input of the Chebyshev = input of the left wiper

th1d = phi5Bd;

%% Computation of joint velocities - 4-bar mechanism

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

%% Computation of joint velocities - Left wiper

% theta2d = f(theta1, theta2, theta3) * theta1d
th22d = (l11*sin(th33-th11)) ./ (l22*sin(th22-th33)) .* th11d; % [rad/s]

% theta3d = f(theta1, theta2, theta3) * theta1d
th33d = (l11*sin(th22-th11)) ./ (l33*sin(th22-th33)) .* th11d; % [rad/s]

th11d0 = ones(1,length(time)-1);
th22d0 = ones(1,length(time)-1);
th33d0 = ones(1,length(time)-1);

% First-order approximation of the derivative
for i=1:length(time)-1
    th11d0(i) = (th11(i+1)-th11(i)) / dt;
    th22d0(i) = (th22(i+1)-th22(i)) / dt;
    th33d0(i) = (th33(i+1)-th33(i)) / dt;
end

%% Display of the mechanism

% if length(param) == 1

figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
axis equal; axis off;

% Set the axis limits
xrange = [Px PPx Dx Ex Fx Gx Hx Ox OOx Ax Bx Cx OOOx OOOOx AAx BBx CCx];
yrange = [Py PPy Dy Ey Fy Gy Hy Oy OOy Ay By Cy OOOy OOOOy AAy BBy CCy];
xlim([min(xrange)-0.2*(max(xrange)-min(xrange)), max(xrange)+0.2*(max(xrange)-min(xrange))]);
ylim([min(yrange)-0.2*(max(yrange)-min(yrange)), max(yrange)+0.2*(max(yrange)-min(yrange))]);

% % Create and open video writer object
% set(gcf,'Position',[50 50 1280 720])
% v = VideoWriter('FullAssembly.mp4','MPEG-4');
% v.Quality = 100;
% v.FrameRate = 1/dt;
% open(v);

for i=1:length(time)

    cla; % clear axes

    % Plot links
    plot([Px PPx], [Py PPy], 'w-', 'LineWidth', 4);               % d0
    plot([Ox OOx], [Oy OOy], 'w-', 'LineWidth', 4);               % frame bar (l0)
    plot([OOOx OOOOx], [OOOy OOOOy], 'w-', 'LineWidth', 4);       % frame bar (l00)
    plot([Dx(i) Ex(i)], [Dy(i) Ey(i)], 'g-', 'LineWidth', 4);     % d2
    plot([Ex(i) Fx(i)], [Ey(i) Fy(i)], 'g-', 'LineWidth', 4);     % d3
    plot([Ax(i) Bx(i)], [Ay(i) By(i)], 'g-', 'LineWidth', 4);     % coupler (l2)
    plot([AAx(i) BBx(i)], [AAy(i) BBy(i)], 'g-', 'LineWidth', 4); % coupler (l22)
    plot([Fx(i) Gx(i)], [Fy(i) Gy(i)], 'b-', 'LineWidth', 4);     % d4A
    plot([Ex(i) Hx(i)], [Ey(i) Hy(i)], 'b-', 'LineWidth', 4);     % d4B
    plot([Bx(i) OOx], [By(i) OOy], 'b-', 'LineWidth', 4);         % rocker (l3)
    plot([BBx(i) OOOOx], [BBy(i) OOOOy], 'b-', 'LineWidth', 4);   % rocker (l33)
%     plot([Hx(i) PPx], [Hy(i) PPy], 'c-', 'LineWidth', 4);         % d5A
%     plot([Gx(i) PPx], [Gy(i) PPy], 'c-', 'LineWidth', 4);         % d5B
    plot([Gx(i) Hx(i)], [Gy(i) Hy(i)], 'c-', 'LineWidth', 4);
    plot([Hx(i) Ax(i)], [Hy(i) Ay(i)], 'c-', 'LineWidth', 4);
    plot([Ax(i) Gx(i)], [Ay(i) Gy(i)], 'c-', 'LineWidth', 4);
    plot([OOx Cx(i)], [OOy Cy(i)], 'c-', 'LineWidth', 4);         % wiper (l4)
    plot([OOOOx CCx(i)], [OOOOy CCy(i)], 'c-', 'LineWidth', 4);   % wiper (l44)
    plot([Px Dx(i)], [Py Dy(i)], 'r-', 'LineWidth', 4);           % crank (d1)
%     plot([Ox Ax(i)], [Oy Ay(i)], 'r-', 'LineWidth', 4);           % l1

    % Plot joints
    plot(Dx(i), Dy(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6);   % point D
    plot(Ex(i), Ey(i), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 6);   % point E
    plot(Fx(i), Fy(i), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 6);   % point F
    plot(Gx(i), Gy(i), 'co', 'MarkerFaceColor', 'c', 'MarkerSize', 6);   % point G
    plot(Hx(i), Hy(i), 'co', 'MarkerFaceColor', 'c', 'MarkerSize', 6);   % point H
    plot(Ax(i), Ay(i), 'ro', 'MarkerFaceColor', 'c', 'MarkerSize', 6);   % point A
    plot(Bx(i), By(i), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 6);   % point B
    plot(Cx(i), Cy(i), 'co', 'MarkerFaceColor', 'c', 'MarkerSize', 6);   % point C
    plot(BBx(i), BBy(i), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 6); % point BB
    plot(CCx(i), CCy(i), 'co', 'MarkerFaceColor', 'c', 'MarkerSize', 6); % point CC
    plot(Px, Py, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 8);        % point P
    plot(PPx, PPy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 8);      % point PP
    plot(OOx, OOy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 8);      % point OO
    plot(OOOOx, OOOOy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 8);  % point OOOO

    % Plot trajectories
    plot(Dx(1:i), Dy(1:i), 'r-', 'LineWidth', 2);   % path of point D (input of the Chebyshev system)
    plot(Cx(1:i), Cy(1:i), 'c-', 'LineWidth', 2);   % path of point C (output of the 4-bar system)
    plot(CCx(1:i), CCy(1:i), 'c-', 'LineWidth', 2); % path of point CC (output of the left wiper)

%     % Add frame to the video
%     frame = getframe(gcf);
%     writeVideo(v,frame);

    pause(dt);

end

% close(v);

%% Display the results

figure;
% end

% theta3 = f(phi1)
subplot(2,1,1);
hold on; grid on;
plot(rad2deg(phi1), rad2deg(th30));
[M1,I1] = max(th30);
% plot(rad2deg(phi1(I1)), rad2deg(M1), 'r.', 'MarkerSize', 10); % highlight the maximum
[m1,i1] = min(th30);
% plot(rad2deg(phi1(i1)), rad2deg(m1), 'r.', 'MarkerSize', 10); % highlight the minimum
title('Link between the crank angle and the angle of the right wiper');
xlabel('Crank angle \phi_1 [°]');
ylabel('Right wiper angle \theta_3 [°]');

% theta33 = f(t)
subplot(2,1,2);
hold on; grid on;
plot(rad2deg(phi1), rad2deg(th330));
[M2,I2] = max(th330);
% plot(rad2deg(phi1(I2)), rad2deg(M2), 'r.', 'MarkerSize', 10); % highlight the maximum
[m2,i2] = min(th330);
% plot(rad2deg(phi1(i2)), rad2deg(m2), 'r.', 'MarkerSize', 10); % highlight the minimum
title('Link between the crank angle and the angle of the left wiper');
xlabel('Crank angle \phi_1 [°]');
ylabel('Left wiper angle \theta_{33} [°]');

%% Plot output angles

figure;
hold on; grid on;
plot(time, rad2deg(th30)-180, 'g-', 'LineWidth', 2);
plot(time, rad2deg(th330)+360, 'r-', 'LineWidth', 2);
title('Time evolution of wiper angles');
xlabel('Time [s]');
ylabel('Wiper angle [°]');
legend('Right wiper angle (\theta_3)', 'Left wiper angle (\theta_{33})');

% end

%% Wiper speed synchronization
% if length(param) == 1
    figure;
    hold on; grid on;
    plot(time, rad2deg(th30-mean(th30)), 'r-', 'LineWidth', 2);
    plot(time, -rad2deg(th330-mean(th330)), 'g-', 'LineWidth', 2);
    legend("Left wiper", "Right wiper");
    title("Comparison between the evolution of the left and right wiper angle");
    xlabel("Time [s]");
    ylabel("Wiper angle [°]");
% end

%% Print some results

clc;

% Select the instant to show
i = 1;

% Print the joint coordinates
disp("Point coordinates:");
disp("P = OOO = ( " + Px + " ; " + Py + " )");
disp("D = AA = ( " + Dx(i) + " ; " + Dy(i) + " )");
disp("E = ( " + Ex(i) + " ; " + Ey(i) + " )");
disp("F = ( " + Fx(i) + " ; " + Fy(i) + " )");
disp("G = ( " + Gx(i) + " ; " + Gy(i) + " )");
disp("H = ( " + Hx(i) + " ; " + Hy(i) + " )");
disp("O = PP = ( " + Ox + " ; " + Oy + " )");
disp("A = ( " + Ax(i) + " ; " + Ay(i) + " )");
disp("B = ( " + Bx(i) + " ; " + By(i) + " )");
disp("OO = ( " + OOx + " ; " + OOy + " )");
disp("C = ( " + Cx(i) + " ; " + Cy(i) + " )");
disp("BB = ( " + BBx(i) + " ; " + BBy(i) + " )");
disp("OOOO = ( " + OOOOx + " ; " + OOOOy + " )");
disp("CC = ( " + CCx(i) + " ; " + CCy(i) + " )");

% Compute the angular range of the 2 wipers
delta1 = M1 - m1;
delta2 = M2 - m2;

% Print the angular ranges
disp("Angular range of the right wiper: " + rad2deg(delta1) + "°");
disp("Angular range of the left wiper: " + rad2deg(delta2) + "°");

%% Validation of the kinematics after connection of all systems

figure;

% theta1dot = f(t)
subplot(3,1,1);
hold on; grid on;
plot(time, rad2deg(th1d), 'LineWidth', 4);
plot(time(1:end-1), rad2deg(th1d0));
legend('from Kinematics equations', 'from 2-point derivative approximation');
title('Angular velocity theta1dot');
xlabel('time [s]');
ylabel("\theta_1dot [°/s]");

% theta2dot = f(t)
subplot(3,1,2);
hold on; grid on;
plot(time, rad2deg(th2d), 'LineWidth', 4);
plot(time(1:end-1), rad2deg(th2d0));
legend('from Kinematics equations', 'from 2-point derivative approximation');
title('Angular velocity theta2dot');
xlabel('time [s]');
ylabel("\theta_2dot [°/s]");

% theta3dot = f(t)
subplot(3,1,3);
hold on; grid on;
plot(time, rad2deg(th3d), 'LineWidth', 4);
plot(time(1:end-1), rad2deg(th3d0));
legend('from Kinematics equations', 'from 2-point derivative approximation');
title('Angular velocity theta3dot');
xlabel('time [s]');
ylabel("\theta_3dot [°/s]");

%% Plot output velocities

figure;
hold on; grid on;
plot(time, abs(rad2deg(th3d)), 'g-', 'LineWidth', 2);
plot(time, abs(rad2deg(th33d)), 'r-', 'LineWidth', 2);
legend('Right wiper velocity (\theta_3dot)', 'Left wiper velocity (\theta_{33}dot)');
title('Time evolution of wiper angular velocities');
xlabel('Time [s]');
ylabel('Wiper angular velocity [°/s]');
