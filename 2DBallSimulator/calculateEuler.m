% input : initial conditions r0, v0
%       : physical constants m, g, e, eps, kq2, rCA
%       : simulation constants h, maxIt
% output : r, v, totEn representing the dynamics of the position, velocity
% and total energy of the ball
function [r, v, totEn] = calculateEuler(r0, v0, m, g, e, eps, kq2, rCA, h, maxIt)

    % initialize storage
    r = zeros(maxIt, 1);
    v = zeros(maxIt, 1);
    b = zeros(maxIt, 1);
    totEn = zeros(maxIt, 1);

    % first step
    r(1) = r0;
    v(1) = v0;
    b(1) = - v(1) + h * g / (1 + e) - h * kq2 / ((1 + e) * m * power(r(1) + eps, 2)) + h * sign(v(1)) * rCA * power(v(1), 2) / 2;
    totEn(1) = m * power(v(1), 2) / 2 + m * g * r(1) + kq2 / (r(1) + eps);

    % iteration 
    for i=2:maxIt
        v(i) = - e * v(i-1) + (1 + e) * proxT(r(i-1), - b(i-1));
        r(i) = h * v(i) + r(i-1);
        b(i) = - v(i) + h *( g / (1 + e) - kq2 /((1 + e)  * m * power(r(i) + eps, 2)) + sign(v(i)) * rCA * power(v(i),2) / 2);
        totEn(i) =  m * power(v(i), 2) / 2 + m * g * r(i) + kq2 / (r(i) + eps);
    end

end