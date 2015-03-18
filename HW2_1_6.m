img = imread('D:\Users\fleabag\Documents\MATLAB\Image\lenna.pgm');

subplot(2,2,1)
imshow(img);
title('PGM');

F = fft2(img);

subplot(2,2,2)
imshow(mat2gray(ifft2(ifftshift(abs(fftshift(F)))))); % Display the result
title('Amplitude');

subplot(2,2,3)
imshow(mat2gray(abs(ifft2(ifftshift(angle(F))))));
title('Phase Spectra');






