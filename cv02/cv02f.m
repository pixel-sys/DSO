function [outputImg] = cv02f(inputImg)
%[imageLena] = cv02f('Lc.bmp'); -console luncher

inputImage = imread(inputImg);
imgMetadata = imfinfo(inputImg);

channelR(:,:,1) = inputImage(:,:,1); energyR = sum(channelR(:));
channelG(:,:,1) = inputImage(:,:,2); energyG = sum(channelG(:));
channelB(:,:,1) = inputImage(:,:,3); energyB = sum(channelB(:));
[energyR energyG energyB];

outputImg(:,:,1) = channelR;
outputImg(:,:,2) = channelG;
outputImg(:,:,3) = channelB;

subplot(1,2,1); imshow(inputImg);
subplot(1,2,2); imshow(outputImg);

[rb] = corr2(channelR,channelB);
[gb] = corr2(channelG,channelB);
[rg] = corr2(channelR,channelG);

corrMatrix = [1, rg, rb; rg, 1, gb; rb, gb, 1]

end