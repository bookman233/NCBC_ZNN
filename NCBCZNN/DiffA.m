function DotA=DiffA(t)
    syms s; 
    A = MatrixA(s);
    Dot = diff(A); 
    s = t; 
    DotA = eval(Dot);