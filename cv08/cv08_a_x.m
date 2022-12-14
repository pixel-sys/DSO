function [] = cv08_a_x(inputImg, noiseType, koeficient)
%cv08_a_x('../Lc.bmp', 'gauss', 0.3);

%   Detailed explanation goes here

inputImage = imread(inputImg);
imageMetadata = imfinfo(inputImg);
imageGray = rgb2gray(inputImage);

zasumenyImg = 0;

        imageDiff = imabsdiff(imageGray, zasumenyImg);
        odsumenyImg = wiener2(zasumenyImg,[3 3]);
    case 'poisson'
        zasumenyImg = imnoise(imageGray, 'poisson');
        imageDiff = imabsdiff(imageGray, zasumenyImg);
        odsumenyImg = wiener2(zasumenyImg,[3 3]);
    case 'salt'
switch noiseType
    case 'gauss'
        zasumenyImg = imnoise(imageGray, 'gaussian', koeficient);
        zasumenyImg = imnoise(imageGray, 'salt & pepper', koeficient);
        imageDiff = imabsdiff(imageGray, zasumenyImg);
        odsumenyImg = medfilt2(zasumenyImg, [2 2]);
end


subplot(1,4,1); imshow(imageGray);
subplot(1,4,2); imshow(zasumenyImg);
subplot(1,4,3); imshow(imageDiff);
subplot(1,4,4); imshow(odsumenyImg);


end

