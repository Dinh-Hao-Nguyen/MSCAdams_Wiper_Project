%% Maximization of the sweeping surface
%  Left wiper = upper wiper ; Right wiper = lower wiper

clear; close all; clc;

%% Parameters

% Load some parameters obtained from the MATLAB code 'FullAssembly.m'
load('simulation_results','time','dt','th30','th330','OOOOx','OOOOy','M1','m1','M2','m2');

c = 0.100;  % vertical distance between the wiper fixation points and the bottom of the windshield [m]

% Left wiper
L1 = 1.000; % length of the left wiper blade [m]
% h1>h2=0.650-h1 => 0.650/2=0.325 m < h1 < 2.500-1.850=0.650 m !
h1 = 0.500; % vertical length of the left wiper arm [m]
gamma1 = deg2rad(35); % angle between the left wiper arm and the horizontal [rad]

% Right wiper
L2 = 1.000; % length of the right wiper blade [m]
h2 = 0.650 - h1; % vertical length of the right wiper arm [m]
gamma2 = deg2rad(17.5); % angle between the right wiper arm and the horizontal [rad]

% Methodology: first, tune h1 & gamma1 because we observed a bigger influence: h1=0.5 & gamma1=35 (best results) -> gamma2=17.5

% Computation of wiper arm lengths
w1 = abs(h1/sin(gamma1)); % length of the left wiper arm [m]
w2 = abs(h2/sin(gamma2)); % length of the right wiper arm [m]

%% Sweeping angles

psi1 = th330 - min(th330) + gamma1 - deg2rad(rad2deg(M2-m2)-90);
psi2 = - th30 + max(th30) + gamma2 - deg2rad(rad2deg(M1-m1)-90);

% figure;
% hold on; grid on;
% plot(time, rad2deg(psi1)-rad2deg(mean(psi1)), 'r-', 'LineWidth', 2);
% plot(time, rad2deg(psi2)-rad2deg(mean(psi2)), 'g-', 'LineWidth', 2);
% legend("Left wiper", "Right wiper");
% title("Time evolution of wiper angles");
% xlabel("Time [s]");
% ylabel("Wiper angle [°]");

%% Computation of joint positions

% Point Q (fixed)
Qx = OOOOx;
Qy = OOOOy;

% Point R
Rx = Qx + w1*cos(psi1);
Ry = Qy + w1*sin(psi1);

% Point S
Sx = Rx + L1*cos(psi1-gamma1);
Sy = Ry + L1*sin(psi1-gamma1);

% Point T
Tx = Rx - (1.000-L1)*cos(psi1-gamma1);
Ty = Ry - (1.000-L1)*sin(psi1-gamma1);

% Point QQ (fixed)
QQx = Qx + 1.850;
QQy = Qy;

% Point RR
RRx = QQx - w2*cos(psi2);
RRy = QQy + w2*sin(psi2);

% Point SS
SSx = RRx - L2*cos(psi2-gamma2);
SSy = RRy + L2*sin(psi2-gamma2);

% Point TT
TTx = RRx - (1.000-L2)*cos(psi2-gamma2);
TTy = RRy - (1.000-L2)*sin(psi2-gamma2);

% Windshield corners
CornerBottomLeftX = Qx - h1;
CornerBottomLeftY = Qy + c;
CornerUpLeftX = CornerBottomLeftX;
CornerUpLeftY = CornerBottomLeftY + 1.700;
CornerBottomRightX = CornerBottomLeftX + 2.500;
CornerBottomRightY = CornerBottomLeftY;
CornerUpRightX = CornerBottomRightX;
CornerUpRightY = CornerBottomRightY + 1.700;

%% Computation of the sweeping area

% R & S lower position
[S0deg, iS0] = min(Sy);
R0deg = Ry(iS0);

% RR & SS lower position
[SS0deg, iSS0] = min(SSy);
RR0deg = RRy(iSS0);

dx = 0.050; % discretization step for the numerical integration
x = CornerUpLeftX:dx:CornerUpRightX;
yUpper = ones(1,length(x)-1);
yLower = ones(1,length(x)-1);

% Define the sweeping area upper bound
upperPathX = [Sx SSx];
upperPathY = [Sy SSy];

% Left wiper lower position
redLineX = Rx(iS0):dx/2:Sx(iS0);
redLineY = linspace(R0deg,S0deg,length(redLineX)); %ones(1,length(redLineX))*R0deg;

% Right wiper lower position
greenLineX = SSx(iSS0):dx/2:RRx(iSS0);
greenLineY = linspace(RR0deg,SS0deg,length(greenLineX)); %ones(1,length(greenLineX))*RR0deg;

% Define the sweeping area lower bound
lowerPathX = [Rx RRx redLineX greenLineX];
lowerPathY = [Ry RRy redLineY greenLineY];

