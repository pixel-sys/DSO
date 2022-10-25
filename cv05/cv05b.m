function [Gx] = cv05b(inputImg,threshold)
% cv05b('Lena.png')
% [Gx]=cv05b('Lena.png');
%načitanie obrázku a hranová detekcia , prewitov operátor na detekciu 
%hrán v X smere
inputImage = imread(inputImg);
inputImageGray = double(rgb2gray(inputImage));
%inputImageEdge = edge(inputImageGray);
imgData = imfinfo(inputImg);
outputImage=zeros(imgData.Width,imgData.Height);
Gx=zeros(imgData.Width,imgData.Height);
Gx2=zeros(imgData.Width,imgData.Height);
Gy=zeros(imgData.Width,imgData.Height);
% X matica
PrewittX = [-1 0 1; -1 0 1; -1 0 1];
PrewittX2 = [1 0 -1; 1 0 -1; 1 0 -1];
PrewittY = [-1 -1 -1; 0 0 0; 1 1 1];

for i= 2:imgData.Width-1
    for j= 2:imgData.Height-1
    inputMatrix=inputImageGray(i-1:i+1,j-1:j+1);
    Gx(i , j) = sum(sum(PrewittX.*inputMatrix));
    Gx2(i , j) = sum(sum(PrewittX2.*inputMatrix));
    Gy(i , j) = sum(sum(PrewittY.*inputMatrix));
    end
end
EdgeImgX=Gx>=threshold;
EdgeImgY=Gy>=threshold;


subplot(2,2,1);imshow(Gx);
subplot(2,2,2);imshow(EdgeImgX);
subplot(2,2,3);imshow(Gy);
subplot(2,2,4);imshow(EdgeImgY);

end