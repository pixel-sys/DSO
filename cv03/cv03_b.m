function [outputImg] = cv03_b(inputImg, bitScale)
%lienarny histogram

%[imageLena] = cv03_b('Lc.bmp', 2); -console luncher

inputImage = imread(inputImg);
imgMetadata = imfinfo(inputImg);

imgGrey = rgb2gray(inputImage);

%Biny - nvm co to je nikto mi to nechce vysvetlit
%kolko je binov pri novej bitovej hlbke
pocetBinov = 2^bitScale;
assignin('base','pocetBinov',pocetBinov);

% vypocitaj velkost kroku
krok = 2^(imgMetadata.BitDepth/3)/pocetBinov;
assignin('base','krok',krok);

A= round(imgGrey/krok);
%vynasob urovne krokom pre upscale do 256
outputImg = A*krok;
assignin('base','outputImg',outputImg);

%urob histogram 
for i=0:255
    maticaVyskytu = imgGrey == i;
    hist(1,i+1) = sum(maticaVyskytu(:));
   
    maticaVyskytuReduced = outputImg == i;
    histReduced(1,i+1) = sum(maticaVyskytuReduced(:));
   % figure(2); imshow(maticaVyskytu,[0 1]); pause;
end


subplot(2,2,1); imshow(imgGrey);
subplot(2,2,2); stem(hist);
subplot(2,2,3); imshow(outputImg);
subplot(2,2,4); stem(histReduced);


end

