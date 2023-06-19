function output = OZNNCore(t, x, G, b)
    gamma = 20;
    
    % AFMnonconvex
    delta = -pinv(G) * (gamma * AFMnonconvex(G * x - b)) ;
    
    output = delta;
    t
end
    