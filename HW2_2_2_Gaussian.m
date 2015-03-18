img = imread('D:\Users\fleabag\Documents\MATLAB\Image\Chess_noise.pgm');
oriimg = imread('D:\Users\fleabag\Documents\MATLAB\Image\Chess.pgm');


subplot(2,2,1)
imshow(img);
title('PGM');


cutoff10 = 10;
cutoff30 = 30;
cutoff50 = 50;

[M,N]=size(img);

F = fft2(img);
Fori = im2double(oriimg);


u=0:(M-1);
v=0:(N-1);

dx=find(u>M/2);
dy=find(v>N/2);

u(dx) = u(dx)-M;
v(dy) = v(dy)-M;

[U,V] = meshgrid(u,v);
D=sqrt(U.^2+V.^2);



Hgaussian10=exp(-((D.^2)/(2*(cutoff10.^2))));
Hgaussian30=exp(-((D.^2)/(2*(cutoff30.^2))));
Hgaussian50=exp(-((D.^2)/(2*(cutoff50.^2))));

G=Hgaussian10.*F;
GG=Hgaussian30.*F;
GGG=Hgaussian50.*F;
lp10=real(ifft2(double(G)));
lp30=real(ifft2(double(GG)));
lp50=real(ifft2(double(GGG)));

subplot(2,2,2)
imshow(lp10,[]); 
title('Gaussian Low Pass Filter cutoff=10');

subplot(2,2,3)
imshow(lp30,[]); 
title('Gaussian Low Pass Filter cutoff=30');

subplot(2,2,4)
imshow(lp50,[]); 
title('Gaussian Low Pass Filter cutoff=50');

%RMS

image = Fori(:);
m = mean(image);
image = image - m;
rms=norm(image)/sqrt(numel(image));

image10 = lp10(:); 
m10 = mean(image10);
image10 = image10 - m10;
rms10=norm(image10)/sqrt(numel(image10));

image30 = lp30(:); 
m30 = mean(image30);
image30 = image30 - m30;
rms30=norm(image30)/sqrt(numel(image30));

image50 = lp50(:); 
m50 = mean(image50);
image50 = image50 - m50;
rms50=norm(image50)/sqrt(numel(image50));


disp(['RMS ORI = ' num2str(rms)]);
disp(['RMS Cutoff:10 = ' num2str(rms10)]);
disp(['RMS Cutoff:30 = ' num2str(rms30)]);
disp(['RMS Cutoff:30 = ' num2str(rms50)]);