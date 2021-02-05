function [ Cout , Si_1 , Si ] =  approx_2_bit_adder( y_1 , y , ym_1 , cin )
    Cout = y;
    Si = xor( cin , xor ( y , ym_1 ) );
    Si_1 = y_1;
end




