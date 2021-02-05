function [result] = approx_booth_multiplier_radix_8(num_1 , num_2)

   	result = int32(0);
	num_1 = int32(num_1);
	num_2 = int32(num_2);
	lb_0 = 0;
    
	for index=1:5
        
		lb_1 = bitget(num_1,bin_index(0),'int32');
		lb_2 = bitget(num_1,bin_index(1),'int32');
        	lb_3 = bitget(num_1,bin_index(2),'int32');

		if (lb_3==0 && lb_2==0 && lb_1==0 && lb_0==1) || ( lb_3==0 && lb_2==0 && lb_1==1 && lb_0==0) 
			result = result + bitshift(num_2,16);
		elseif(lb_3==0 && lb_2==0 && lb_1==1 && lb_0==1) || ( lb_3==0 && lb_2==1 && lb_1==0 && lb_0==0)
		    	result = result + bitshift(num_2,17);
		elseif(lb_3==0 && lb_2==1 && lb_1==0 && lb_0==1) || ( lb_3==0 && lb_2==1 && lb_1==1 && lb_0==0)
		   	result = result + approx_recoding_adder2(num_2);
		elseif (lb_3==0 && lb_2==1 && lb_1==1 && lb_0==1)
			result = result + bitshift(num_2,18);
		elseif (lb_3==1 && lb_2==0 && lb_1==0 && lb_0==0)
		        result = result - bitshift(num_2,18);
		elseif(lb_3==1 && lb_2==0 && lb_1==0 && lb_0==1) || ( lb_3==1 && lb_2==0 && lb_1==1 && lb_0==0)
			result = result - approx_recoding_adder2(num_2);
		elseif(lb_3==1 && lb_2==0 && lb_1==1 && lb_0==1) || ( lb_3==1 && lb_2==1 && lb_1==0 && lb_0==0)
			result = result - bitshift(num_2,17);
		elseif(lb_3==1 && lb_2==1 && lb_1==0 && lb_0==1) || ( lb_3==1 && lb_2==1 && lb_1==1 && lb_0==0)
			result = result - bitshift(num_2,16);
        	end
		
		lb_0 = lb_3;
		num_1 = bitshift(num_1,-3);
		result = bitshift(result,-3);
    	end
    result = bitshift(result,-1);
end
