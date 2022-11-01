function [] = cv06_bx(inputImg, distance)
% cv06_bx('../Lc.bmp')
%histogram vyskytu horizontalnej textury or sth IDK

%load img, metadata + convert to grayscale
inputImage = imread(inputImg);
imgMetadata = imfinfo(inputImg);
imageGray = rgb2gray(inputImage);

maticaVyskytu = zeros(256);
%histogram
for i= 1:imgMetadata.Width-distance
    for j= 1:imgMetadata.Height-distance
        %GLCM
        maticaVyskytu(imageGray(i, j), imageGray(i+distance, j)) = maticaVyskytu(imageGray(i, j), imageGray(i+distance, j)) + 1;
    end
end
imshow(uint8(maticaVyskytu))

end
