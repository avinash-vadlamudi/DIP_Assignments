clc;
clear all;
close all;
I=imread('Cricket1.jpeg');
figure(),imshow(I);
I1=rgb2gray(I);
[a,b]=size(I1);
figure(),imshow(I1);
figure(),imhist(I1);
C=zeros(a,b);
I1=double(I1);
for i=1:1:a
    for j=1:1:b
           m=I1(i,j);
          if(m>200)
              C(i,j)=1;
          end
    end
end
C=logical(C);
figure(),imshow(C);