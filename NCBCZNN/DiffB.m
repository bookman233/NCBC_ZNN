function DotB=DiffB(t)
    syms s; 
    B = MatrixB(s);
    Dot = diff(B); 
    s = t; 
    DotB = eval(Dot);