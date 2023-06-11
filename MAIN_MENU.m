clc
clear all
 fprintf('-------------------------------------Welcome To RoboTool Main Menu -------------------------------------\n\n');
 fprintf('Enter manipulator link dimensions and angle ranges \n\n');
 l1=input('Enter 1st link length: ');
 l2=input('Enter 2nd link length: ');
 l3=input('Enter 3rd link length: ');
 theta1=input('\nEnter angle range of 1st link (Degrees): ');
 theta2=input('Enter angle range of 2nd link (Degrees): ');
 theta3=input('Enter angle range of 3rd link (Degrees): ');
 
 fprintf('Please Choose an Option From The Menu \n');
 cin =1;                
 while cin==1
 fprintf('[1]-Calculate DKPM\n')
 fprintf('[2]-Calculate IKPM\n')
 fprintf('[3]-Calculate Working Area\n')
 fprintf('[4]-Plot Working Area\n')
 fprintf('[5]-Generate straight line trajectory\n')
 fprintf('[6]-Robot Animation\n')
 
 option=input('Please Enter The Number Of The Option: ');
 
 if option == 1
     fprintf('DKPM Choosen\n');
     q1=input('Enter 1st link angle: ');
     while q1<theta1(1)|| q1>theta1(2)
        q1=input('Error! Angle out of link range. Plese re-enter 1st link angle: ');
     end
     q2=input('Enter 2nd link angle: ');
     while q2<theta2(1)|| q2>theta2(2)
        q2=input('Error! Angle out of link range. Plese re-enter 2nd link angle: ');
     end
     q3=input('Enter 3rd link angle: ');
     while q3<theta3(1)|| q3>theta3(2)
        q3=input('Error! Angle out of link range. Plese re-enter 3rd link angle: ');
     end
     q1=q1*pi/180;q2=q2*pi/180;q3=q3*pi/180;
     [x y phi]=DKPM(l1,l2,l3,q1,q2,q3);
     fprintf('X coordinate =%.2f\n',x)
     fprintf('Y coordinate =%.2f\n',y)
     fprintf('Sum of angles is =%.2f\n',phi)
 elseif option == 2
     fprintf('IKPM Choosen\n');
     x=input('Enter X coordinate of the final point: ');
     y=input('Enter Y coordinate of the final point: ');
     phi=input('Enter phi:')*pi/180;
     [q1 q2 q3]=IKPM(l1,l2,l3,x,y,phi);
     if q1<theta1(1) || q1>theta1(2) || q2<theta2(1) || q2>theta2(2) || q3<theta3(1) || q3>theta3(2)
         fprintf('Angle out of range! The position you specified cannot be reached.')
     else
        fprintf('1st link angle q1 = %.5f\n',q1*(180/pi));
        fprintf('2nd link angle q2 = %.5f\n',q2*(180/pi));
        fprintf('3rd link angle q3 = %.5f\n',q3*(180/pi));
     end
 elseif option == 3
     %Calculate Working Area
 elseif option == 4
    WorkingArea_plotter(l1,l2,l3,theta1,theta2,theta3);
 elseif option == 5
    fprintf('Trajectory planning\n')
    Xo=input('Enter initial position: ');
    Xf=input('Enter final position: ');
    phi=input('Enter phi: ')*pi/180;
    WorkingArea_plotter(l1,l2,l3,theta1,theta2,theta3);
    Theta=EndEffectorPathPlanning(l1,l2,l3,phi,Xo,Xf);
 elseif option == 6
      Animate(l1,l2,l3,theta1,theta2,theta3);
 else
     fprintf('Invalid Input \n');
 end
 cont=input('To continue enter 1\nTo terminate enter 0\n');
 if cont==0
     fprintf('Program Terminated!\n');
     cin=0;     
 elseif cont==1
     cin=1;
 else
     fprintf('Invalid Input\n');
     cont=input('To continue enter 1\nTo terminate enter 0\n');
 end    
 end
 