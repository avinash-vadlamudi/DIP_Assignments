imshow('./Assign1_imgs/stereo_left.jpg');
p1=ginput(4);
t = ones(4,1);
p2 = [p1,t];

imshow('./Assign1_imgs/stereo_right.jpg');
p3=ginput(4);
t = ones(4,1);
p4 = [p3,t];

p41 = transpose(p4);
p21 = transpose(p2);
I = [1,0,0;0,1,0;0,0,1];

mat = p41*(p21\I);

im1 = imread('./Assign1_imgs/stereo_left.jpg');
im2 = imread('./Assign1_imgs/stereo_right.jpg');
im22 = im1;
for i = 1:size(im1,1)
    for j = 1:size(im1,1)
        temp = [i;j;1];
        val = mat*temp;
        val(1,1) = floor(val(1,1));
        val(2,1) = floor(val(2,1));
        if(val(1,1)<=0 || val(1,1)>size(im2,1)|| val(2,1)<=0 || val(2,1)>size(im2,2))
            continue;
        else
            im22(i,j,:) = im2(val(1,1),val(2,1),:);
        end
    end
end
im21 = imresize(im2,[size(im22,1) size(im22,2)]);
im_diff = abs(im22-im21);
figure;
subplot(2,2,1);
imshow(uint8(im1));
title('left image');
subplot(2,2,2);
imshow(uint8(im2));
title('right image');
subplot(2,2,3);
imshow(uint8(im22));
title('after trans of left to right');
subplot(2,2,4);
imshow(uint8(im_diff));
title('diff b/w trans and actual right');