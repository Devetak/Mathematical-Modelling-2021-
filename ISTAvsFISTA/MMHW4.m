clear all;
close all;

% dimensions of A
m = 20;
n = 30;

% initialize variables
A = sprandn(m,n,0.5);
x0 = randn(n,1);
b = randn(m,1);
l = 0.1;

% initialize arrays for plots
s1 = zeros(20,30);
s2 = zeros(20,30);
ds1 = zeros(20,1);
ds2 = zeros(20,1);

% exact solution
x = fista(A,b,l,1000);

% main loop
for i=1:20
    s1(i,:) = ista(A, b, l, i*25);
    s2(i,:) = fista(A,b,l, i*25);
    err1(i) = norm(s1(i,:) - x);
    err2(i) = norm(s2(i,:) - x);
    ds1(i) = norm(A*(s1(i,:))' - b);
    ns1(i) = norm(s1(i,:),1);
    ds2(i) = norm(A*(s2(i,:))' - b);    
    ns2(i) = norm(s2(i,:),1);
    ps1(i) = ds1(i) + l * ns1(i);
    ps2(i) = ds2(i) + l * ns2(i);
end

% initialize grid
grid = [25:25:500];

% plots
plot(grid,ds1','-');
hold on;
plot(grid,ds2','-');
legend('ISTA','FISTA');

title('ISTA vs FISTA (for \mu=0.1)')
xlabel('Iteration Count')
ylabel('||Ax_k -b||_2')

hold off;

figure

plot(grid,ns1','-');
hold on;
plot(grid,ns2','-');
legend('ISTA','FISTA');

title('ISTA vs FISTA (for \mu=0.1)')
xlabel('Iteration Count')
ylabel('||x_k||_1')

hold off;


figure

plot(grid,ps1','-');
hold on;
plot(grid,ps2','-');
legend('ISTA','FISTA');

title('ISTA vs FISTA (for \mu=0.1)')
xlabel('Iteration Count')
ylabel('\phi(x)')

hold off;

figure

plot(grid,err1','-');
hold on;
plot(grid,err2','-');
legend('ISTA','FISTA');

title('ISTA vs FISTA (for \mu=0.1)')
xlabel('Iteration Count')
ylabel('err(x)')

hold off;


figure

loglog(grid,ps1','-');
hold on;
loglog(grid,ps2','-');
legend('ISTA','FISTA');

title('ISTA vs FISTA (for \mu=0.1)')
xlabel('log(Iteration Count)')
ylabel('log(err(x))')

hold off;

