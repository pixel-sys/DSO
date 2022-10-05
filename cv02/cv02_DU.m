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
WKvadrantu = (imgMetadata.Width / pocetStlpcov)-1;
HKvadrantu = (imgMetadata.Height / pocetRiadkov)-1;

for i = 1:pocetStlpcov
   for j = 1:pocetRiadkov
        k = inputImage((j*WKvadrantu):(j*WKvadrantu+WKvadrantu), (i*HKvadrantu):(i*HKvadrantu+HKvadrantu), :);
        K{j,i} = k;
   end
end


end