function q2a(image)
    im1 = double(imread(image));
    filter1 = zeros(3,3);
    filter2 = zeros(5,5);
    filter3 = zeros(8,8);

    s = 100;
    for i=1:3
        for j = 1:3
            filter1(i,j) = exp(-1*((i-2).^2 + (j-2).^2)/(2*s*s));
        end
    end
    filter1 = filter1/sum(filter1(:));

    for i=1:5
        for j = 1:5
            filter2(i,j) = exp(-1*((i-3).^2 + (j-3).^2)/(2*s*s));
        end
    end
    filter2 = filter2/sum(filter2(:));

    for i=1:8
        for j = 1:8
            filter3(i,j) = exp(-1*(min(abs(i-4),abs(i-5)).^2 + min(abs(j-4),abs(j-5)).^2)/(2*s*s));
        end
    end
    filter3 = filter3/sum(filter3(:));

    im11 = imfilter(im1,filter1);
    im12 = imfilter(im1,filter2);
    im13 = imfilter(im1,filter3);

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
