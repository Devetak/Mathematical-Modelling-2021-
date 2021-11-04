function x = fista(A, b, l, maxit)
    % fista algorithm
    % compute maxit number of fista steps
    x = 0*A'*b;
    x = rand(size(x));
    alpha = max(eigs(A'*A));
    T = l/(alpha);
    t = 1;
    y = x;
    for k = 1:maxit
        xp = x;
        x = soft(y - (A'*(A*y - b))/alpha, T);
        tp = t;
        t = (1 + sqrt(1 + 4*t*t)/2);
        y = xp + ((tp-1)/t)*(x - xp);
    end
end