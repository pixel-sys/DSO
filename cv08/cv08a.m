function [imageNoised, imageFiltered] = cv08a(inputImage, noiseType, paramNoise, filterSize, filterType)
%CV08A Summary of this function goes here
%   Detailed explanation goes here
% [imageNoised, imageFiltered] = cv08a('../Lc.bmp', 'G', 0.01, 3, 'minFilter')

image = imread(inputImage);
imageMeta = imfinfo(inputImage);
imageGray = rgb2gray(image);

switch noiseType
    case 'G'
        imageNoised = imnoise(imageGray,"gaussian", paramNoise);
    case 'SaP'
        imageNoised = imnoise(imageGray,"salt & pepper", paramNoise);
end

imageFiltered = uint8(zeros(imageMeta.Width:imageMeta.Height));
% imageDiff = uint8(zeros(imageMeta.Width:imageMeta.Height));

windowLeft = (filterSize+1)/2;
windowRight = windowLeft-1;

for i=windowLeft:imageMeta.Width-windowRight
    for j=windowLeft:imageMeta.Height-windowRight
        inpMatrix = imageNoised(i-windowRight:i+windowRight, ...
                    j-windowRight:j+windowRight);
        switch filterType
            case 'minFilter'
                imageFiltered(i,j) = min(inpMatrix(:));
            case 'maxFilter'
                imageFiltered(i,j) = max(inpMatrix(:));
            case 'medianFilter'
                imageFiltered(i,j) = median(inpMatrix(:));
            case 'averageFilter'
                imageFiltered(i,j) = mean(inpMatrix(:));
            case 'gauss3Filter'
                W = [0 1/6 0; 1/6 1/3 1/6; 0 1/6 0];
                imageFiltered(i,j) = uint8(sum(sum(double(inpMatrix).*W)));
            case 'ordGauss3Filter'
                W = [0 1/6 0, 1/6 1/3 1/6, 0 1/6 0];
                inpMatrixResized = sort(imresize(inpMatrix, [1 9]));
                imageFiltered(i,j) = uint8(sum(double(inpMatrixResized).*W));
        end
    end
end
            


% imageDiff = imabsdiff(imageGray,imageNoised);
imageDiffOvsN = 128+(imageGray-imageNoised);
imageDiffOvsF = imabsdiff(imageGray, imageFiltered);

MAEOvsN = sum(sum(abs(imageGray-imageNoised)));
MAEOvsF = sum(sum(abs(imageGray-imageFiltered)));
MSEOvsN = sum(sum((imageGray-imageNoised).^2));
MSEOvsF = sum(sum((imageGray-imageFiltered).^2));
[MAEOvsN MAEOvsF MSEOvsN MSEOvsF]

subplot(1,5,1); imshow(imageGray);
subplot(1,5,2); imshow(imageNoised);
subplot(1,5,3); imshow(imageDiffOvsN);
subplot(1,5,4); imshow(imageFiltered);
subplot(1,5,5); imshow(imageDiffOvsF, []);

end

