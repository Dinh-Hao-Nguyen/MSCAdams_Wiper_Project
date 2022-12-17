%% Parameters

c=@(th) cos(th);
s=@(th) sin(th);

%% 4-bar

syms l1 l2 l3 l0 real positive
syms th1 th2 th3 real
syms th1d th2d th3d th1dd real

th2d = (l1*sin(th3-th1)) ./ (l2*sin(th2-th3)) .* th1d; % [rad/s]
th3d = (l1*sin(th2-th1)) ./ (l3*sin(th2-th3)) .* th1d; % [rad/s]

th2d_dth1d=diff(th2d,th1d)  ;
th2d_dth1=diff(th2d,th1)    ;
th2d_dth2=diff(th2d,th2)    ;
th2d_dth3=diff(th2d,th3)    ;
th3d_dth1d=diff(th3d,th1d)  ;
th3d_dth1=diff(th3d,th1)    ;
th3d_dth2=diff(th3d,th2)    ;
th3d_dth3=diff(th3d,th3)    ;

th2dd = th2d_dth1d .* th1dd + th2d_dth1.*th1d+th2d_dth2*th2d+th2d_dth3*th3d
th3dd = th3d_dth1d .* th1dd + th3d_dth1.*th3d+th2d_dth2*th2d+th3d_dth3*th3d

%th2dd = - (l1*th1dd*sin(th1 - th3))/(l2*sin(th2 - th3)) - (l1*th1d^2*cos(th1 - th3))/(l2*sin(th2 - th3)) - (l1*th1d*sin(th1 - th2)*((l1*th1d*cos(th1 - th3))/(l2*sin(th2 - th3)) - (l1*th1d*cos(th2 - th3)*sin(th1 - th3))/(l2*sin(th2 - th3)^2)))/(l3*sin(th2 - th3)) - (l1^2*th1d^2*cos(th2 - th3)*sin(th1 - th3)^2)/(l2^2*sin(th2 - th3)^3)- (l1*th1dd*sin(th1 - th3))/(l2*sin(th2 - th3)) - (l1*th1d^2*cos(th1 - th3))/(l2*sin(th2 - th3)) - (l1*th1d*sin(th1 - th2)*((l1*th1d*cos(th1 - th3))/(l2*sin(th2 - th3)) - (l1*th1d*cos(th2 - th3)*sin(th1 - th3))/(l2*sin(th2 - th3)^2)))/(l3*sin(th2 - th3)) - (l1^2*th1d^2*cos(th2 - th3)*sin(th1 - th3)^2)/(l2^2*sin(th2 - th3)^3)
%th3dd = (l1^2*th1d^2*cos(th1 - th2)*sin(th1 - th2))/(l3^2*sin(th2 - th3)^2) - (l1*th1dd*sin(th1 - th2))/(l3*sin(th2 - th3)) - (l1^2*th1d^2*cos(th2 - th3)*sin(th1 - th3)^2)/(l2^2*sin(th2 - th3)^3) + (l1^2*th1d^2*cos(th2 - th3)*sin(th1 - th2)^2)/(l3^2*sin(th2 - th3)^3)


%% CHEBYSHEV
syms d1 d2 d3 d4A d4B d5A d5B real positive
syms phi1 phi2 phi3 real
syms phi1d phi2d phi3d phi1dd real

eq1 = phi5Ad - phi5Bd;
eq2 = c(phi1(i)).*d1.*phi1d + c(phi2(i)).*(d2+d3).*phi2d + c(phi4A(i)).*d4A.*phi4Ad + c(phi5A(i)).*d5A.*phi5Ad;
eq3 = s(phi1(i)).*d1.*phi1d + s(phi2(i)).*(d2+d3).*phi2d + s(phi4A(i)).*d4A.*phi4Ad + s(phi5A(i)).*d5A.*phi5Ad;
eq4 = s(phi1(i)).*d1.*phi1d + s(phi2(i)).*d2.*phi2d + s(phi4B(i)).*d4B.*phi4Bd + s(phi5B(i)).*d5B.*phi5Bd;
eq5 = c(phi1(i)).*d1.*phi1d + c(phi2(i)).*d2.*phi2d + c(phi4B(i)).*d4B.*phi4Bd + c(phi5B(i)).*d5B.*phi5Bd;

eq1d = phi5Add - phi5Bdd;
eq2d_a = s(phi1(i)).*d1.*phi1d.^2 + s(phi2(i)).*(d2+d3).*phi2d.^2 + s(phi4A(i)).*d4A.*phi4Ad.^2 + s(phi5A(i)).*d5A.*phi5Ad.^2;
eq2d_b = c(phi1(i)).*d1.*phi1dd + c(phi2(i)).*(d2+d3).*phi2dd + c(phi4A(i)).*d4A.*phi4Add + c(phi5A(i)).*d5A.*phi5Add;
eq3d_a = c(phi1(i)).*d1.*phi1d.^2 + c(phi2(i)).*(d2+d3).*phi2d.^2 + c(phi4A(i)).*d4A.*phi4Ad.^2 + c(phi5A(i)).*d5A.*phi5Ad.^2;
eq3d_b = s(phi1(i)).*d1.*phi1dd + s(phi2(i)).*(d2+d3).*phi2dd + s(phi4A(i)).*d4A.*phi4Add + s(phi5A(i)).*d5A.*phi5Add;
eq4d_a = c(phi1(i)).*d1.*phi1d.^2 + c(phi2(i)).*d2.*phi2d.^2 + c(phi4B(i)).*d4B.*phi4Bd.^2 + c(phi5B(i)).*d5B.*phi5Bd.^2;
eq4d_b = s(phi1(i)).*d1.*phi1dd + s(phi2(i)).*d2.*phi2dd + s(phi4B(i)).*d4B.*phi4Bdd + s(phi5B(i)).*d5B.*phi5Bdd;
eq5d_a = s(phi1(i)).*d1.*phi1d.^2 + s(phi2(i)).*d2.*phi2d.^2 + s(phi4B(i)).*d4B.*phi4Bd.^2 + s(phi5B(i)).*d5B.*phi5Bd.^2;
eq5d_b = c(phi1(i)).*d1.*phi1dd + c(phi2(i)).*d2.*phi2dd + c(phi4B(i)).*d4B.*phi4Bdd + c(phi5B(i)).*d5B.*phi5Bdd;

