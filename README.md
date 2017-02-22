# crazy-cab-project

This project is still in its infancy. The end goal is to control a small unmanned ground vehicle (UGV) by fusing MOCAP measurements with IMU data in a dynamical filter on the host computer. Advanced motion planning will then be combined with a TV-LQR/MPC formulations and torque-vectoring control, testing the limits of the toy car.

## Directories

#### /crazy-cab-documentation/*
A short document detailing the mathematics and status of the project.

#### /crazy-cab-model/*
This directory contains enough code to explore the general UGV dynamics in a Simulink/Matlab environment. A special case study of a the small car is included, and the project can be navigated by running `init_project -h`.

#### /crazy-cab-motion-planning/*
This directory contains some algorithms for the QP-based motion planning considered for the UGV, and the project can be navigated by running `init_project -h`.
