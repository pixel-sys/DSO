function [] = cv08_DU(inputImg, paramNoise, filterSize)
%Description
% Urobte filter ktory bude pre filtraciu vektoroveho obrazku 
% a ked bude filtrovat cerveny kanal bude vyuzivataj modry aj zeleny kanal
% 
% cv08_DU('../Lc.bmp', 0.1, 3);

inputImage = imread(inputImg);
%imageMetadata = imfinfo(inputImg);
imageNoised = imnoise(inputImage,'gaussian', paramNoise);
imageDenoised = imageNoised;

    function greenFiltered = greenFilter(inputImg)
        h = fspecial('gaussian', 3, 0.7);
        greenFiltered = imfilter(inputImg, h);
    end 
    function blueFiltered = blueFilter(inputImg)
        blueFiltered = wiener2(inputImg, [5 5]);
    end 
    function redFiltered = redFilter(inputImg)
        R = inputImg(:,:,1);
        G = inputImg(:,:,2);
        B = inputImg(:,:,3);
        energyR = abs(abs(R));
        energyG = abs(abs(G));
        energyB = abs(abs(B));
        
        diffBlue = abs(R - G);
        diffGreen= abs(R - B);

        redFiltered = zeros(size(R,1), size(R,2));
        threshold = 33;
        for i = 1:size(R,1)
            for j = 1:size(R,2)
                if diffBlue(i,j) > threshold || diffGreen(i,j) > threshold
                    redFiltered(i,j) = G(i,j);
                else
                    redFiltered(i,j)= R(i,j);
                    
                end
            end
        end
        
    end

%filrovanie green channelu
imageDenoised(:,:,2) = greenFilter(imageNoised(:,:,2));
%filrovanie blue channelu
imageDenoised(:,:,3) = blueFilter(imageNoised(:,:,3));

subplot(1,3,1); imshow(imageNoised);
subplot(1,3,2); imshow(imageDenoised);

%filrovanie red channelu
imageDenoised(:,:,1) = redFilter(imageNoised);
subplot(1,3,3); imshow(imageDenoised);


end