function[q1,q2,q3]=IKPM(l1,l2,l3,x,y,phi)
                    wx = x- l3*cos(phi);
                    wy = y- l3*sin(phi);
                    q2=acos(((wx^2)+(wy^2)-(l1^2)-(l2^2))/(2*l1*l2));
                    cth2=cos(q2);
                    d=(l1^2)+(l2^2)+(2*l1*l2*cth2);
                    cth1=((l1*wx)+(l2*wx*cos(q2))+(l2*wy*sin(q2)))/d;
                    sth1=(((l1+l2*cos(q2))*wy)-(l2*sin(q2)*wx))/d;
                    if((cth1>0)&& (sth1>0))
                        q1= atan(abs(sth1)/abs(cth1));
                    elseif((cth1>0)&& (sth1<0))
                        q1 =2*pi - atan(abs(sth1)/abs(cth1));
                    elseif((cth1<0)&& (sth1>0))
                        q1 =pi - atan(abs(sth1)/abs(cth1));
                    elseif((cth1<0)&& (sth1<0))
                        q1 =pi + atan(abs(sth1)/abs(cth1));
                    end
                    q3 = phi - q1 - q2;
end