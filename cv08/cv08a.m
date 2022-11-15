function [imageNoised, imageFiltered] = cv08a(inputImage, noiseType, filterSize, filterType, paramNoise)
%CV08A Summary of this function goes here
%   Detailed explanation goes here
% [imageNoised, imageFiltered] = cv08a('Lena.png', 'G', 3, 'minFilter', 0.01)
image = imread(inputImage);
imageMeta = imfinfo(inputImage);
imageGray = rgb2gray(image);
imageFiltered = uint8(zeros(imageMeta.Width:imageMeta.Height));
% imageDiff = uint8(zeros(imageMeta.Width:imageMeta.Height));

if strcmp(noiseType, 'G')
    imageNoised = imnoise(imageGray,"gaussian", paramNoise);
elseif strcmp(noiseType, 'SaP')
    imageNoised = imnoise(imageGray,"salt & pepper", paramNoise);
end
windowLeft = (filterSize+1)/2;
windowRight = windowLeft-1;

if strcmp(filterType, 'minFilter')
    for i=windowLeft:imageMeta.Width-windowRight
        for j=windowLeft:imageMeta.Height-windowRight
            inpMatrix = imageNoised(i-windowRight:i+windowRight, j-windowRight:j+windowRight);
            imageFiltered(i,j) = min(inpMatrix(:));
        end
    end
elseif strcmp(filterType, 'maxFilter')
    for i=windowLeft:imageMeta.Width-windowRight
        for j=windowLeft:imageMeta.Height-windowRight
            inpMatrix = imageNoised(i-windowRight:i+windowRight, j-windowRight:j+windowRight);
            imageFiltered(i,j) = max(inpMatrix(:));
        end
    end
elseif strcmp(filterType, 'medianFilter')
    for i=windowLeft:imageMeta.Width-windowRight
        for j=windowLeft:imageMeta.Height-windowRight
            inpMatrix = imageNoised(i-windowRight:i+windowRight, j-windowRight:j+windowRight);
            imageFiltered(i,j) = median(inpMatrix(:));
        end
    end
elseif strcmp(filterType, 'averageFilter')
    for i=windowLeft:imageMeta.Width-windowRight
        for j=windowLeft:imageMeta.Height-windowRight
            inpMatrix = imageNoised(i-windowRight:i+windowRight, j-windowRight:j+windowRight);
            imageFiltered(i,j) = mean(inpMatrix(:));
        end
    end
elseif strcmp(filterType, 'gauss3Filter')

    W = [0 1/6 0; 1/6 1/3 1/6; 0 1/6 0];
    for i=windowLeft:imageMeta.Width-windowRight
        for j=windowLeft:imageMeta.Height-windowRight
            inpMatrix = imageNoised(i-windowRight:i+windowRight, j-windowRight:j+windowRight);
            imageFiltered(i,j) = uint8(sum(sum(double(inpMatrix).*W)));
        end
    end
elseif strcmp(filterType, 'ordGauss3Filter')

    W = [0 1/6 0, 1/6 1/3 1/6, 0 1/6 0];
    for i=windowLeft:imageMeta.Width-windowRight
        for j=windowLeft:imageMeta.Height-windowRight
            inpMatrix = imageNoised(i-windowRight:i+windowRight, j-windowRight:j+windowRight);
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

