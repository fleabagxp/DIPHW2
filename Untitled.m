img = imread('D:\Users\fleabag\Documents\MATLAB\Image\cross.pgm');

subplot(2,2,1)
imshow(img);
title('PGM');

F = fft2(img);

subplot(2,2,2)
imshow(mat2gray(angle(F)));
title('Amplitude');

subplot(2,2,3)
imshow(mat2gray(log(1+abs(fftshift(F))))); % Display the result
title('Phase Spectra');