eq2d = eq2d_a + eq2d_b;eq3d = eq3d_a + eq3d_b;eq4d = eq4d_a + eq4d_b;eq5d = eq5d_a + eq5d_b;

%% Computation of joint angular accelerations (vectors!)

phi2dd = ones(1,length(phi1));
phi4Add = ones(1,length(phi1));
phi5Add = ones(1,length(phi1));
phi4Bdd = ones(1,length(phi1));
phi5Bdd = ones(1,length(phi1));

for i=1:length(phi1)
    % System of equations (Fdd=0)
    F1dd = @(phi2dd,phi4Add,phi5Add,phi4Bdd,phi5Bdd) phi5Add - phi5Bdd;
    F2dd = @(phi2dd,phi4Add,phi5Add,phi4Bdd,phi5Bdd) (s(phi1(i)).*d1.*phi1d.^2 + s(phi2(i)).*(d2+d3).*phi2d.^2 + s(phi4A(i)).*d4A.*phi4Ad.^2 + s(phi5A(i)).*d5A.*phi5Ad.^2) + (c(phi1(i)).*d1.*phi1dd + c(phi2(i)).*(d2+d3).*phi2dd + c(phi4A(i)).*d4A.*phi4Add + c(phi5A(i)).*d5A.*phi5Add);
    F3dd = @(phi2dd,phi4Add,phi5Add,phi4Bdd,phi5Bdd) (c(phi1(i)).*d1.*phi1d.^2 + c(phi2(i)).*(d2+d3).*phi2d.^2 + c(phi4A(i)).*d4A.*phi4Ad.^2 + c(phi5A(i)).*d5A.*phi5Ad.^2)+(s(phi1(i)).*d1.*phi1dd + s(phi2(i)).*(d2+d3).*phi2dd + s(phi4A(i)).*d4A.*phi4Add + s(phi5A(i)).*d5A.*phi5Add);
    F4dd = @(phi2dd,phi4Add,phi5Add,phi4Bdd,phi5Bdd) (c(phi1(i)).*d1.*phi1d.^2 + c(phi2(i)).*d2.*phi2d.^2 + c(phi4B(i)).*d4B.*phi4Bd.^2 + c(phi5B(i)).*d5B.*phi5Bd.^2)+(s(phi1(i)).*d1.*phi1dd + s(phi2(i)).*d2.*phi2dd + s(phi4B(i)).*d4B.*phi4Bdd + s(phi5B(i)).*d5B.*phi5Bdd);
    F5dd = @(phi2dd,phi4Add,phi5Add,phi4Bdd,phi5Bdd) (s(phi1(i)).*d1.*phi1d.^2 + s(phi2(i)).*d2.*phi2d.^2 + s(phi4B(i)).*d4B.*phi4Bd.^2 + s(phi5B(i)).*d5B.*phi5Bd.^2)+(c(phi1(i)).*d1.*phi1dd + c(phi2(i)).*d2.*phi2dd + c(phi4B(i)).*d4B.*phi4Bdd + c(phi5B(i)).*d5B.*phi5Bdd);
    
    Fdd = @(X) [F1dd(X(1),X(2),X(3),X(4),X(5));
               F2dd(X(1),X(2),X(3),X(4),X(5));
               F3dd(X(1),X(2),X(3),X(4),X(5));
               F4dd(X(1),X(2),X(3),X(4),X(5));
               F5dd(X(1),X(2),X(3),X(4),X(5))];
    
    options=optimset('disp','iter','LargeScale','off','TolFun',.001,'MaxIter',1000000,'MaxFunEvals',1000000);
    
    % Initial conditions
    if i==1
    %     x0d=[deg2rad(180),deg2rad(36.87+90),deg2rad(36.87),deg2rad(36.87),deg2rad(90+36.87)];
        x0dd = [deg2rad(10),deg2rad(10),deg2rad(10),deg2rad(10),deg2rad(10)];
    else
        x0dd = [phi2d(i-1),phi4Ad(i-1),phi5Ad(i-1),phi4Bd(i-1),phi5B(i-1)]; % The current solution is closed to the previous one.
    end
    
    % Solving a system of non-linear equations
    soldd = fsolve(Fdd,x0dd,options);
    phi2dd(i) = soldd(1); phi4Add(i) = soldd(2); phi5Add(i) = soldd(3); phi4Bdd(i) = soldd(4); phi5Bdd(i) = soldd(5);

end

