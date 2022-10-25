function [outputArg1,outputArg2] = cv05_b(inputImg, numOfRows, numOfColums, threshold)
%dikretna kosinuva transformacia
%   trehshold - od kade ma zacat odrezavat vysokofrekvencne zlozky

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
        part = sedyImg(1+vyskaKvadrantu*(i-1):vyskaKvadrantu*(i), ...
                       1+sirkaKvadrantu*(j-1):sirkaKvadrantu*(j),:);
        dctPart = dct2(part);
        zigzagVector = zigzag(dctPart);
        zigzagVector(threshold:length(zigzagVector)) = 0;

        izigzagMatrix = izigzag(zigzagVector, vyskaKvadrantu, sirkaKvadrantu);
        %disp(izigzagMatrix);
        
        iDctPart = idct2(izigzagMatrix);
        newIMAGE(vyskaKvadrantu * (i-1)+1 : vyskaKvadrantu * (i), ...
            sirkaKvadrantu * (j-1) + 1 : sirkaKvadrantu*j, :) = iDctPart;
    end
end
subplot(1,3,1); imshow(sedyImg);
subplot(1,3,2); imshow(uint8(newIMAGE));

subdivided = sedyImg - uint8(newIMAGE);
subplot(1,3,3);imshow(subdivided);

end