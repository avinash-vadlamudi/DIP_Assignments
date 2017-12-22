filename = 'circle3.jpg';
im = imread(filename);
im2 = double(rgb2gray(im));
im3 = edge(im2,'Canny');
im4 = zeros(size(im3));

[x,y] = size(im3);

rmin = 120;
rmax = 160;
mat = zeros(x,y,41);
for i = 1:x
    for j = 1:y
        if im3(i,j)==1
            for r = rmin:rmax
                for theta = 1:360
                    val = floor(i - r*cos(pi*((theta*1.0)/180)));
                    val2 = floor(j - r*sin(pi*((theta*1.0)/180)));
                    if (val<1 || val>x || val2<1 || val2>y)
                        continue;
                    end
                    mat(val,val2,r-rmin+1) = mat(val,val2,r-rmin+1) + 1;
                end
            end
        end
    end
end

for i = 1:x
    for j = 1:y
        for r = 1:40
            if(mat(i,j,r)>100)
                rad = r+rmin-1;
                for theta = 1:360
                    val = floor(i + rad*cos(pi*((theta*1.0)/180)));
                    val2 = floor(j + rad*sin(pi*((theta*1.0)/180)));
                    if(val<1 || val>x || val2<1 || val2>y)
                        continue;
                    end
                    
                    im4(val,val2) = 1;
                end
            end
        end
    end
end

im4 = logical(im4);

