function dotX = ZnnRight_NCZNN(t,X, gamma)
    A = MatrixA(t); 
    DotA = DiffA(t);
    B = MatrixB(t); 
    DotB = DiffB(t);
    x_cur = reshape(X, 4, 4);

%     ³£ÊýÔëÉù
      noise_con = [0.25,0.25,0.25,0.25; 0.25,0.25,0.25,0.25; 
                   0.25,0.25,0.25,0.25;0.25,0.25,0.25,0.25];
            

%     Ëæ»úÔëÉù
%      noise_rand = 0.1*rand(4,4)+0.1;

%       dotX = pinv(A)*(-DotA*x_cur+DotB-gamma*AFMnonconvex(A*x_cur-B)+noise_con);
        dotX = pinv(A)*(-DotA*x_cur+DotB-gamma*AFMnonconvex(A*x_cur-B));
        dotX = reshape(dotX, 16,1);
    t
end