file = './Assign2_imgs/other_images/cameraman.tif';
times = 3;
method = 'BiCubic';

%method = 'Nearest Neighbor';
image = double(imread(file));
figure;
imshow(uint8(image));
title('Actual image');

if (strcmp(method,'Nearest Neighbor')==1)
    im1 = image;
    for i = 1:times
        im2 = zeros((2*size(im1,1)),(2*size(im1,2)),size(im1,3));
        im2(1:2:end,1:2:end,:) = im1;
        im2(2:2:end,1:2:end,:) = im1;
        im2(1:2:end,2:2:end,:) = im1;
        im2(2:2:end,2:2:end,:) = im1;
        figure;
        imshow(uint8(im2));
        title('Nearest Neighbor');
        im1 = im2;
    end
end
%method = 'Linear';

if ((strcmp(method,'Linear')==1) || (strcmp(method,'BiLinear')==1))
    im1 = image;
    for i = 1:times
        im2 = zeros((2*size(im1,1)),(2*size(im1,2)),size(im1,3));
        im2(1:2:end,1:2:end,:) = im1;
        im2(2:2:end,1:2:end,:) = (im1 + [im1(2:1:end,1:1:end,:);zeros(1,size(im1,2),size(im1,3))])/2;
        im2(1:2:end,2:2:end,:) = (im1 + [im1(1:1:end,2:1:end,:) zeros(size(im1,1),1,size(im1,3))])/2;
        im_temp1 = [im1(2:1:end,1:1:end,:);zeros(1,size(im1,2),size(im1,3))];
        im_temp2 = [im1(1:1:end,2:1:end,:) zeros(size(im1,1),1,size(im1,3))];
        im_temp3 = [im_temp1(1:1:end,2:1:end,:) zeros(size(im1,1),1,size(im1,3))];
        im2(2:2:end,2:2:end,:) = (im1 + im_temp1 + im_temp2 + im_temp3)/4;
        figure;
        imshow(uint8(im2));
        title('Linear/Bilinear');
        im1 = im2;
    end
end

%method = 'BiCubic';
if (strcmp(method,'BiCubic')==1)
    im1 = image;
    for i = 1:times
        im2 = zeros((2*size(im1,1)),(2*size(im1,2)),size(im1,3));

        im_temp1 = [im1(2:1:end,1:1:end,:);zeros(1,size(im1,2),size(im1,3))]; %0,1
        im_temp2 = [im1(3:1:end,1:1:end,:);zeros(2,size(im1,2),size(im1,3))]; %0,2
        im_temp3 = [zeros(1,size(im1,2),size(im1,3));im1(1:1:end-1,1:1:end,:)]; %0,-1
        im_temp4 = [im1(1:1:end,2:1:end,:) zeros(size(im1,1),1,size(im1,3))];  %1,0
        im_temp5 = [im1(1:1:end,3:1:end,:) zeros(size(im1,1),2,size(im1,3))];  %2,0
        im_temp6 = [zeros(size(im1,1),1,size(im1,3)) im1(1:1:end,1:1:end-1,:)];  %-1,0
        im_temp7 = [zeros(1,size(im1,2),size(im1,3));im_temp6(1:1:end-1,1:1:end,:)];   %-1,-1
        im_temp8 = [im_temp6(2:1:end,1:1:end,:);zeros(1,size(im1,2),size(im1,3))];  %-1,1
        im_temp9 = [im_temp6(3:1:end,1:1:end,:);zeros(2,size(im1,2),size(im1,3))];  %-1,2
        im_temp10 = [zeros(1,size(im1,2),size(im1,3));im_temp4(1:1:end-1,1:1:end,:)];   %1,-1
        im_temp11 = [im_temp4(2:1:end,1:1:end,:);zeros(1,size(im1,2),size(im1,3))];  %1,1
        im_temp12 = [im_temp4(3:1:end,1:1:end,:);zeros(2,size(im1,2),size(im1,3))];  %1,2
        im_temp13 = [zeros(1,size(im1,2),size(im1,3));im_temp5(1:1:end-1,1:1:end,:)];   %2,-1
        im_temp14 = [im_temp5(2:1:end,1:1:end,:);zeros(1,size(im1,2),size(im1,3))];  %2,1
        im_temp15 = [im_temp5(3:1:end,1:1:end,:);zeros(2,size(im1,2),size(im1,3))];  %2,2
        
        temp1 = (4.5*im_temp6 + 4.5*im_temp8 + (-0.5)*im_temp9 + (-0.5)*im_temp7)/8;
        temp2 = (4.5*im1 + 4.5*im_temp1 + (-0.5)*im_temp2 + (-0.5)*im_temp3)/8;
        temp3 = (4.5*im_temp4 + 4.5*im_temp11 + (-0.5)*im_temp12 + (-0.5)*im_temp10)/8;
        temp4 = (4.5*im_temp5 + 4.5*im_temp14 + (-0.5)*im_temp15 + (-0.5)*im_temp13)/8;

        im2(1:2:end,1:2:end,:) = im1;
        im2(2:2:end,1:2:end,:) = (4.5*im1 + 4.5*im_temp1 + (-0.5)*im_temp2 + (-0.5)*im_temp3)/8;
        im2(1:2:end,2:2:end,:) = (4.5*im1 + 4.5*im_temp4 + (-0.5)*im_temp5 + (-0.5)*im_temp6)/8;
        im2(2:2:end,2:2:end,:) = (4.5*temp2 + 4.5*temp3 + (-0.5)*temp4 + (-0.5)*temp1)/8;
        figure;
        imshow(uint8(im2));
        title('BiCubic');
        im1 = im2;
    end
end
