function [outputhist] = cv03_DU_a(inputImg)
%lienarny histogram

%[whateverOutput] = cv03_DU_a('Lc.bmp', 2); -console luncher

inputImage = imread(inputImg);
imgMetadata = imfinfo(inputImg);

imgColor= rgb2gray(inputImage);

cv03_DU_3hister(inputImage);
function [hist] = cv03_DU_3hister(inputImage)
%not tessted 
   for j=1:3
    for i=0:255
        maticaVyskytu(j) = inputImage(:,:,j) == i;
        hist(1,i+1) = sum(maticaVyskytu(j,:));
    end
   end

    subplot(2,2,1); imshow(inputImage);
    subplot(2,2,2); stem(Rhist);
    subplot(2,2,3); stem(Ghist);
    subplot(2,2,4); stem(Bhist);

end

end