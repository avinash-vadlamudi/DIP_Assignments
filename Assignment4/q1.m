filename = 'Assign4_imgs/restore_01.jpg';
im = im2double(imread(filename));
blurred = im;

if strcmp(filename ,'Assign4_imgs/restore_01.jpg') == 1
    LEN = 32;
    THETA = 0;
    PSF = fspecial('motion', LEN, THETA);
    
    val = var(blurred(:));
    noise_var = val*0.001;
    % keep for 0.01 and 0.001
    wnr1 = deconvwnr(blurred, PSF, noise_var/val);
    figure;
    subplot(1,2,1);
    imshow(blurred);
    title('Given Image');
    subplot(1,2,2);
    imshow(wnr1);
    title('Restored Image');
elseif strcmp(filename ,'Assign4_imgs/restore_02.jpg') == 1
    LEN = 27;
    THETA = 5;
    PSF = fspecial('motion',LEN,THETA);
    val = var(blurred(:));
    noise_var = val*0.04;
    wnr1 = deconvwnr(blurred,PSF,noise_var/val);
    figure;
    subplot(1,2,1);
    imshow(blurred);
    title('Given Image');
    subplot(1,2,2);
    imshow(wnr1);
    title('Restored Image');
elseif strcmp(filename ,'Assign4_imgs/restore_03.gif') == 1
    LEN = 20;
    THETA = 35;
    PSF = fspecial('motion',LEN,THETA);
    val = var(blurred(:));
    noise_var = val*0.03;
    wnr1 = deconvwnr(blurred,PSF,noise_var/val);
    figure;
    subplot(1,2,1);
    imshow(blurred);
    title('Given Image');
    subplot(1,2,2);
    imshow(wnr1);
    title('Restored Image');    
elseif strcmp(filename ,'Assign4_imgs/restore_04.jpg') == 1
    LEN = 20;
    THETA = -22;
    PSF = fspecial('motion',LEN,THETA);
    val = var(blurred(:));
    noise_var = val*0.04;
    wnr1 = deconvwnr(blurred,PSF,noise_var/val);
    figure;
    subplot(1,2,1);
    imshow(blurred);
    title('Given Image');
    subplot(1,2,2);
    imshow(wnr1);
    title('Restored Image');    
end

% F=fft2(im);
% F = fftshift(F);
% Fs = abs(F); % Get the magnitude
% Fs = log(Fs+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
% Fs = mat2gray(Fs); % Use mat2gray to scale the image between 0 and 1
% imshow(Fs,[]); 