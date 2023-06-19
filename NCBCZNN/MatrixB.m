function B = MatrixB(t)
    B = [sin(t), cos(t), 0.5*sin(2*t), cos(2*t);
         cos(t), sin(t), sin(t), cos(t);
         0.5*sin(2*t), cos(t), sin(t), 0.5*sin(2*t);
         cos(2*t), 0.5*sin(2*t), cos(t), sin(t)];

