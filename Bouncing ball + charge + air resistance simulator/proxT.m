% input : a point q and a point b
% output : the closes point from the tangent cone T_R+(q) to b
function [p] = proxT(q,b)
    if q > 0
        p = b;
        return;
    end
    p = max( b, 0);
    return
end