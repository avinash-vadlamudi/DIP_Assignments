filename = 'Cricket1.jpeg';
im = imread(filename);
im = rgb2gray(im);
[x,y]  = size(im);
c1 = 10;
c2 = 150;
a = zeros(x,y);
it  = 1;
while it<10000
    a = zeros(x,y);
    for i = 1:x
        for j = 1:y
            val = im(i,j);
            dist1 = (val-c1).^2;
            dist2 = (val-c2).^2;
            if dist1>=dist2
               a(i,j) =1 ;
            else
                a(i,j) = 0;
            end
        end
    end
    c1_temp = 0;
    c2_temp = 0;
    cnt_c1 = 0;
    cnt_c2 = 0;
    
    for i = 1:x
        for j = 1:y
            if(a(i,j)==1)
                c2_temp = c2_temp + im(i,j);
                cnt_c2 = cnt_c2+1;
            else
                c1_temp = c1_temp + im(i,j);
                cnt_c1 = cnt_c1 + 1;
            end
        end
    end
    c1_temp = (c1_temp * 1.0)/cnt_c1;
    c2_temp = (c2_temp * 1.0)/cnt_c2;
    if(abs(c1_temp-c1)>5 || abs(c2_temp-c2)>5)
        c1 = c1_temp;
        c2 = c2_temp;
        it = it+1;
        continue;
    else
        break;
    end
    it = it+1;
end

im2 = zeros(x,y);
for i = 1:x
    for j = 1:y
        dist = (im(i,j)-c1).^2;
        dist2 = (im(i,j)-c2).^2;
        if(dist>dist2)
            im2(i,j) =1 ;
        else
            im2(i,j) = 0;
        end
    end
end
im2 = logical(im2);

        
