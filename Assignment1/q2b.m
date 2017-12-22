% median filtering
function q2b(image)
im1 = double(imread(image));

im2 = padarray(im1,[5,5]);
im11 = im1;
im12 = im1;
im13 = im1;

for i = 6:size(im2,1)-5
    for j = 6:size(im2,2)-5
        im11(i-5,j-5,1) = median(median(im2(i-1:i+1,j-1:j+1,1),2));
        im11(i-5,j-5,2) = median(median(im2(i-1:i+1,j-1:j+1,2),2));
        im11(i-5,j-5,3) = median(median(im2(i-1:i+1,j-1:j+1,3),2));
        
        im12(i-5,j-5,1) = median(median(im2(i-2:i+2,j-2:j+2,1),2));
        im12(i-5,j-5,2) = median(median(im2(i-2:i+2,j-2:j+2,2),2));
        im12(i-5,j-5,3) = median(median(im2(i-2:i+2,j-2:j+2,3),2));

        im13(i-5,j-5,1) = median(median(im2(i-4:i+4,j-4:j+4,1),2));
        im13(i-5,j-5,2) = median(median(im2(i-4:i+4,j-4:j+4,2),2));
        im13(i-5,j-5,3) = median(median(im2(i-4:i+4,j-4:j+4,3),2));

    end
end
figure;
subplot(2,2,1);
imshow(uint8(im1));
title('Original image');
subplot(2,2,2);
imshow(uint8(im11));
title('Filter of size 3');
subplot(2,2,3);
imshow(uint8(im12));
title('Filter of size 5');
subplot(2,2,4);
imshow(uint8(im13));
title('Filter of size 8');
end