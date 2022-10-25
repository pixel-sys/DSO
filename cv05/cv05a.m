function [Gx] = cv05a(inputImg,trashHold)
% cv05a('Lena.png')
% [Gx]=cv05a('Lena.png');
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
%     X= sum(sum(PrewittX.*inputMatrix));
%     Y=sum(sum(PrewittY.*inputMatrix));
%     [Gx Gy]
%     pause;
    end
end
[min(Gx(:)) max(Gx(:))]
%inputImageGray
%imshow(inputImageEdge);
%imshow(inputImageGray);
subplot(1,3,1);imshow(Gx);
subplot(1,3,2);imshow(Gx2);
subplot(1,3,3);imshow(Gy);

end