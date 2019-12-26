

clc

for j=0:1
clear all
global N t0 tf 
t0 = 0;
tf = 9;

N  = 10;
h  = (tf-t0)/(N-1);

spec0 = [];
spec0(1:10*N,1) = 1;

spec0;
size(spec0)
ub = [];
lb = [];
ub(1:7*N) = Inf;
ub(7*N+1:10*N) = 1;
lb(1:7*N) = -Inf;
lb(7*N+1:10*N) = -1;

options = optimset('TolX',1e-15,'TolFun',1e-4,'Display','Iter','Algorithm','sqp','MaxFunEvals',10000000);
[paropt,fval,exitflag,output,lambda]=fmincon('col_cost',spec0,[],[],[],[],lb,ub,'col_con',options);
[cost,finTraj] = col_cost(paropt);
tf = cost
h  = (cost)/(N-1);
finTraj
figure(1);plot(1:1:N-1,finTraj(1:N-1,1),'b-', 'linewidth',3);xlabel('Time (sec)','fontsize',16);ylabel('x1','fontsize',16);set(gca,'fontsize',16)
figure(2);plot(1:1:N-1,finTraj(1:N-1,2),'b-','linewidth',3);xlabel('Time (sec)','fontsize',16);ylabel('x2','fontsize',16);set(gca,'fontsize',16)
figure(3);plot(1:1:N-1,finTraj(1:N-1,3),'b-','linewidth',3); xlabel('Time (sec)','fontsize',16);ylabel('x3','fontsize',16);set(gca,'fontsize',16)
figure(4);plot(1:1:N-1,finTraj(1:N-1,4),'b-', 'linewidth',3);xlabel('Time (sec)','fontsize',16);ylabel('x4','fontsize',16);set(gca,'fontsize',16)
figure(5);plot(1:1:N-1,finTraj(1:N-1,5),'b-','linewidth',3);xlabel('Time (sec)','fontsize',16);ylabel('x5','fontsize',16);set(gca,'fontsize',16)
figure(6);plot(1:1:N-1,finTraj(1:N-1,6),'b-','linewidth',3); xlabel('Time (sec)','fontsize',16);ylabel('x6','fontsize',16);set(gca,'fontsize',16)
figure(7);plot(1:1:N-1,finTraj(1:N-1,8),'b-', 'linewidth',3);xlabel('Time (sec)','fontsize',16);ylabel('u1','fontsize',16);set(gca,'fontsize',16)
figure(8);plot(1:1:N-1,finTraj(1:N-1,9),'b-','linewidth',3);xlabel('Time (sec)','fontsize',16);ylabel('u2','fontsize',16);set(gca,'fontsize',16)
figure(9);plot(1:1:N-1,finTraj(1:N-1,10),'b-','linewidth',3); xlabel('Time (sec)','fontsize',16);ylabel('u3','fontsize',16);set(gca,'fontsize',16)
end



