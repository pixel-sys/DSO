function [outputImg] = cv03_a(inputImg, bitScale)
%lienarny histogram

%[imageLena] = cv03_a('Lc.bmp', 2); -console luncher

inputImage = imread(inputImg);
imgMetadata = imfinfo(inputImg);

imgGrey = rgb2gray(inputImage);

%Biny - nvm co to je nikto mi to nechce vysvetlit
%kolko je binov pri novej bitovej hlbke
pocetBinov = 2^bitScale;

% vypocitaj velkost kroku
krok = 2^(imgMetadata.BitDepth/3)/pocetBinov;

A= round(imgGrey/krok);
outputImg = A*krok;

subplot(1,2,1); imshow(imgGrey);
subplot(1,2,2); imshow(outputImg);

end

