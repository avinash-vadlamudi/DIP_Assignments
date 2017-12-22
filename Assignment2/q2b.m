function q2b(file,D0,n)
    %file = './Assign2_imgs/other_images/car1.jpg';

    image = imread(file);
    %D0 = 30;
    %n = 2;
    cx = round(size(image,1)/2);
    cy = round(size(image,2)/2);

    im1 = image;
    F=fft2(im1);
    F = fftshift(F);
    % Fs = abs(F); % Get the magnitude
    % Fs = log(Fs+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
    % Fs = mat2gray(Fs); % Use mat2gray to scale the image between 0 and 1
    %imshow(Fs,[]); 

    filter = zeros(size(image,1),size(image,2),size(image,3));
    filter2 = zeros(size(image,1),size(image,2),size(image,3));
    filter3 = zeros(size(image,1),size(image,2),size(image,3));

    for i = 1:size(image,1)
        for j = 1:size(image,2)
            val = sqrt((i-cx).^2 + (j-cy).^2);
            if val <=D0
                filter(i,j,:) = 1;
            end
            filter2(i,j,:) = 1/(1+ (val/D0).^(2*n));
            filter3(i,j,:) = exp(-1*((val*val)/(2*D0*D0)));
        end
    end
    
    F1=F.*filter;
    F1=ifftshift(F1);
    F1=real(ifft2(F1));
    im2=uint8(F1);

    F2 = F.*filter2;
    F2=ifftshift(F2);
    F2=real(ifft2(F2));
    im3=uint8(F2);

    F3 = F.*filter3;
    F3=ifftshift(F3);
    F3=real(ifft2(F3));
    im4=uint8(F3);

    figure;
    subplot(1,3,1);
    imshow(im2);
    title('Ideal Low pass');
    subplot(1,3,2);
    imshow(im3);
    title('Butterworth');
    subplot(1,3,3);
    imshow(im4);
    title('Gaussian');

    F1=F.*(1-filter);
    F1=ifftshift(F1);
    F1=real(ifft2(F1));
    im2=uint8(F1);

    F2 = F.*(1-filter2);
    F2=ifftshift(F2);
    F2=real(ifft2(F2));
    im3=uint8(F2);

    F3 = F.*(1-filter3);
    F3=ifftshift(F3);
    F3=real(ifft2(F3));
    im4=uint8(F3);

    figure;
    subplot(1,3,1);
    imshow(im2);
    title('Ideal High pass');
    subplot(1,3,2);
    imshow(im3);
    title('Butterworth');
    subplot(1,3,3);
    imshow(im4);
    title('Gaussian');
end
