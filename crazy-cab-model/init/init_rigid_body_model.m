% Spatial dimensions of the car
ld = 2.5e-2;        % [m]
l = 2.0e-2;         % [m]
lcm = 1e-2;         % [m]
w =  0.7e-2;        % [m]
r = 0.2e-2;         % [m]
h = 0.5e-2;         % [m]

% Constants
m = 0.01;           % [kg]
g = 9.81;           % [m/s^2]

% Inertia tensor
IB = 5.*[1e-4,0,0;0,1e-4,0;0,0,1e-4];

% Initial conditions
p0 = [0,0,0]';
v0 = [0,0,0]';
q0 = [1,0,0,0]';
omega0 = [0,0,0]';

% Delay to remove algebraic loops
rigidbody_delay = 2e-3;   % [s]