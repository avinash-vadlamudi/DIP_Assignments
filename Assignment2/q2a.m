file = './Assign2_imgs/other_images/onion.png';

image = imread(file);
if size(image,3)==3
    im  = double(rgb2gray(image));
else
    im  = double((image));
end
N = 2^(ceil(log2(size(im,1))));
M = 2^(ceil(log2(size(im,2))));

im = imresize(im,[N N]);

F = fft_2d(im);

F2 = ifft2(F);
figure;
subplot(1,3,1);
imshow(uint8(im));
title('actual image');
subplot(1,3,2);
imshow(F);
title('fft');
subplot(1,3,3);
imshow(uint8(F2));
title('After ifft2');
