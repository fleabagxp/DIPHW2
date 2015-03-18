img = imread('D:\Users\fleabag\Documents\MATLAB\Image\cross.pgm');
I = ones(size(img));
Lr = imrotate(img, 30,'crop','bilinear');
Ir = imrotate(I, 30,'crop','bilinear');
Lr(Ir==0) = 255;


%imgrt = imrotate(img, 30, 'crop', 'bilinear');

subplot(2,2,1)
imshow(Lr);
title('PGM');

F = fft2(Lr);

subplot(2,2,2)
imshow(mat2gray(log(1+abs(fftshift(F))))); % Display the result
title('Amplitude');

subplot(2,2,3)
imshow(mat2gray(angle(F)));
title('Phase Spectra');




