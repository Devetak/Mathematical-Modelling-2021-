function x = ista(A, b, l, maxit)
    % ista algorithm
    % compute maxit number of ista steps
    x = 0*A'*b;
    x = rand(size(x));
    alpha = 2*max(eigs(A'*A));
    T = l/(alpha);
    for k = 1:maxit
        x = soft(x - (A'*(A*x - b))/alpha, T);
    end
end