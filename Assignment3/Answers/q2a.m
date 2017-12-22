filename = 'Cricket1.jpeg';
im = imread(filename);

im = rgb2gray(im);
for i = 1:size(im,1)
    for j = 1:size(im,2)
        if im(i,j) >200
            im(i,j)=1;
        else
            im(i,j)=0;
        end
    end
end
im2 = logical(im);
