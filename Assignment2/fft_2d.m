function output = fft_2d(var)
    [N,M] = size(var);
    if N==1
        output = var;
    else
        term1 = fft_2d(var(1:2:end,1:2:end));
        term2 = fft_2d(var(1:2:end,2:2:end));
        term3 = fft_2d(var(2:2:end,1:2:end));
        term4 = fft_2d(var(2:2:end,2:2:end));
        
        q1 = exp(-2*pi*j*(repmat((0:N/2-1)',1,N/2)')./N);
        q2 = exp(-2*pi*j*(repmat((0:N/2-1),N/2,1)')./N);

        quad_1 = term1 + term2.*q1 + term3.*q2 + term4.*(q1.*q2);
        quad_2 = term1 - term2.*q1 + term3.*q2 - term4.*(q1.*q2);
        quad_3 = term1 + term2.*q1 - term3.*q2 - term4.*(q1.*q2);
        quad_4 = term1 - term2.*q1 - term3.*q2 + term4.*(q1.*q2);
        output = [quad_1 quad_2;quad_3 quad_4];
    end
end
