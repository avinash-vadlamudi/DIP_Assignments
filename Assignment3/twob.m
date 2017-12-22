I=imread('Cricket1.jpeg');
I = rgb2gray(I);
I=im2double(I);
%I=im2bw(I);
%mg = (mean(mean(I)));
a=0.0085;
b=1.265;
% r=1;
% t=1;
for i=1:size(I,1)-3
    for j=1:size(I,2)-3
        Itemp=I(i:i+2,j:j+2);
        vxy=var(var(Itemp(:,:)));
        if(1<0)
            Itemp=I(i:i+2,j:j+2);
            vxy=var(var(Itemp(:,:)));
            mg = mean(mean(Itemp(:,:)));
        end
        mg = mean(mean(Itemp(:,:)));
        Txy(j) = a*vxy+b*mg;
        if(Txy(j)>1 && j>1)
            Txy(j)=Txy(j-1);
        end
        for l=1:3
            for m=1:3
                if Itemp(l,m)>Txy(j)
                    out(i,j) = 1;
                    if(1<0)
                        Itemp=I(i:i+2,j:j+2);
                        vxy=var(var(Itemp(:,:)));
                        mg = mean(mean(Itemp(:,:)));
                    end
                else
                    out(i,j) = 0;
                end
            end
        end
    end
end
figure,imshow(out);