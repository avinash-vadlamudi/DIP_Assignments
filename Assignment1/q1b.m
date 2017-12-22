function q1b(image)
    im1= (imread(image));
    im3 = zeros(size(im1));
    parts = 3;
    if size(im1,3)==3
        len = size(im1,1);
        wid = size(im1,2);
        for i = 1:round(len/(1*parts)):len
            for j = 1:round(wid/(1*parts)):wid
                for k = 1:3
                    v1 = imhist(im1(i:min(i+round(len/parts),len),j:min(j+round(wid/parts),wid),k),256);
                    mat = tril(ones(256,256),0);

                    cum_v1 = mat*v1;
                    cum_v1(:,1) = round(((cum_v1(:,1)*1.0)/cum_v1(256,1))*255);
                    %im3(i:min(i+round(len/parts),len),j:min(j+round(wid/parts),wid),k) = (im3(i:min(i+round(len/parts),len),j:min(j+round(wid/parts),wid),k) + cum_v1(im1(i:min(i+round(len/parts),len),j:min(j+round(wid/parts),wid),k)+1))/2;
                    im3(i:min(i+round(len/parts),len),j:min(j+round(wid/parts),wid),k) = ( cum_v1(im1(i:min(i+round(len/parts),len),j:min(j+round(wid/parts),wid),k)+1));
                end
            end
        end
    else    
        v1 = imhist(im1,256);
        mat = tril(ones(256,256),0);

        cum_v1 = mat*v1;
        cum_v1(:,1) = round(((cum_v1(:,1)*1.0)/cum_v1(256,1))*255);
        %im3 = (im3(:,:) + cum_v1(im1(:,:)+1))/2;
        im3 = cum_v1(im1(:,:)+1);
    end
    figure;
    subplot(1,2,1);
    imshow(uint8(im1));
    title('Actual Image');
    subplot(1,2,2);
    imshow(uint8(im3));
    title('Final Image');
end
