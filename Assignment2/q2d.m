file = './Assign2_imgs/notch_pass_reject_filter/notch1.png';

image = imread(file);

im1 = image;
F = fft2(im1);
F = fftshift(F);

file = './Assign2_imgs/notch_pass_reject_filter/notch3.jpg';

if strcmp(file,'./Assign2_imgs/notch_pass_reject_filter/notch3.jpg')==1
    im1 = imread(file);
    im1 = imresize(im1,[253 256]);
    filter = ones(253,256,size(im1,3));
    F = fft2(im1);
    F = fftshift(F);
    Fs = abs(F);
    Fs = log(Fs+1);
    Fs = mat2gray(Fs);

    filter(121:131,1:90,:) = 0;
    filter(1:90,125:134,:) = 0;
    filter(170:253,125:134,:) = 0;
    filter(121:131,166:256,:) = 0;
    
    F2 = F.*filter;
    Fs2 = abs(F2);
    Fs2 = log(Fs2+1);
    Fs2 = mat2gray(Fs2);
    
    F2 = ifft2(ifftshift(F2));
    im2 = uint8(real(F2));
    figure;
    subplot(2,2,1);
    imshow(im1);
    subplot(2,2,2);
    imshow(im2);
    subplot(2,2,3);
    imshow(Fs);
    subplot(2,2,4);
    imshow(Fs2);
end


file = './Assign2_imgs/notch_pass_reject_filter/notch2.jpg';

if strcmp(file,'./Assign2_imgs/notch_pass_reject_filter/notch2.jpg')==1
    im1 = imread(file);
    F = fft2(im1);
    F = fftshift(F);
    
    Fs = abs(F);
    Fs = log(Fs+1);
    Fs = mat2gray(Fs);
    
    filter = ones(size(im1,1),size(im1,2),size(im1,3));

    filter(72:81,80:92,:) = 0;
    filter(82:98,13:31,:) = 0;
    filter(50:56,41:47,:) =0;
    filter(31:47,100:118,:) =0;
    
    F2 = F.*filter;
    Fs2 = abs(F2);
    Fs2 = log(Fs2+1);
    Fs2 = mat2gray(Fs2);
    
    F2 = ifft2(ifftshift(F2));
    im2 = uint8(real(F2));
    figure;
    subplot(2,2,1);
    imshow(im1);
    subplot(2,2,2);
    imshow(im2);
    subplot(2,2,3);
    imshow(Fs);
    subplot(2,2,4);
    imshow(Fs2);
    
end

file = './Assign2_imgs/notch_pass_reject_filter/notch1.png';

if strcmp(file,'./Assign2_imgs/notch_pass_reject_filter/notch1.png')==1
    im1 = imread(file);
    F = fft2(im1);
    F = fftshift(F);
    
    Fs = abs(F);
    Fs = log(Fs+1);
    Fs = mat2gray(Fs);
    
    filter = ones(size(im1,1),size(im1,2),size(im1,3));

    filter(72:88,10:147,:) = 0;
    filter(70:87,165:280,:) = 0;
    filter(47:89,128:148,:) = 0;
    filter(33:90,166:179,:) = 0;
    filter(19:91,156:165,:) = 0;
    filter(168:187,174:284,:) = 0;
    filter(167:250,177:194,:) = 0;
    filter(162:220,142:158,:) = 0;
    filter(171:187,11:156,:) = 0;
    filter(162:256,156:166,:) = 0;
    
    F2 = F.*filter;
    Fs2 = abs(F2);
    Fs2 = log(Fs2+1);
    Fs2 = mat2gray(Fs2);
    
    F2 = ifft2(ifftshift(F2));
    im2 = uint8(real(F2));
    figure;
    subplot(2,2,1);
    imshow(im1);
    subplot(2,2,2);
    imshow(im2);
    subplot(2,2,3);
    imshow(Fs);
    subplot(2,2,4);
    imshow(Fs2);
    
end
