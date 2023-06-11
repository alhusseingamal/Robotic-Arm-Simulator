function[x,y,phi]=DKPM(l1,l2,l3,q1,q2,q3)
                    x=l1*cos(q1)+l2*cos(q2+q1)+l3*cos(q3+q2+q1);
                    y=l1*sin(q1)+l2*sin(q2+q1)+l3*sin(q3+q2+q1);
                    phi=(q1+q2+q3)*180/pi;
end