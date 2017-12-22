clc;
clear all;
close all;
I=imread('Cricket1.jpeg');
figure(),imshow(I);
I1=rgb2gray(I);
[a,b]=size(I1);
figure(),imshow(I1);
figure(),imhist(I1);
m1=140;
m2=100;
C=zeros(a,b);
x=0;
I1=double(I1);
while(x<1000)
for i=1:1:a
    for j=1:1:b
          m=I1(i,j);
          mag1=(m-m1)*(m-m1);
          mag2=(m-m2)*(m-m2);
          if(mag1<mag2)
              C(i,j)=1;
          end
          if(mag1>=mag2)
              C(i,j)=0;
          end
    end
end
m1=0;
m2=0;
cou1=0;
cou2=0;
 for i=1:1:a
     for j=1:1:b
         if(C(i,j)==1)
             m1=m1+I1(i,j);
             cou1=cou1+1;
         end
         if(C(i,j)==0)
              m2=m2+I1(i,j);
             cou2=cou2+1;
         end
     end
 end
 m1=m1/cou1;
 m2=m2/cou2;
 x=x+1;
end
C=logical(C);
figure(),imshow(C);