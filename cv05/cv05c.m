function [Gx] = cv05c(inputImg,threshold)
% cv05c('Lena.png',0)
% [Gx]=cv05b('Lena.png');
%načitanie obrázku a hranová detekcia , sobel operátor na detekciu 
%hrán v X smere
inputImage = imread(inputImg);
inputImageGray = double(rgb2gray(inputImage));
%inputImageEdge = edge(inputImageGray);
imgData = imfinfo(inputImg);

Gx=zeros(imgData.Width,imgData.Height);
Gy=zeros(imgData.Width,imgData.Height);
% X matica
SobelX = [-1 0 1; -2 0 2; -1 0 1];
SobelY = [-1 -2 -1; 0 0 0; 1 2 1];

for i= 2:imgData.Width-1
    for j= 2:imgData.Height-1
    inputMatrix=inputImageGray(i-1:i+1,j-1:j+1);
    Gx(i , j) = sum(sum(SobelX.*inputMatrix));
    
    Gy(i , j) = sum(sum(SobelY.*inputMatrix));
    end
end
EdgeImgX=Gx>=threshold;
EdgeImgY=Gy>=threshold;


subplot(2,2,1);imshow(Gx);
subplot(2,2,2);imshow(EdgeImgX);
subplot(2,2,3);imshow(Gy);
subplot(2,2,4);imshow(EdgeImgY);

end