for i=1:(length(x)-1) % go through the windshield from left to right

    maxY = CornerBottomLeftY;
    for j=1:length(upperPathX)
        if upperPathX(j) >= x(i) && upperPathX(j) < x(i+1) % find the higher value of the upper path on each interval [x;x+dx[
            maxY = max(maxY, upperPathY(j));
        end
    end
    yUpper(i) = maxY;

    minY = CornerUpLeftY;
    for j=1:length(lowerPathX)
        if lowerPathX(j) >= x(i) && lowerPathX(j) < x(i+1) % find the lower value of the lower path on each interval [x;x+dx[
            minY = min(minY, lowerPathY(j));
        end
    end
    yLower(i) = minY;

end

% Compute the sweeping area using Riemann rectangle method
area = 0;
for i=1:(length(x)-1)
    area = area + (yUpper(i) - yLower(i)) * dx; % add the contribution of each interval [x;x+dx[
end

%% Display of the mechanism

figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
axis equal; axis off;

% Set the axis limits
xrange = [Qx Rx Sx Tx QQx RRx SSx TTx CornerUpLeftX CornerUpRightX CornerBottomLeftX CornerBottomRightX];
yrange = [Qy Ry Sy Ty QQy RRy SSy TTy CornerUpLeftY CornerUpRightY CornerBottomLeftY CornerBottomRightY];
xlim([min(xrange)-0.2*(max(xrange)-min(xrange)), max(xrange)+0.2*(max(xrange)-min(xrange))]);
ylim([min(yrange)-0.2*(max(yrange)-min(yrange)), max(yrange)+0.2*(max(yrange)-min(yrange))]);

% % Create and open video writer object
% set(gcf,'Position',[50 50 1280 720])
% v = VideoWriter('SweepingArea.mp4','MPEG-4');
% v.Quality = 100;
% v.FrameRate = 1/dt;
% open(v);

for i=1:length(time)

    cla; % clear axes

    % Display windshield
    plot([CornerUpLeftX CornerUpRightX], [CornerUpLeftY CornerUpRightY], 'b-', 'LineWidth', 1);
    plot([CornerUpRightX CornerBottomRightX], [CornerUpRightY CornerBottomRightY], 'b-', 'LineWidth', 1);
    plot([CornerBottomRightX CornerBottomLeftX], [CornerBottomRightY CornerBottomLeftY], 'b-', 'LineWidth', 1);
    plot([CornerBottomLeftX CornerUpLeftX], [CornerBottomLeftY CornerUpLeftY], 'b-', 'LineWidth', 1);

    % Plot trajectories
    plot(Sx(1:i), Sy(1:i), 'r-', 'LineWidth', 2); % path of point S
    plot(Rx(1:i), Ry(1:i), 'r-', 'LineWidth', 2); % path of point R
    plot(SSx(1:i), SSy(1:i), 'g-', 'LineWidth', 2); % path of point SS
    plot(RRx(1:i), RRy(1:i), 'g-', 'LineWidth', 2); % path of point RR

    % Plot links
    plot([Qx Rx(i)], [Qy Ry(i)], 'r-', 'LineWidth', 4); % w1
    plot([Rx(i) Sx(i)], [Ry(i) Sy(i)], 'r-', 'LineWidth', 4); % L1
    plot([Rx(i) Tx(i)], [Ry(i) Ty(i)], 'r-', 'LineWidth', 4);
    plot([QQx RRx(i)], [QQy RRy(i)], 'g-', 'LineWidth', 4); % w2
    plot([RRx(i) SSx(i)], [RRy(i) SSy(i)], 'g-', 'LineWidth', 4); % L2
    plot([RRx(i) TTx(i)], [RRy(i) TTy(i)], 'g-', 'LineWidth', 4);

    % Plot joints
    plot(Qx, Qy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 8); % point Q
    plot(Rx(i), Ry(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % point R
    plot(Sx(i), Sy(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % point S
    plot(Tx(i), Ty(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % point T
    plot(QQx, QQy, 'k^', 'MarkerFaceColor', 'k', 'MarkerSize', 8); % point QQ
    plot(RRx(i), RRy(i), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8); % point RR
    plot(SSx(i), SSy(i), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8); % point SS
    plot(TTx(i), TTy(i), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8); % point TT

%     % Plot the redLine
%     plot(Rx(iS0), R0deg, 'r.', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
%     plot(Sx(iS0), S0deg, 'r.', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
%     plot([Rx(iS0) Sx(iS0)], [R0deg S0deg], 'r-', 'LineWidth', 2);
% 
%     % Plot the greenLine
%     plot(RRx(iSS0), RR0deg, 'g.', 'MarkerFaceColor', 'g', 'MarkerSize', 8);
%     plot(SSx(iSS0), SS0deg, 'g.', 'MarkerFaceColor', 'g', 'MarkerSize', 8);
%     plot([RRx(iSS0) SSx(iSS0)], [RR0deg SS0deg], 'g-', 'LineWidth', 2);

    % Show the boundaries of the estimated sweeping area
    plot(x(1:end-1)+dx/2, yUpper, 'co', 'LineWidth', 1);
    plot(x(1:end-1)+dx/2, yLower, 'co', 'LineWidth', 1);

%     % Add frame to the video
%     frame = getframe(gcf);
%     writeVideo(v,frame);

    pause(dt);

end

% close(v);

%% Print some results

% Select the instant to show
i = 1;

% Print the joint coordinates
disp("Point coordinates:");
disp("Q = OOOO = ( " + Qx + " ; " + Qy + " )");
disp("R = newCC = ( " + Rx(i) + " ; " + Ry(i) + " )");
disp("S = ( " + Sx(i) + " ; " + Sy(i) + " )");
disp("QQ = OO = ( " + QQx + " ; " + QQy + " )");
disp("RR = newC = ( " + RRx(i) + " ; " + RRy(i) + " )");
disp("SS = ( " + SSx(i) + " ; " + SSy(i) + " )");

% Print windshield bottom left coordinate
disp("Windshield bottom left corner: ( " + CornerBottomLeftX + " ; " + CornerBottomLeftY + " )");

% Print the estimated sweeping area
disp("h1 = " + h1 + " m");
disp("gamma1 = " + rad2deg(gamma1) + "°");
disp("gamma2 = " + rad2deg(gamma2) + "°");
disp("Sweeping Area = " + area + " m²");
disp("Percentage of total area: " + area/(2.5*1.7)*100 + " %");
