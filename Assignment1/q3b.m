% spherical transform 
function q3b(image)
im1 = double(imread(image));
X_max = size(im1,1);
Y_max = size(im1,2);
im2 = im1;

Y1_c = round(size(im1,2)/2);
X1_c = round(size(im1,1)/2);
r1_max = min(X1_c,Y1_c)/2;
val = 10;
rho1 = 1.5;
for val = 1:20
for i = 1:X_max
    for j = 1:Y_max
        X_c = X1_c+ 2*val-30;
        Y_c = Y1_c + 2*val-30;
        r_max = r1_max+ 2*val;
        rho = rho1 + 0.01*val;
        
        rad = sqrt((i-X_c).^2 + (j-Y_c).^2);
        dx = i-X_c;
        dy = j-Y_c;
        if rad<=r_max
            z = sqrt((r_max).^2 - (rad).^2);
            bx = ((rho-1)/rho)*(asin(dx/(sqrt(dx*dx + z*z))));
            by = ((rho-1)/rho)*(asin(dy/(sqrt(dy*dy + z*z))));
            l = i-z*tan(bx);
            r = j-z*tan(by);
        else
            l = i;
            r = j;
        end
        im2(i,j,:) = im1(min(max(floor(l),1),X_max),min(max(floor(r),1),Y_max),:);
    end
end
figure;
imshow(uint8(im2));
end
figure;
subplot(1,2,1);
imshow(uint8(im1));
subplot(1,2,2);
imshow(uint8(im2));
end