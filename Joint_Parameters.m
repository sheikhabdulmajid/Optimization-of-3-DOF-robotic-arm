 clc
clear all
syms L1 L3 q1 d2 q3
format short
digits(4)

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
T04_1=T01*T12*T23*T34;
T04=vpa(T04_1) 
