function xdot = robot_arm_col(x,u)


%States
x1        = x(1);
x2        = x(2);
x3        = x(3);
x4        = x(4);
x5        = x(5);
x6        = x(6);
x7        = x(7);
%x7 = tf
L         = 5;

u1        = u(1);
u2        = u(2);
u3        = u(3);

%state  equations
x1dot     = x2;
x2dot     = u1/L;
x3dot     = x4;
x4dot     = 3*u2/(((L-x1)^3+x1^3)*(sin(x5))^2);
x5dot     = x6;
x6dot     = 3*u3/((L-x1)^3+x1^3);
x7dot     = 0;

xdot      = x7*[x1dot,x2dot,x3dot,x4dot,x5dot,x6dot,x7dot]';

return;
