% Parameters
M = 0.5;     % mass of the cart (kg)
m = 0.2;     % mass of the pendulum (kg)
b = 0.1;     % coefficient of friction for cart (N/m/sec)
I = 0.006;   % inertia of the pendulum (kg*m^2)
g = 9.8;     % acceleration due to gravity (m/s^2)
l = 0.3;     % length to pendulum center of mass (m)

% Denominator for A and B matrices
p = I*(M+m)+M*m*l^2;

% State-space matrices
A = [0     1              0           0;
     0  -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0     0              0           1;
     0  -(m*l*b)/p      m*g*l*(M+m)/p  0];

B = [0;
     (I+m*l^2)/p;
     0;
     m*l/p];

C = [1 0 0 0;
     0 0 1 0];

D = [0;
     0];

sys = ss(A,B,C,D);

step(sys)
title('Step Response of Inverted Pendulum on a Cart')



% Parameters
M = 0.5;     % mass of the cart (kg)
m = 0.2;     % mass of the pendulum (kg)
l = 0.3;     % length to pendulum center of mass (m)
g = 9.81;    % gravity (m/s^2)
d = 0.1;     % friction coefficient

% State-space matrices
A = [0 1 0 0;
     0 -d/M (m*g)/M 0;
     0 0 0 1;
     0 -d/(M*l) (M+m)*g/(M*l) 0];

B = [0;
     1/M;
     0;
     1/(M*l)];

% Weights for LQR
Q = diag([10, 1, 10, 1]);
R = 0.01;

% LQR design
K = lqr(A, B, Q, R);

% Closed-loop system
Ac = A - B*K;
Bc = [0; 0; 0; 0];  % no external input
Cc = eye(4);        % observe all states
Dc = zeros(4,1);

sys_cl = ss(Ac, Bc, Cc, Dc);

% Initial state
x0 = [0.1; 0; 0.2; 0];  % small perturbation

% Simulation
t = 0:0.01:10;
[y, t, x] = initial(sys_cl, x0, t);

% Plot
figure;
plot(t, x);
legend('x (cart position)', 'dx', 'theta (pendulum angle)', 'dtheta');
xlabel('Time (s)');
ylabel('States');
title('LQR Controlled Response of Inverted Pendulum');
grid on;