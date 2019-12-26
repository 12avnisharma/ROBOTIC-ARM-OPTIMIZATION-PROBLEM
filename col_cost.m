function [cost,finTraj] = col_cost(spec)

global N 
% 
X    = spec(1:7*N);
U    = spec(7*N+1:end);

cost = 0;
for (i=1:1:N)
    
    ui    = U(3*(i-1)+1: 3*i);    
    xi    = X(7*(i-1)+1:7*i);
    cost  = xi(7);
    finTraj(i,:) = [xi(:)',ui(:)'];
    
end

return;
