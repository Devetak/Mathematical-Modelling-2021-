% input : initial conditions r0, v0
%       : physical constants m, g, e, eps, kq2, rCA
%       : simulation constants h, maxIt
% output : r, v, totEn representing the dynamics of the position, velocity
% and total energy of the ball
function [r, v, totEn] = calculateEuler(r0,v0, m, g, e, eps, kq2, rCA, h, maxIt)

    % initialize storage
    r = zeros(maxIt, 1);
    v = zeros(maxIt, 1);
    b = zeros(maxIt, 1);
    totEn = zeros(maxIt, 1);

    % first step
    r(1) = r0;
    v(1) = v0;
    b(1) = calculateUpdate(r(1), v(1), m, g, e, eps, kq2, rCA, h);
    totEn(1) = calculateEnergy(r(1), v(1), m, g, eps, kq2);

    % iteration 
    for i=2:maxIt
        v(i) = - e * v(i-1) + (1 + e) * proxT(r(i-1), - b(i-1));
        r(i) = h * v(i) + r(i-1);
        b(i) = calculateUpdate(r(i), v(i), m, g, e, eps, kq2, rCA, h);
        totEn(i) =  calculateEnergy(r(i), v(i), m, g, eps, kq2);
    end

end


% input : current conditions r, v
%       : physical constants m, g, e, eps, kq2, rCA
%       : simulation constants h
% output : b update of the new velocity
function b = calculateUpdate(r, v, m, g, e, eps, kq2, rCA, h)
    b = - v + h *( g / (1 + e) - kq2 /((1 + e)  * m * power(r + eps, 2)) + sign(v) * rCA * power(v,2) / 2);
end

% input : current conditions r, v
%       : physical constants m, g, eps, kq2
% output : total energy avaiable for the ball
function e = calculateEnergy(r, v, m, g, eps, kq2)
    e = m * power(v, 2) / 2 + m * g * r + kq2 / (r + eps) ;
end
