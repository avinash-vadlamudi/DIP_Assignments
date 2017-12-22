function [error] = RMSE(im1,im2)
im1 = double(im1);
im2 = double(im2);

len1 = size(im1,1);
len2 = size(im2,1);
bre1 = size(im1,2);
bre2 = size(im2,2);
if(bre1>bre2)
    max_bre=bre1;
    im2 = padarray(im2,[0 bre1-bre2],'post');
else
    max_bre = bre2;
    im1 = padarray(im1,[0 bre2-bre1],'post');
end

if(len1>len2)
    max_len=len1;
    im2 = padarray(im2,[len1-len2 0],'post');
else
    max_len = len2;
    im1 = padarray(im1,[len2-len1 0],'post');
end

error = 0;
for i = 1:max_len
    for j = 1:max_bre
        error = error + (im1(i,j)-im2(i,j))*(im1(i,j)-im2(i,j));
    end
end
error = error/(max_bre*max_len*(1.0));
error = sqrt(error);

end
