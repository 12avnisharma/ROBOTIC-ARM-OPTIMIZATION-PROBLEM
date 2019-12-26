function [Cineua,Cequa] = col_con(spec)
% constraint function - used with the collocation method

global N tf t

Cineua   = [];
Cequa   = [];

h    = (tf)/(N-1);
X    = spec(1:7*N);
U    = spec(7*N+1:end);
for (i=1:1:N-1),
    
    xi    = spec(7*(i-1)+1:7*i);
    xip1  = spec(7*(i)+1:7*(i+1));
    
    ui    = U(3*(i-1)+1:3*i);
    uip1  = U(3*i+1:3*(i+1));
    
    fi     = robot_arm_col(xi,ui);
    fip1   = robot_arm_col(xip1,uip1);
    
    fistar = robot_arm_col(1/2*(xi+xip1)+h/8*(fi-fip1),1/2*(ui+uip1));
%     
    Cequa(7*(i-1)+1:7*i) = -3/2*(xi - xip1)-h/4*(fi+fip1); % -h*fistar; CHANGE HERE
    
end;

x0 = [4.5;0;0;0;pi/4;0;10;];
Cequa = Cequa(:);
Cequa = [-Cequa;...
      -x0 + spec(1:7); ...
      spec(7*(N-1)+1) - 4.5;spec(7*(N-1)+2);spec(7*(N-1)+3) - 2*pi/3; spec(7*(N-1)+4) ; ...
      spec(7*(N-1)+5) - pi/4; spec(7*(N-1)+6); spec(7*(N-1) + 7); abs(spec(7*N+1:7*N+3))-1  ];   %par(7*N+1:end)<=1;  0.05*(par(7*N+1:end)-1); abs(par(7*N+1:7*N+3))<=1

return; 
