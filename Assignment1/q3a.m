% ripple transform 
function q3a(image)
im1 = double(imread(image));
X_max = size(im1,1);
Y_max = size(im1,2);
C_max = size(im1,3);
im2 = im1;

ax = 10;
ay = 15;
tx = 120;
ty = 150;
val = 0;
for val = 1:20
for i =1:X_max
    for j = 1:Y_max
        for chan = 1:C_max
            l = i + (ax+val)*(sin((2*pi*j)/(tx+val*3)));
            r = j + (ay+val)*(sin((2*pi*i)/(ty+val*3)));
            
            im2(i,j,:) = im1(min(max(floor(l),1),X_max),min(max(floor(r),1),Y_max),:);

        end
    end
end
figure;
imshow(uint8(im2));
end
%figure;
%subplot(1,2,1);
%imshow(uint8(im1));
%subplot(1,2,2);
%imshow(uint8(im2));
end
