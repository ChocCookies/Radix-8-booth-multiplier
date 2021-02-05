function [S,C] = FA( A , B ,  Cin )
    S = xor(Cin,xor(A,B));
    C = or(and(A,B),or(and(B,Cin),and(A,Cin)));
end