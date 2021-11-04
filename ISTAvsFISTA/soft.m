function y = soft(x,l)
    % soft shrincage
    % compute shrinkage of g(x) = l*||x||_1
    y = sign(x).*( max(0, abs(x)-l) );
end