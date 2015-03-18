img = imread('D:\Users\fleabag\Documents\MATLAB\Image\cross.pgm');

subplot(2,2,1)
imshow(img);
title('PGM');


cutoff10 = 10;
cutoff30 = 30;
cutoff50 = 50;
n=2;
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



Hbutterworth10=1./(1+(D./cutoff10).^(2*n));
Hbutterworth30=1./(1+(D./cutoff30).^(2*n));
Hbutterworth50=1./(1+(D./cutoff50).^(2*n));

G=Hbutterworth10.*F;
GG=Hbutterworth30.*F;
GGG=Hbutterworth50.*F;
lp10=real(ifft2(double(G)));
lp30=real(ifft2(double(GG)));
lp50=real(ifft2(double(GGG)));

subplot(2,2,2)
imshow(lp10,[]); 
title('Butterworth Low Pass Filter cutoff=10 n=2');

subplot(2,2,3)
imshow(lp30,[]); 
title('Butterworth Low Pass Filter cutoff=30 n=2');

subplot(2,2,4)
imshow(lp50,[]); 
title('Butterworth Low Pass Filter cutoff=50 n=2');


