function [S] = seven_bit_adder( A , B , Cin )
    Stemp = zeros(1,7);
    [Stemp(end) , C7] = FA( A(end) , B(end) , Cin );
    [Stemp(end-1) , C6] = FA( A(end-1) , B(end-1) , C7 );
    [Stemp(end-2) , C5] = FA( A(end-2) , B(end-2) , C6 );
    [Stemp(end-3) , C4] = FA( A(end-3) , B(end-3) , C5 );
    [Stemp(end-4) , C3] = FA( A(end-4) , B(end-4) , C4 );
    [Stemp(end-5) , C2] = FA( A(end-5) , B(end-5) , C3 );
    [Stemp(end-6) , Cout] = FA( A(end-6) , B(end-6) , C2 );
    S = Stemp;
end