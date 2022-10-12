function [outputhist] = cv03_DU_a(inputImg)
%lienarny histogram

%[whateverOutput] = cv03_DU_a('Lc.bmp', 2); -console luncher

inputImage = imread(inputImg);
imgMetadata = imfinfo(inputImg);

imgColor= rgb2gray(inputImage);

cv03_DU_3hister(inputImage);
function [Rhist, Ghist, Bhist] = cv03_DU_3hister(inputImage)
    
    imgR = inputImage(:,:,1); % Red channel
    imgG = inputImage(:,:,2); % Green channel
    imgB = inputImage(:,:,3); % Blue channel
    
    for i=0:255
        maticaVyskytuR = imgR == i;
        Rhist(1,i+1) = sum(maticaVyskytuR(:));
        
        maticaVyskytuG = imgG == i;
        Ghist(1,i+1) = sum(maticaVyskytuG(:));
        
        maticaVyskytuB = imgB == i;
        Bhist(1,i+1) = sum(maticaVyskytuB(:));
    end
    subplot(2,2,1); imshow(inputImage);
    subplot(2,2,2); stem(Rhist);
    subplot(2,2,3); stem(Ghist);
    subplot(2,2,4); stem(Bhist);
end


end