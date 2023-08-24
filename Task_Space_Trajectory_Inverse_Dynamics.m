clc;clear all;
format short
m1 = 1; 
m2 = 1; 
m3 =1;
g = 9.81;
L1=0.8;L3=0.8;
PHIH = pi/2;
%start point
xo=1.5;
yo=2.0;
vxo=0;vyo=0;

   %via point
xm=2.5;
ym=2.0;
vxm=0;
vym=0;
   
   %goal pint
xf=2.5;
yf=2.5;
 vfx=0;
 vfy=0;

xi = xo-L3*cos(PHIH);
yi = yo-L3*sin(PHIH);
d2=sqrt(xi^2+yi^2-L1^2);
q1=2*atan2((d2+sqrt((d2^2)-(L1^2)-(xi^2))),(L1+xi));
q3=PHIH-q1;

q=q1;d=0;a=0;alpha=0; %for i=1
T01=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=0;d=d2;a=L1;alpha=pi/2; %for i=2
T12=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=q3;d=0;a=0;alpha=-pi/2; %for i=3
T23=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=0;a=L3;d=0;alpha=0; %for i=4
T34=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
T02=T01*T12;
T03=T01*T12*T23;
T04=T01*T12*T23*T34;

axis([-2 3 -2 3]);

  Ax1 = [T01(1,4),T02(1,4)];
  Ay1 = [T01(2,4),T02(2,4)];
  Ax2 = [T02(1,4),T03(1,4)];
  Ay2 = [T02(2,4),T03(2,4)];
  Ax3 = [T03(1,4),T04(1,4)];
  Ay3 = [T03(2,4),T04(2,4)];
  Ax4 = [-.1,.1];
  Ay4=  [0,0];
  
  p1  = line(Ax1,Ay1,'LineWidth',[3],'Color','k');
  p2  = line(Ax2,Ay2,'LineWidth',[3],'Color','M');
  p3  = line(Ax3,Ay3,'LineWidth',[3],'Color','R');
  p4  = line(Ax4,Ay4,'LineWidth',[3],'Color','B');

drawnow
tf1=1;
tf2=2;
% for x

A=[1 0 0 0;1 tf1 tf1^2 tf1^3;0 1 0 0;0 1 2*tf1 3*tf1^2];
B=[xo xm vxm 0]';
cof=inv(A)*B;
a1o=cof(1,1);a11=cof(2,1);a12=cof(3,1);a13=cof(4,1);
%for y
A=[1 0 0 0;1 tf1 tf1^2 tf1^3;0 1 0 0;0 1 2*tf1 3*tf1^2];
B=[yo ym 0 0]';
cof=inv(A)*B;
b1o=cof(1,1);b11=cof(2,1);b12=cof(3,1);b13=cof(4,1);
%for x
A=[1 tf1 tf1^2 tf1^3;1 tf2 tf2^2 tf2^3;0 1 2*tf1 3*tf1^2;0 1 2*tf2 3*tf2^2];
B=[xm xf 0 0]';
cof=inv(A)*B;
a2o=cof(1,1);a21=cof(2,1);a22=cof(3,1);a23=cof(4,1);
%for y
A=[1 tf1 tf1^2 tf1^3;1 tf2 tf2^2 tf2^3;0 1 2*tf1 3*tf1^2;0 1 2*tf2 3*tf2^2];
B=[ym yf vym 0]';
cof=inv(A)*B;
b2o=cof(1,1);b21=cof(2,1);b22=cof(3,1);b23=cof(4,1);

pause()
n=1;
for t=0:.01:1.99
    time(n) = t;
    if t<=1
x=a1o+a11*t+a12*t^2+a13*t^3;
y=b1o+b11*t+b12*t^2+b13*t^3;
    else
x=a2o+a21*t+a22*t^2+a23*t^3;
y=b2o+b21*t+b22*t^2+b23*t^3;
    end
xi = x-L3*cos(PHIH);
yi = y-L3*sin(PHIH);
d2=sqrt(xi^2+yi^2-L1^2);
q1=2*atan2((d2+sqrt((d2^2)-(L1^2)-(xi^2))),(L1+xi));
q3=PHIH-q1;
q1a(n) = q1;
d2a(n) = d2;
q3a(n) = q3;
   if t<=1
vq1(n) = 0.0057*t.^2+0.0354*t-0.028;
aq1(n) = 0.0114*t+0.0354;
vd2(n) = -5.5023*t.^2+5.5280*t-0.0539;
ad2(n) = -11.0046*t+5.5280;
vq3(n) = -0.0057*t.^2+0.0354*t+0.0678
aq3(n) = -0.0114*t+0.0354;

    else
