function F_norm(X0, gamma)
    tspan = [0 3];
    options = odeset();

    [t, X] = ode45(@ZnnRight_NCZNN, tspan, X0, options, gamma);
    
    for j = 1:length(t)
        T = t(j);
        A = MatrixA(T);
        B = MatrixB(T);
        x_cur = X(j,:);
        X_cur = reshape(x_cur,4,4);

        
        Err = A*X_cur-B;
        nerr(j) = norm(Err);
    end
    
    plot(t, nerr, 'LineWidth', 2);
    hold on;