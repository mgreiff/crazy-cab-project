X = pos.data(:,1);
Y = pos.data(:,2);
QW = quat.data(:,1);
QX = quat.data(:,2);
QY = quat.data(:,3);
QZ = quat.data(:,4);

NumCars = 40;
N = length(simout.data(:,1));
cla
subplot(3,2,5)
hold on;
plot(quat.Time, QW, 'b')
plot(quat.Time, QX, 'r')
legend({'$\Re\{\mathbf{q}\}$','$\Im\{\mathbf{q}\}$'}, 'Interpreter', 'latex')
plot(quat.Time, QY, 'r')
plot(quat.Time, QZ, 'r')
xlabel('Times [s]', 'Interpreter', 'latex')
ylabel('Quaternion', 'Interpreter', 'latex')
title('Real and imaginary part of the quaternion attitude, $\mathbf{q}(t)$', 'Interpreter', 'latex')
axis([0,60,-1.2,1.2])

subplot(3,2,6)
hold on;
plot(omega.Time, omega.Data(:,1), 'r')
plot(omega.Time, omega.Data(:,2), 'g--')
plot(omega.Time, omega.Data(:,3), 'b')
legend({'$\omega_x$','$\omega_y$','$\omega_z$'}, 'Interpreter', 'latex')
xlabel('Times [s]', 'Interpreter', 'latex')
ylabel('Angular rates [rad]', 'Interpreter', 'latex')
title('Angular rates in the body frame $\omega_\mathcal{B}(t)$ [rad/s]', 'Interpreter', 'latex')
axis([0,60,-5,1.5])

subplot(3,2,[1,2,3,4])
plot(X, Y, 'b')
hold on;
l = 2.0e-2;
w = 0.7e-2;
for ii = 1:NumCars
    index = ceil(ii*N/NumCars);
    car = [l,l,0,0,0;
           w,-w,-w,w,w;
           0,0,0,0,0];
    % Rotate
    qw = QW(index);
    qx = QX(index);
    qy = QY(index);
    qz = QZ(index);
    R = [qw^2+qx^2-qy^2-qz^2, 2*(qx*qy-qw*qz)    , 2*(qx*qz+qw*qy);
         2*(qx*qy+qw*qz)    , qw^2-qx^2+qy^2-qz^2, 2*(qy*qz-qw*qx);
         2*(qx*qz-qw*qy)    , 2*(qy*qz+qw*qx)    , qw^2-qx^2-qy^2+qz^2];
    car = R*car;
    % Offset
    car = car + repmat([X(index);Y(index);0],1,5);
    h = fill(car(1,:), car(2,:), 'r');
    set(h, 'FaceAlpha',0.2)
    quiver(X(index),Y(index),2*((car(1,1) + car(1,2))/2 - X(index)), 2*((car(2,1) + car(2,2))/2 - Y(index)), 'k', 'Linewidth',1,'AutoScale','off','MaxHeadSize',0.5)
    if ii == 1
        legend({'$xy$-trajectory', 'car', 'orientation'}, 'Interpreter', 'latex', 'Location', 'SouthWest')
    end
end
xlabel('$x(t)$ [m]', 'Interpreter', 'latex')
ylabel('$y(t)$ [m]', 'Interpreter', 'latex')
title('Positional trajectory in the $xy$-plane', 'Interpreter', 'latex')