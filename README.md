# Optimization-of-a-3-DOF-Robotic-Arm
Analysis and optimization of the kinematic and dynamic paramters of a 3 DOF surgical arm with RPR joint configuration, for surgical operations.

Problem Statement: Determine the optimum and most energy-efficient trajectory of the end effector of a robotic arm for surgical operations.

Approach: 

Performed the forward kinematic modelling on MATLAB to predict the Denavit_Hartenburg (DH) parameters for robotic arm position

Optimized the reverese kinemtic paraemters by analyzing the value of the joint parameter based on the desired position and orientation of the end-effector

The MATLAB software is utilized to define the transformation matrix, simulating the robotic manipulator for different parameters

Analzyed the dynamic paraemters of the robot to determine its structural strength and reliability

Outcome:

Maximum output torque acheived from the end effector is 2.3 Nm

Through Langrange and Task Space Analysis, the trajectory was defined such that the acceleration of the end effector increases linearly which ensures smooth surgical operations 



