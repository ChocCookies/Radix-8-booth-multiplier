function [three_S] = approx_recoding_adder2( A )

    A = int32(A);
    three_S = int32(0);
    temp(16) = bitget(A,1,'int32');
    [C1,temp(14),temp(15)] = approx_2_bit_adder( bitget(A,4,'int32') , bitget(A,3,'int32') , bitget(A,2,'int32') , 0 ) ;
    [C2,temp(12),temp(13)] = approx_2_bit_adder( bitget(A,6,'int32') , bitget(A,5,'int32') , bitget(A,4,'int32') , C1 ) ;
    [C3,temp(10),temp(11)] = approx_2_bit_adder( bitget(A,8,'int32') , bitget(A,7,'int32') , bitget(A,6,'int32') , C2 ) ;
    [C4,temp(8) ,temp(9)] = approx_2_bit_adder( bitget(A,10,'int32') , bitget(A,9,'int32') , bitget(A,8,'int32') , C3 ) ;
    
    SBA_A = fliplr(bitget(A,10:16,'int32'));
    SBA_B = fliplr(bitget(A,9:15,'int32'));
    [temp(1:7)] = seven_bit_adder( SBA_A ,SBA_B , C4 );
    
    for i = 1:16
        three_S = bitset(three_S , i , temp(16 - i + 1)); 
    end
    
end