filename = 'parabola1.jpg';
im = imread(filename);
im2 = double(rgb2gray(im));
im3 = edge(im2,'Canny');
im4 = zeros(size(im3));

[x,y] = size(im3);

rmin = 10;
rmax = 50;
mat = zeros(x,y,41);
for i = 1:x
    for j = 1:y
        if im3(i,j)==1
            for r = rmin:rmax
                for a = 1:x
                    val = floor(j-((1.0/(4*a))*((i-a)*(i-a))));
                    if (val<1 || val>y)
                        continue;
                    end
                    mat(a,val,r-rmin+1) = mat(a,val,r-rmin+1) + 1;
                end
            end
        end
    end
end

for i = 1:x
    for j = 1:y
        for r = 1:40
            if(mat(i,j,r)>70)
                rad = r+rmin-1;
                for a = 1:70
                    val = floor(j+((1.0/(4*a))*((i-a)*(i-a))));
                    if(val<1 || val>x || val2<1 || val2>y)
                        continue;
                    end
                    
                    im4(a,val) = 1;
                end
            end
        end
    end
end

im4 = logical(im4);
