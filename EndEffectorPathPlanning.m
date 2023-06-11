function[Theta]=EndEffectorPathPlanning(l1,l2,l3,phi,Xo,Xf)    
    ti=input('Enter initial time: ');%usually set to 0
    tf=input('Enter final time: ');%usually set to 1
    t=linspace(ti,tf,11);
    Xt=Xf-Xo;
    a5=6*Xt;
    a4=-15*Xt;
    a3=10*Xt;
    ao=Xo;
    for i=1:11
        td=(t(i)-ti)/(tf-ti);
        X(i,1)=a5(1)*td^5+a4(1)*td^4+a3(1)*td^3+ao(1);
        X(i,2)=a5(2)*td^5+a4(2)*td^4+a3(2)*td^3+ao(2);
    end
    for i=1:length(X)
        [Theta(i,1),Theta(i,2),Theta(i,3)]=IKPM(l1,l2,l3,X(i,1),X(i,2),phi);
    end
    pause(2);
    generateTrajectory(l1,l2,l3,Theta);
end