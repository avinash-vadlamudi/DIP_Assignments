close all;clear all;
im=imread('E:\sem5\DIP\Asgn3\Assign3_imgs\coins.jpg');
im=rgb2gray(im);
im=edge(im,'canny');
im=255*double(im);
imshow(uint8(im)); figure,

%for coins.png image
voteThreshold=180;

[M N]=size(im);
vote=zeros(M,N,100);
for i=1:M
    for j=1:N
        if(im(i,j)==255)
            for r=10:100
                for theta=0:360
                    a=floor(i-r*cos(theta*pi/180));
                    b=floor(j-r*sin(theta*pi/180));
                    if(a>=1 && b>=1 && a<=M && b<=N)
                        vote(a,b,r)=vote(a,b,r)+1;
                    end
                end
            end
        end
    end
end

final=zeros(M,N);
k=1;
for i=1:M
    for j=10:N
        for r=1:100
            if(vote(i,j,r)>=voteThreshold)
                store(k,1)=i;store(k,2)=j;store(k,3)=r;k=k+1;
                for theta=0:360
                    a=floor(i-r*cos(theta*pi/180));
                    b=floor(j-r*sin(theta*pi/180));
                    if(a>=1 && b>=1 && a<=M && b<=N)
                        final(a,b)=255;
                    end
                end
            end
        end
    end
end
imshow(uint8(final));
                        


