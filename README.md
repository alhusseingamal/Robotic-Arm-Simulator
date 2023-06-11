# Robotic-Arm-Simulator

A MATLAB code for simulating the movement of a three-link robotic arm in the working area defined by the arm paramters.

This project was part of a course in Mechanical Engineering, associated with Faculty of Engineering, Cairo University.
## Deliverables
* DKPM (Direct Kinematic Position Model): given the angles of the arm links, DKPM calculates its position in the XY plane.
* IKPM (Inverse Kinematic Position Model): IKPM calculates if a particular position in the XY plane is reachable by the arm. 
  In other words, given a position (x,y), it finds if a solution (valid link angles) exists for this position.
* Working Area Calculation: calculation of the working area using Green's Theorem on a Closed path Integral, numerically.
* Working Area Plotting: Plotting the reachable working area defined by the three links.
* Trajectory Generation: Generating a possible trajectory between two points inside the working area.
* Robot Arm Simulation: Simulation of the arm movement.

Check the report file for an illustration of the program. 

## Contributors
* Alhussein Gamal Hussein Ali
* Tarek Emad Eldin Kotb
