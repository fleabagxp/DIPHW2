img = imread('D:\Users\fleabag\Documents\MATLAB\Image\cross.pgm');

subplot(2,2,1)
imshow(img);
title('PGM');


cutoff10 = 10;
cutoff30 = 30;
cutoff50 = 50;
[M,N]=size(img);
F = fft2(img);

u=0:(M-1);
v=0:(N-1);

dx=find(u>M/2);
dy=find(v>N/2);

u(dx) = u(dx)-M;
v(dy) = v(dy)-M;

[U,V] = meshgrid(u,v);
D=sqrt(U.^2+V.^2);

Hideal10=double(D<=cutoff10);
Hideal30=double(D<=cutoff30);
Hideal50=double(D<=cutoff50);
G=Hideal10.*F;
GG=Hideal30.*F;
GGG=Hideal50.*F;
lp10=real(ifft2(double(G)));
lp30=real(ifft2(double(GG)));
lp50=real(ifft2(double(GGG)));

subplot(2,2,2)
imshow(lp10,[]); 
title('Ideal Low Pass Filter cutoff=10');

subplot(2,2,3)
imshow(lp30,[]); 
title('Ideal Low Pass Filter cutoff=30');

subplot(2,2,4)
imshow(lp50,[]); 
title('Ideal Low Pass Filter cutoff=50');









