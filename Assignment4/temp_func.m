filename = 'Uncompressed_01.bmp';
dct_error = []
dft_error = []
dwt_error = []
temp = []
for c = 1:20
    [tmp1,tmp2,tmp3] = q2(filename,c);
    dct_error = [dct_error tmp1];
    dft_error = [dft_error tmp2];
    dwt_error = [dwt_error tmp3];
    temp = [temp c];
end

figure;hold on
a1 = plot(temp(1,:),dct_error(1,:));
a2 = plot(temp(1,:),dft_error(1,:));
a3 = plot(temp(1,:),dwt_error(1,:));

legend('y = DCT-Error','y = DFT-Error','y = Wavelet-Error');