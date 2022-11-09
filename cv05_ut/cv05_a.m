function [outputArg1,outputArg2] = cv05_a(inputImg, numOfBits, numOfRows, numOfColums, angle, distance)
%CV05_A Summary of this function goes here
%   Detailed explanation goes here
%GLCM matica

inputImage = imread(inputImg);
imageMetadata = imfinfo(inputImg);

vyskaImg = imageMetadata.Height;
sirkaImg = imageMetadata.Width;

imgHSV = rgb2hsv(inputImage);

%subsampling(podvzorkovanie)
% ./ = po vzorkach
imgSubsample = round(inputImage./(256/(2^numOfBits)));
imgSubsample = imgSubsample.*(256/(2^numOfBits));

%ROI
vyskaPixelu = vyskaImg / numOfRows;
sirkaPixelu = sirkaImg / numOfColums;
pocitadlo = 1;
%GLCM
for i=1:numOfRows
    for j=1:numOfColums
        M(:,:,:) = rgb2gray(inputImage(1+vyskaPixelu*(i-1):vyskaPixelu*(i), ...
                       1+sirkaPixelu*(j-1):sirkaPixelu*(j),:));
        N = graycomatrix(M, "Offset", [angle distance], 'NumLevels', 256)

        subplot(numOfRows, numOfColums, pocitadlo)
        pocitadlo = pocitadlo + 1;
        imshow(N);

        title("contrast : " + greycop)
    end
end

end



