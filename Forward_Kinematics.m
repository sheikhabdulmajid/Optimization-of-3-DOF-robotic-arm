clc
clear all
format short
L1=0.8;L3=0.8;
q1=0;d2=2;q3=0;

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
T04=T01*T12*T23*T34


axis([-5 5 -5 5]);

Ax1 = [T01(1,4),T02(1,4)];
Ay1 = [T01(2,4),T02(2,4)];
Ax2 = [T02(1,4),T03(1,4)];
Ay2 = [T02(2,4),T03(2,4)];
Ax3 = [T03(1,4),T04(1,4)];
Ay3 = [T03(2,4),T04(2,4)];
Ax4 = [-.1,.1];
Ay4 =  [0,0];
p1  = line(Ax1,Ay1,'LineWidth',[3],'Color','k');
p2  = line(Ax2,Ay2,'LineWidth',[3],'Color','M');
p3  = line(Ax3,Ay3,'LineWidth',[3],'Color','R');
p4  = line(Ax4,Ay4,'LineWidth',[12],'Color','B');

drawnow
xlabel('x (m)')
ylabel('y (m)')  

pause()

  for t=0:.01:1
      q1=pi/3*t;
      d2=2+3*t;
      q3=pi/3*t;
      
      q=q1;d=0;a=0;alpha=0; %for i=1
      T01=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
      q=0;d=d2;a=L1;alpha=pi/2; %for i=2
      T12=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
      q=q3;d=0;a=0;alpha=- pi/2; %for i=3
      T23=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
      q=0;a=L3;d=0;alpha=0; %for i=4
      T34=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
      
      T02=T01*T12;
      T03=T01*T12*T23;
      T04=T01*T12*T23*T34
      
      Ax1 = [T01(1,4),T02(1,4)];
      Ay1 = [T01(2,4),T02(2,4)];
      Ax2 = [T02(1,4),T03(1,4)];
      Ay2 = [T02(2,4),T03(2,4)];
      Ax3 = [T03(1,4),T04(1,4)];
      Ay3 = [T03(2,4),T04(2,4)];
      Ax4 = [-.1,.1];
      Ay4 =  [0,0];
      
      set(p1,'X', Ax1, 'Y',Ay1)
      set(p2,'X', Ax2, 'Y',Ay2)
      set(p3,'X', Ax3, 'Y',Ay3)
      set(p4,'X', Ax4, 'Y',Ay4)
      set(p4,'X', Ax4, 'Y',Ay4)
      
      drawnow
      
      pause(.01)
  end
