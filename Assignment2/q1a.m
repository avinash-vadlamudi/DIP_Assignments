function [gauss_list,lap_list] = q1a(filename,level)
    %filename = './Assign2_imgs/other_images/car1.jpg';
    %level = 7;

    filter = zeros(5,5);
    sigma = 2;
    for i = 1:5
        for j = 1:5
            filter(i,j) = exp(-1*((i-3).^2 + (j-3).^2)/(2*sigma*sigma));
        end
    end
    filter = filter/sum(filter(:));

    image = ((imread(filename)));
    image = double(image);
        
    im1 = image;
    str = 'lev';

    [x,y,c] = size(image);
    gauss_list = struct;
    lap_list = struct;

    for i = 1:level
        count = (i);
        c_var = '';
        while(count>0)
            temp2 = count;
            count = floor(count/10);        
            temp = temp2 - 10*count;
            c_var = strcat(char(temp+'0'),c_var);
        end
        if(i==level)
            im11 = im1;
            im3 = im1;
        else
            im2 = imfilter(im1,filter);
            im3 = im2(1:2:end,1:2:end,:);
            im4 = imresize(im3,[size(im1,1) size(im1,2)]);
            im11 = (double(im1)-double(im2));
        end

        str2 = strcat(str,c_var);
        gauss_list.(str2) = im1;    
        lap_list.(str2) = im11;

        im1 = im3;
        x = floor(x/2);
        y = floor(y/2);
    end
    
    fields = fieldnames(gauss_list);
%    figure;
    for i=1:numel(fields)
        figure;
%      subplot(1,level,i);
      imshow(uint8(gauss_list.(fields{i})));
    end
    
    fields = fieldnames(lap_list);
%    figure;
    for i=1:numel(fields)
        figure;
      %subplot(1,level,i);
      imshow(uint8(lap_list.(fields{i})));
    end
    
end
