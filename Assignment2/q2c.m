function q2c(file)
    %file = './Assign2_imgs/other_images/onion.png';

    image = imread(file);

    im1 = image;
    filter = [0 1 0;1 -4 1;0 1 0];

    F=fft2(double(im1));
    F = fftshift(F);
    H = fft2(double(filter),size(im1,1),size(im1,2));
    H = fftshift(H);
    H2 = cat(3,H,H,H);

    F1 = F.*H2;
    F1 = ifftshift(F1);
    F1 = real(ifft2(F1));
    im2 = uint8(F1);
    im3 = im1 + im2;

    figure;
    subplot(1,3,1);
    imshow(im1);
    title('actual image');
    subplot(1,3,2);
    imshow(im2);
    title('laplacian');
    subplot(1,3,3);
    imshow(im3);
    title('final');
end