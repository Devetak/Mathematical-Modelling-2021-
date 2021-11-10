% clean workspace
clear all;
close all;

% initialize constants
maxIt = 10000;
r0 = 1;
g = 9.81;
m = 10;
e = 0.9;
eps = 0.1;
h = 0.001;
kq2 = 0;
rCA = 0;
v0 = 0;

% uncharged ball
[r, v, totEn] = calculateEuler(r0, v0, m, g, e, eps, kq2, rCA, h, maxIt);
plotResults(h, maxIt, r, v, totEn, "");

% weakly repelled ball
kq2 = 0.1;
[r, v, totEn] = calculateEuler(r0, v0, m, g, e, eps, kq2, rCA, h, maxIt);
plotResults(h, maxIt, r, v, totEn, "weakly repelled");

% strongly repelled ball
kq2 = 200;
maxIt = 100000;
[r, v, totEn] = calculateEuler(r0, v0, m, g, e, eps, kq2, rCA, h, maxIt);
plotResults(h, maxIt, r, v, totEn, "strongly repelled");


% attracted ball
kq2 = - 100;
maxIt = 10000;
[r, v, totEn] = calculateEuler(r0, v0, m, g, e, eps, kq2, rCA, h, maxIt);
plotResults(h, maxIt, r, v, totEn, "attracted");

% resisted ball
kq2 = 0;
maxIt = 10000;
rCA = 0.6;
[r, v, totEn] = calculateEuler(r0, v0, m, g, e, eps, kq2, rCA, h, maxIt);
plotResults(h, maxIt, r, v, totEn, "resisted");

% repelled resisted ball
kq2 = 100;
maxIt = 100000;
rCA = 0.6;
[r, v, totEn] = calculateEuler(r0, v0, m, g, e, eps, kq2, rCA, h, maxIt);
plotResults(h, maxIt, r, v, totEn, "repelled and resisted");

