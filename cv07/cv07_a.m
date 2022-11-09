function [] = cv07_a(inputImg, noiseType, koeficient)
%cv07_a('../Lc.bmp', 'gauss', 0.3);

%   Detailed explanation goes here

inputImage = imread(inputImg);
imageMetadata = imfinfo(inputImg);
imageGray = rgb2gray(inputImage);

zasumenyImg = 0;

switch noiseType
    case 'gauss'
        zasumenyImg = imnoise(imageGray, 'gaussian', koeficient);
        imageDiff = imabsdiff(imageGray, zasumenyImg);
        odsumenyImg = wiener2(zasumenyImg,[3 3]);
    case 'poisson'
        zasumenyImg = imnoise(imageGray, 'poisson');
        imageDiff = imabsdiff(imageGray, zasumenyImg);
        odsumenyImg = wiener2(zasumenyImg,[3 3]);
    case 'salt'
        zasumenyImg = imnoise(imageGray, 'salt & pepper', koeficient);
        imageDiff = imabsdiff(imageGray, zasumenyImg);
        odsumenyImg = medfilt2(zasumenyImg);
end


subplot(1,4,1); imshow(imageGray);
subplot(1,4,2); imshow(zasumenyImg);
subplot(1,4,3); imshow(imageDiff);
subplot(1,4,4); imshow(odsumenyImg);


end