vq1(n) = -1.5159*t.^2+4.2712*t-2.5556;
aq1(n) = -3.0318*t+4.2712;
vd2(n) = -1.5624*t.^2+4.7596*t-3.2332;
ad2(n) = -3.1248*t+4.7596;
vq3(n) = 1.4586*t.^2-4.0676*t+2.3841;
aq3(n) = 2.9172*t-4.0676;
    end

M = [1/3*m1*L1^2+m2*L1^2+m2*d2a(n)^2+4*m2*L1*sin(q1a(n))*cos(q1a(n))*d2a(n)+m3*(L1^2)+m3*d2a(n)^2+((L3^3)*m3/3)-m3*L3*sin(q1a(n))*d2a(n) (m2*L1*(sin(q1a(n))^2)-(m2*L1*(cos(q1a(n))^2)-m3*L1)) m3/3*(L3)^3; m2*L1*sin(q1a(n))^2-(m2*L1*cos(q1a(n))^2)-m3*L1 (m2+m3) 0;(m3*(L3^3)/3)-0.5*m3*L3*d2*sin(aq3(n)) 0 (m3*(L3^3)/3)-0.5*m3*L3*sin(q1a(n))*d2a(n)]; 
V = [(2*m2*vq1(n)*vd2(n))+(8*m2*L1*sin(q1a(n))*cos(q1a(n))*vd2(n)*vq1(n))+4*m2*L1*(cos(q1a(n))^2)*d2a(n)*(vq1(n)^2)-4*m2*L1*(sin(q1a(n))^2)*d2a(n)*(vq1(n)^2)+(2*m3*d2a(n)*vd2(n)*vq1(n))-(m3*L3*cos(q1a(n))*d2a(n)*vq1(n)*vq3(n))-(m3*L3*sin(q1a(n))*vd2(n)*(vq1(n)+0.5*vq3(n))-0.5*m3*L3*cos(q3a(n))*d2a(n)*vq3(n)^2); 4*m2*L1*sin(q1a(n))*cos(q1a(n))*vq1(n)^2; -0.5*m3*L3*cos(q1a(n))*d2a(n)*vq1(n)*vq3(n)-0.5*m3*L3*sin(q1a(n))*d2a(n)*vd2(n)*vq1(n)];
G = [0.5*m1*L1*g*cos(q1a(n))+m2*g*L1*cos(q1a(n))+m2*g*d2a(n)*sin(q1a(n))+m3*g*L1*cos(q1a(n))+m3*g*d2a(n)*sin(q1a(n))+0.5*m3*g*L3*cos(q1a(n)+q3a(n)); m2*g*cos(q1a(n))-m3*g*cos(q1a(n)); 0.5*m3*g*L3*cos(q1a(n)+q3a(n))]

T=M*[aq1(n);ad2(n);aq3(n)]+V+G;
T1(n)=T(1,1);
T2(n)=T(2,1);
T3(n)=T(3,1);
   
Xp = L3*(cos(q1+q3))+L1*cos(q1)+d2*sin(q1);
Yp = L3*(sin(q1+q3))+L1*sin(q1)-d2*cos(q1);
q=q1;d=0;a=0;alpha=0; %for i=1
T01=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=0;d=d2;a=L1;alpha=pi/2; %for i=2
T12=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=q3;d=0;a=0;alpha=-pi/2; %for i=3
T23=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=0;a=L3;d=0;alpha=0; %for i=4
T34=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
T02=T01*T12;
T03=T01*T12*T23;
T04=T01*T12*T23*T34;

  Ax1 = [T01(1,4),T02(1,4)];
  Ay1 = [T01(2,4),T02(2,4)];
  Ax2 = [T02(1,4),T03(1,4)];
  Ay2 = [T02(2,4),T03(2,4)];
  Ax3 = [T03(1,4),T04(1,4)];
  Ay3 = [T03(2,4),T04(2,4)];
  Ax4 = [-.1,.1];
  Ay4=  [0,0];

  set(p1,'X', Ax1, 'Y',Ay1)
  set(p2,'X', Ax2, 'Y',Ay2)
  set(p3,'X', Ax3, 'Y',Ay3)
  set(p4,'X', Ax4, 'Y',Ay4)

  o1(n,1)=Xp;
  o2(n,1)=Yp;


  drawnow
  pause(.01)
  n=n+1;
  end
hold on
plot(o1(:,1),o2(:,1))
xx = time';
yy = q1a';
zz = d2a';
aa = q3a'; 
