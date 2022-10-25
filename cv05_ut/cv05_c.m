function [outputArg1,outputArg2] = cv05_c(inputImg, numOfRows, distance, angle)
% matica korelacii ROI


inputImage = imread(inputImg);
imageMetadata = imfinfo(inputImg);

vyskaImg = imageMetadata.Height;
sirkaImg = imageMetadata.Width;

%ROI
vyskaKvadrantu = vyskaImg / numOfRows;
sirkaKvadrantu= sirkaImg / numOfColums;

sedyImg = rgb2gray(inputImage);
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