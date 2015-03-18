img = imread('D:\Users\fleabag\Documents\MATLAB\Image\Chess_noise.pgm');
oriimg = imread('D:\Users\fleabag\Documents\MATLAB\Image\Chess.pgm');

subplot(2,2,1)
imshow(img);
title('PGM');

Fori = im2double(oriimg);

N5=5;
N15=15;
N25=25;
img_col5 = im2col(img, [N5 N5], 'sliding');
sorted_cols5 = sort(img_col5, 1, 'ascend');
med_vector5 = sorted_cols5(floor(N5*N5/2) + 1, :);
median5 = col2im(med_vector5, [N5 N5], size(img), 'sliding');

img_col15 = im2col(img, [N15 N15], 'sliding');
sorted_cols15 = sort(img_col15, 1, 'ascend');
med_vector15 = sorted_cols15(floor(N15*N15/2) + 1, :);
median15 = col2im(med_vector15, [N15 N15], size(img), 'sliding');

img_col25 = im2col(img, [N25 N25], 'sliding');
sorted_cols25 = sort(img_col25, 1, 'ascend');
med_vector25 = sorted_cols25(floor(N25*N25/2) + 1, :);
median25 = col2im(med_vector25, [N25 N25], size(img), 'sliding');





subplot(2,2,2)
imshow(median5,[]); 
title('Median Filter N=5');

subplot(2,2,3)
imshow(median15,[]); 
title('Median Filter N=15');

subplot(2,2,4)
imshow(median25,[]); 
title('Median Filter N=25');


image = Fori(:);
m = mean(image);
image = image - m;
rms=norm(image)/sqrt(numel(image));

image5 = im2double(median5(:)); 
m5 = mean(image5);
image5 = image5 - m5;
rms5=norm(image5)/sqrt(numel(image5));

image15 = im2double(median15(:)); 
m15 = mean(image15);
image15 = image15 - m15;
rms15=norm(image15)/sqrt(numel(image15));

image25 = im2double(median25(:)); 
m25 = mean(image25);
image25 = image25 - m25;
rms25=norm(image25)/sqrt(numel(image25));


disp(['RMS ORI = ' num2str(rms)]);
disp(['RMS Cutoff:10 = ' num2str(rms5)]);
disp(['RMS Cutoff:30 = ' num2str(rms15)]);
disp(['RMS Cutoff:30 = ' num2str(rms25)]);





