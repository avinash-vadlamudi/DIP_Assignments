function [error_dct,error_dft,error_dwt] = q2(filename,c)
    im = imread(filename);
    im = double(rgb2gray(im));
    %im = im2double(im);
    fig_flag = 0;
%     c = 10;
    qm = [16,11,10,16,24,40,51,61;
        12,12,14,19,26,58,60,55;
        14,13,16,24,40,57,69,56;
        14,17,22,29,51,87,80,62;
        18,22,37,56,68,109,103,77;
        24,35,55,64,81,104,113,92;
        49,64,78,87,103,121,120,101;
        72,92,95,98,112,100,103,99;];
    im_sub = zeros(8,8);
    im_sub2 = zeros(8,8);
    len = size(im,1);
    bre = size(im,2);
    im2 = zeros(len,bre);
    im3 = zeros(len,bre);
    im4 = zeros(len,bre);
    
    i=1;
    
    while(i<=len)
        j=1;
        while(j<=bre)
            for var1 = i:i+7
                for var2 = j:j+7
                    if(var1>len || var2>bre)
                        im_sub(var1-(i-1),var2-(j-1)) = 0;
                        im_sub2(var1-(i-1),var2-(j-1)) = 0;
                        im_sub3(var1-(i-1),var2-(j-1)) = 0;
                        
                    else
                        im_sub(var1-(i-1),var2-(j-1)) = im(var1,var2);
                        im_sub2(var1-(i-1),var2-(j-1)) = im(var1,var2);
                        im_sub3(var1-(i-1),var2-(j-1)) = im(var1,var2);
    
                    end
                end
            end
            temp = qm*c;
    
            im_sub = dct2(im_sub);
            im_sub = floor((im_sub+temp/2)./temp); 
            im_sub = im_sub.*(temp);
            im_sub = round(idct2(im_sub));
            
            im_sub2 = fft2(im_sub2);
            im_sub2 = floor((im_sub2+temp/2)./temp); 
            im_sub2 = im_sub2.*(temp);
            im_sub2 = abs(ifft2(im_sub2));
            
            h = hadamard(8);
            m = log2(8);
            im_sub3 = (1/(2^m))*h*im_sub3*h';
            im_sub3 = floor((im_sub3+temp/2)./temp); 
            im_sub3 = im_sub3.*(temp);
            im_sub3 = (1/(2^m))*h'*im_sub3*h;
            
            for var1 = i:i+7
                for var2 = j:j+7
                    if(var1>len||var2>bre)
                        continue;
                    end
                    im2(var1,var2) = im_sub(var1-(i-1),var2-(j-1));
                    im3(var1,var2) = im_sub2(var1-(i-1),var2-(j-1));
                    im4(var1,var2) = im_sub3(var1-(i-1),var2-(j-1));
                end
            end
            j=j+8;
        end
        i=i+8;
    end
    
    im2 = uint8(im2);
    im3 = uint8(im3);
    im4 = uint8(im4);
    im = uint8(im);
    
    error_dct = RMSE(im,im2);
    error_dft = RMSE(im,im3);
    error_dwt = RMSE(im,im4);
    
    if(fig_flag == 1)
        figure;
        subplot(2,2,1);
        imshow((im));
        title('Actual Image');
        subplot(2,2,2);
        imshow(im2);
        title('Image From DCT');
        subplot(2,2,3);
        imshow(im3);
        title('Image from FFT');
        subplot(2,2,4);
        imshow(im4);
        title('Image from DWT');
    end
end
