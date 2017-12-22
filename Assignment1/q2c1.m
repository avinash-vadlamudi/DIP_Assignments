 %High boost filter
image = './Assign1_imgs/Bell.jpg';
im1 = (imread(image));
filter1 = zeros(3,3);
filter2 = zeros(5,5);
filter3 = zeros(8,8);

lambda = 1;
s = 1.4;

for i=1:3
    for j = 1:3
        filter1(i,j) = -1*(1-(((i-2).^2 + (j-2).^2)/(2*s*s)))*exp(-1*((i-2).^2 + (j-2).^2)/(2*s*s));
    end
end
filter1 = filter1/(pi*s*s*s*s);

for i=1:5
    for j = 1:5
        filter2(i,j) = -1*(1-(((i-3).^2 + (j-3).^2)/(2*s*s)))*(exp(-1*((i-3).^2 + (j-3).^2)/(2*s*s)));
    end
end
filter2 = filter2/(pi*s*s*s*s);

for i=1:8
    for j = 1:8
        filter3(i,j) = -1*(1-((min(abs(i-4),abs(i-5)).^2 + min(abs(j-4),abs(j-5)).^2)/(2*s*s)))*exp(-1*(min(abs(i-4),abs(i-5)).^2 + min(abs(j-4),abs(j-5)).^2)/(2*s*s));
    end
end
filter3 = filter3/(pi*s*s*s*s);

im11 = imfilter(im1,filter1);
im12 = imfilter(im1,filter2);
im13 = imfilter(im1,filter3);

im31 = (im1) + lambda*((im11));
im32 = (im1) + lambda*((im12));
im33 = (im1) + lambda*((im13));

figure;
subplot(3,3,1);
imshow(uint8(im1));
title('Original image');
subplot(3,3,2);
imshow(uint8(lambda*im11));
title('Laplacian image');
subplot(3,3,3);
imshow(uint8(im31));
title('Filter of size 3');

subplot(3,3,4);
imshow(uint8(im1));
title('Original image');
subplot(3,3,5);
imshow(uint8(lambda*im12));
title('Laplacian image');
subplot(3,3,6);
imshow(uint8(im32));
title('Filter of size 5');

subplot(3,3,7);
imshow(uint8(im1));
title('Original image');
subplot(3,3,8);
imshow(uint8(lambda*im13));
title('Laplacian image');
subplot(3,3,9);
imshow(uint8(im33));
title('Filter of size 8');
