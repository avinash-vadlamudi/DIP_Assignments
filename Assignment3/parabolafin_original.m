function [H] = parabolafin(img)

I=rgb2gray(img);
%figure,imshow(I,[]);
[N,M]=size(I);

[E,thresh]=edge(I,'canny',0.35);    
%figure,imshow(E,[]);

rvals = [0.003,0.004,0.005,0.006,0.007,0.008];

R=length(rvals);

A=zeros(N,M,R);

[yindex xindex]=find(E);
for cnt=1:length(xindex)
    for r=1:R
        for x0=1:M
            y0=yindex(cnt)-rvals(r)*(xindex(cnt)-x0)^2;
            y0=round(y0);
            if y0< N & y0>=1
                A(y0,x0,r) = A(y0,x0,r)+1;
            end
        end
    end
end

%figure,imshow(A(:,:,round(R/2)),[]);

Ar=max(A,[],3);

SE=strel('disk',40);
Amax=imdilate(Ar,SE);

thresh=70;
y0detect = [];
x0detect= [];
r0detect= [];

for r=1:R
    [y0 x0]=find((Amax(:,:) == A(:,:,r)) & ...
        A(:,:,r) > thresh);
    y0detect=[y0detect; y0];
    x0detect=[x0detect; x0];
    r0detect=[r0detect; rvals(r)*ones(length(x0),1)];
end

%figure,imshow(E,[]);
for i=1:length(x0detect)
    x0=x0detect(i);
    y0=y0detect(i);
    r0=r0detect(i);
    for x=1:M
        y=round(y0+r0*(x-x0)^2);
        if y<=N & y>=1
            rectangle('Position',[x y 1 1],...
                'Edgecolor','r');
        end
    end
end
%figure,imshow(E,[]);
end