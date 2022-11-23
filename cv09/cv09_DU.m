function cv09_DU (referenceImg, inputImg, velkostOkna , numberOfTops)
% cv09_DU ('../Lc.bmp', 'lena_hires.png', 64, 10);
% z maleho img vytovor DB dct aka dictionary a podla niecoho zakoduj iny
% img pomocou dictionary (najvacsia zhoda)
% + urobit zoznam most used dct's from DB 

imgReference = imread(referenceImg);
imgReference = rgb2gray(imgReference);
inputImg = imread(inputImg);
inputImg = rgb2gray(inputImg);
metadata = imfinfo(referenceImg);

%good to know
% DCT z velkeho okna (rozmeru) je vypoctova natocna vela kombinacii
vyska = sqrt(velkostOkna);
sirka = vyska;

    function DCT_database = dtcDatabase(image, rozmer_okna)
        posY = 0;
        posX = 0;
        for y = 1:rozmer_okna:(size(image, 1))
            posY = posY + 1; 
            for x = 1:rozmer_okna:(size(image, 2)) 
                posX = posX + 1;
                DCT_database{posY, posX} = dct2(image(y:y+rozmer_okna-1,...
                    x:x+rozmer_okna-1));
            end
            posX = 0;
        end
    end
    
    function zagged = zigzag_cells(DCT_cells, rozmer_okna)
        for y = 1:size(DCT_cells, 1)
            for x = 1:size(DCT_cells, 2)
                zagged{y, x} = zigsc(DCT_cells{y, x}, rozmer_okna);
            end
        end
    end
    function inverse_output = recoverImage(DCT_cells, rozmer_okna)
        for y = 1:size(DCT_cells, 1)
            for x = 1:size(DCT_cells, 2)
                inverse_zigzag{y, x} = izigsc(DCT_cells{y, x}, rozmer_okna);
                inverse_dct{y, x} = idct2(inverse_zigzag{y,x});
            end
        end
        inverse_output = spreadCells21matrix(inverse_dct, rozmer_okna);
    end
    function outputImg = spreadCells21matrix(imgInCells, rozmer_okna)
        posY = 0;
        posX = 0;
        Img = zeros(size(imgInCells, 1)*rozmer_okna, ...
            size(imgInCells, 2)*rozmer_okna );
        for y = 1:rozmer_okna:(size(Img, 1))
            posY = posY + 1; 
            for x = 1:rozmer_okna:(size(Img, 2)) 
                posX = posX + 1;
                Img(y:y+rozmer_okna-1, x:x+rozmer_okna-1) = imgInCells{posY,posX};
            end
            posX = 0;
        end
        outputImg = Img;
   end

    function [encodedImg, counter]= compare_DCTs(DCT_DB, imgDCT)
        counter = zeros(size(DCT_DB, 1), size(DCT_DB, 2));
        for y = 1:size(imgDCT, 1)
            for x = 1:size(imgDCT, 2)
                [posX, posY] = findMatch(DCT_DB, imgDCT{y, x});
                encodedImg{y, x} = DCT_DB{posY, posX};
                counter(posY, posX) = counter(posY, posX)+1;
            end
        end
    end
    function [posX, posY]= findMatch(DCT_DB, DCT)
        minimum = 999999999999999999999;
        for y = 1:size(DCT_DB, 1)
            for x = 1:size(DCT_DB, 2)
                difference = sum(sum(abs(abs(DCT_DB{y, x}) - abs(DCT))));
                if(minimum > difference)
                    minimum = difference;
                    posY = y;
                    posX = x;
                end
            end
        end
        %bestMatch = minimum;
    end
    
    function tops = maxFinder(counter, numOfTops, DB)
        figure;
        for i = 1:numOfTops
            [maxValue, linearIndexesOfMaxes] = max(counter(:));
            [rowsOfMaxes, colsOfMaxes] = find(counter == maxValue,1,'first');
            tops{i} = [rowsOfMaxes colsOfMaxes];
            subplot(1,numOfTops,i);
            imshow(uint8(idct2(DB{rowsOfMaxes, colsOfMaxes})));
            title(counter(rowsOfMaxes, colsOfMaxes));
            counter(rowsOfMaxes, colsOfMaxes) = 0;            
        end
    end
            
    
DCT_DB = dtcDatabase(imgReference, vyska);
img_dct = dtcDatabase(inputImg, vyska);


zigzagDCT_DB = zigzag_cells(DCT_DB, vyska);  
zigzagImgDCT = zigzag_cells(img_dct, vyska);

[encodedImg, counter] = compare_DCTs(zigzagDCT_DB, zigzagImgDCT);
recoveredImg = recoverImage(encodedImg, vyska);
recoveredImg = uint8(recoveredImg);

imgDiff = imabsdiff(inputImg, recoveredImg);

subplot(1,4,1);imshow(imgReference);title('Dataset');
subplot(1,4,2);imshow(inputImg);title('InputImg');
subplot(1,4,3);imshow(recoveredImg);title('recovered Image');
subplot(1,4,4);imshow(imgDiff);title('Img difference input vs rocovered');

maxFinder(counter, numberOfTops, DCT_DB);
end
