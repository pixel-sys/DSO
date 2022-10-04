function [imageLena] = cv02b(inputImage)
%[outputArg1] = cv02a(lena.png)  - ako volat funkciu
%imread("lena.png")
%imread(Lc.bmp)

imageLena = imread(inputImage);
imgInfo = imfinfo(inputImage);

k1 = imageLena (1:128, 1:128, :);
k2 = imageLena (129:256, 1:128, :);
k3 = imageLena (1:128, 129:256, :);
k4 = imageLena (129:256, 129:256, :);

subplot(2,2,1); imshow(k1);
subplot(2,2,2); imshow(k2);
subplot(2,2,3); imshow(k3);
subplot(2,2,4); imshow(k4);
%k1 = imageLena(1:(imgInfo.width/2), 1:(imgInfo.height/2));

figure
imageLena = [k2,k1;k4,k3];
imshow(imageLena);
end