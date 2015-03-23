img = imread('D:\Users\fleabag\Documents\MATLAB\Image\chess.pgm');

subplot(2,2,1)
imshow(img);
title('PGM');

kernel = [1 1 1 1
          1 1 1 1
          1 1 1 1
          1 1 1 1];

conimg = conv2(double(img), kernel, 'same');

F = fft2(double(img));
padkernel= padarray(kernel,[126 126]);
Fpad = fft2(padkernel);
%disp(size(padkernel));
crossimg = F.*Fpad;

icross = ifft2(crossimg);

subplot(2,2,2)
imshow(mat2gray(conimg));
title('Blur with Convolute');

subplot(2,2,3)
imshow(mat2gray(abs(icross)));
title('Blur with FFT');

%subplot(2,2,3)
%imshow(mat2gray(angle(F)));
%title('Phase Spectra');






