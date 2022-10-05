function [outputImg] = cv02_DU(inputImg, pocetRiadkov, pocetStlpcov)
%[imageLena] = cv02_DU('Lc.bmp',4,4); -console luncher

inputImage = imread(inputImg);
imgMetadata = imfinfo(inputImg);

%kontrola ci je vyska obr delitelna poctom zadanych riadkov
if(mod(imgMetadata.Height, pocetRiadkov)~= 0)
    error('nespravny pocet riadkov')
end
%kontrola ci je sirka obr delitelna poctom zadanych stlpcov
if(mod(imgMetadata.Width, pocetStlpcov)~= 0)
    error('nespravny pocet stlpcov')
end 

%k[pocetRiadkov, pocetStlpcov] = zeros;
sirkaKvadrantu = imgMetadata.Width / pocetStlpcov;
vyskaKvadrantu = imgMetadata.Height / pocetRiadkov;

for i = 1:pocetStlpcov
   for j = 1:pocetRiadkov
        k = inputImage((j*sirkaKvadrantu):(j*sirkaKvadrantu+sirkaKvadrantu), (i*vyskaKvadrantu):(i*vyskaKvadrantu+vyskaKvadrantu), :);
        K{j,i} = k;
   end
end


end