function [imr] = q1b(file1,file2,mask_file)
  %  file1 = './Assign2_imgs/image_blending_with_laplacian_pyramid/example1/im1.jpg';
  %  file2 = './Assign2_imgs/image_blending_with_laplacian_pyramid/example1/im2.jpg';
  %  mask_file = './Assign2_imgs/image_blending_with_laplacian_pyramid/example1/mask.jpg';

    im1 = imread(file1);
    im2 = imread(file2);
    im_mask = imread(mask_file);
    
    val = max(max(double(im_mask)));
    level = 4;

    [g1_list,l1_list] = q1a(file1,level);
    [g2_list,l2_list] = q1a(file2,level);
    [g3_list,l3_list] = q1a(mask_file,level);
    g4_list = struct;

    fields = fieldnames(g1_list);
    for i = numel(fields):-1:1
     %   if i==numel(fields)
        imr1 = l1_list.(fields{i});
        imr2 = l2_list.(fields{i});
        imr3 = l3_list.(fields{i});
        imr3 = cat(3,imr3,imr3,imr3);
        if i==numel(fields)
            imr = zeros(size(imr1,1),size(imr1,2),size(imr1,3));
        end
        imr4 = val-imr3;
        imr = imr + ((imr1.*imr3)/val) + (((imr4).*imr2)/val);
        figure;
        %imshow(imr3);
        imshow(uint8(imr));
        if i>1
            imr = imresize(imr,[size(l1_list.(fields{i-1}),1) size(l1_list.(fields{i-1}),2)]);
        end
    end
end