function[]=Animate(l1,l2,l3,theta1,theta2,theta3)
clf
Z=[-20 20];
plot(Z,20);
grid ON;
hold on;
O=[0;0;0;1];
M=linspace(theta1(1)*pi/180,theta1(2)*pi/180,100);
N=linspace(theta2(1)*pi/180,theta2(2)*pi/180,100);
K=linspace(theta3(1)*pi/180,theta3(2)*pi/180,100);
i=1;
Cx=zeros(1,1);
Cy=zeros(1,1);
for a=1:100
    [A1,B1,C1]=Animate2(M(a),N(a),K(a),l1,l2,l3);
    x=[O(1) A1(1) B1(1) C1(1)];
    y=[ O(2) A1(2) B1(2) C1(2)];
    Cx(i)=C1(1);
    Cy(i)=C1(2);
    i=i+1;
    Plot=plot(x,y,'r','LineWidth',4);
    title(' Animation ');
    %plot(Cx,Cy,'w','LineWidth',3);
    pause(0.075);
    delete(Plot);
end
plot(x,y,'r','LineWidth',3)
end






