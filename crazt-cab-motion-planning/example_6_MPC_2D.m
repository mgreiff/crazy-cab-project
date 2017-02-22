%% Example 6 - MPC evaluation in two dimensions (D2)
% This example shows how the MPC_horizon() function can be used to evaluate
% a set of polynomial splines p(t) on the prediciton horizon. If the entire
% trajectory is defined on [t_0, t_f], then the reference will be set to
% p(t_0) if t<t_0 and p(t_f) if t_f < t. The example uses a precomputed
% trajectory generated by the QP functions in the QP_S6_D2 example.
clear all;
close all;
load('trajectoryExample.mat')

currT = 6.5;
predH = 0.1;
predN = 10;

RX1 = MPC_horizon( PX, times, N, currT, predH, predN);
RY1 = MPC_horizon( PY, times, N, currT, predH, predN);

currT = 2.5;
predH = 0.1;
predN = 20;

RX2 = MPC_horizon( PX, times, N, currT, predH, predN);
RY2 = MPC_horizon( PY, times, N, currT, predH, predN);

figure(1);
subplot(1,2,1);
plot_splines_2D( PX , PY, Xpoints, Ypoints, times , {'position'})
plot(RX1(1,:), RY1(1,:), 'mx')
plot(RX2(1,:), RY2(1,:), 'rx')

subplot(1,2,2);
plot_splines_2D( PX , PY, Xpoints, Ypoints, times , {'velocity'})
plot(RX1(2,:), RY1(2,:), 'mx')
plot(RX2(2,:), RY2(2,:), 'rx')