sigma1 = 2;
sigma2 = 400;

im1 = double(imread('./Assign1_imgs/portraits.jpg'));
filter1 = zeros(3,3);
filter2 = zeros(5,5);
filter3 = zeros(8,8);

for i=1:3
    for j = 1:3
        filter1(i,j) = exp(-1*((i-2).^2 + (j-2).^2)/(2*sigma1*sigma1));
    end
end
%filter1 = filter1/sum(filter1(:));

for i=1:5
    for j = 1:5
        filter2(i,j) = exp(-1*((i-3).^2 + (j-3).^2)/(2*sigma1*sigma1));
    end
end
%filter2 = filter2/sum(filter2(:));

for i=1:8
    for j = 1:8
        filter3(i,j) = exp(-1*(min(abs(i-4),abs(i-5)).^2 + min(abs(j-4),abs(j-5)).^2)/(2*sigma1*sigma1));
    end
end
%filter3 = filter3/sum(filter3(:));

dim = size(im1);
im11 = zeros(dim);
im12 = zeros(dim);
im13 = zeros(dim);

for i = 1:dim(1)
   for j = 1:dim(2)      
         I1 = im1(max(i-1,1):min(i+1,dim(1)),max(j-1,1):min(j+1,dim(2)),:);
         I2 = im1(max(i-2,1):min(i+2,dim(1)),max(j-2,1):min(j+2,dim(2)),:);
         I3 = im1(max(i-3,1):min(i+4,dim(1)),max(j-3,1):min(j+4,dim(2)),:);
% size -3      
         H = exp((-1*((I1(:,:,1)-im1(i,j,1)).^2))/(2*sigma2*sigma2));
         F = H.*filter1((max(i-1,1):min(i+1,dim(1)))-i+1+1,(max(j-1,1):min(j+1,dim(2)))-j+1+1);
         norm_F = sum(F(:));
         im11(i,j,1) = sum(sum(F.*I1(:,:,1)))/norm_F;

         H = exp(-((I1(:,:,2)-im1(i,j,2)).^2)/(2*sigma2*sigma2));
         F = H.*filter1((max(i-1,1):min(i+1,dim(1)))-i+1+1,(max(j-1,1):min(j+1,dim(2)))-j+1+1);
         norm_F = sum(F(:));
         im11(i,j,2) = sum(sum(F.*I1(:,:,2)))/norm_F;

         H = exp(-((I1(:,:,3)-im1(i,j,3)).^2)/(2*sigma2*sigma2));
         F = H.*filter1((max(i-1,1):min(i+1,dim(1)))-i+1+1,(max(j-1,1):min(j+1,dim(2)))-j+1+1);
         norm_F = sum(F(:));
         im11(i,j,3) = sum(sum(F.*I1(:,:,3)))/norm_F;
                
% size -5      
         H = exp(-((I2(:,:,1)-im1(i,j,1)).^2)/(2*sigma2*sigma2));
         F = H.*filter2((max(i-2,1):min(i+2,dim(1)))-i+2+1,(max(j-2,1):min(j+2,dim(2)))-j+2+1);
         norm_F = sum(F(:));
         im12(i,j,1) = sum(sum(F.*I2(:,:,1)))/norm_F;

         H = exp(-((I2(:,:,2)-im1(i,j,2)).^2)/(2*sigma2*sigma2));
         F = H.*filter2((max(i-2,1):min(i+2,dim(1)))-i+2+1,(max(j-2,1):min(j+2,dim(2)))-j+2+1);
         norm_F = sum(F(:));
         im12(i,j,2) = sum(sum(F.*I2(:,:,2)))/norm_F;

         H = exp(-((I2(:,:,3)-im1(i,j,3)).^2)/(2*sigma2*sigma2));
         F = H.*filter2((max(i-2,1):min(i+2,dim(1)))-i+2+1,(max(j-2,1):min(j+2,dim(2)))-j+2+1);
         norm_F = sum(F(:));
         im12(i,j,3) = sum(sum(F.*I2(:,:,3)))/norm_F;

% size -8      
         H = exp(-((I3(:,:,1)-im1(i,j,1)).^2)/(2*sigma2*sigma2));
         F = H.*filter3((max(i-3,1):min(i+4,dim(1)))-i+3+1,(max(j-3,1):min(j+4,dim(2)))-j+3+1);
         norm_F = sum(F(:));
         im13(i,j,1) = sum(sum(F.*I3(:,:,1)))/norm_F;

         H = exp(-((I3(:,:,2)-im1(i,j,2)).^2)/(2*sigma2*sigma2));
         F = H.*filter3((max(i-3,1):min(i+4,dim(1)))-i+3+1,(max(j-3,1):min(j+4,dim(2)))-j+3+1);
         norm_F = sum(F(:));
         im13(i,j,2) = sum(sum(F.*I3(:,:,2)))/norm_F;

         H = exp(-((I3(:,:,3)-im1(i,j,3)).^2)/(2*sigma2*sigma2));
         F = H.*filter3((max(i-3,1):min(i+4,dim(1)))-i+3+1,(max(j-3,1):min(j+4,dim(2)))-j+3+1);
         norm_F = sum(F(:));
         im13(i,j,3) = sum(sum(F.*I3(:,:,3)))/norm_F;
         
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
