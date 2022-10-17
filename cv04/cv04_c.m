function [] = cv04_c(inputImg1, inputImg2)
%cv04_c('Lc.bmp'); -console luncher
% prekopnutie z RGB do HSV

imageRGB1 = imread(inputImg1);
imageRGB2 = imread(inputImg2);

imageMetadata1 = imfinfo(inputImg1);
imageMetadata2 = imfinfo(inputImg2);

imageHSV = rgb2hsv(imageRGB);
imageH = imageHSV(:,:,1);
imageH2uint8 = uint8(imageH*255);

for i=0:max(imageH2uint8(:))
    matrixOfPresence = imageH2uint8 == i;
    hist(1, i+1) = sum(matrixOfPresence(:));
end

figure(1)
subplot(2,3,1); imshow(imageRGB(:,:,1));
subplot(2,3,2); imshow(imageRGB(:,:,2));
subplot(2,3,3); imshow(imageRGB(:,:,3));
subplot(2,3,4); imshow(imageHSV(:,:,1));
subplot(2,3,5); imshow(imageHSV(:,:,2));
subplot(2,3,6); imshow(imageHSV(:,:,3));

figure(2)
stem(hist);

end

