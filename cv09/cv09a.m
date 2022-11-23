function cv09a (inputImage,velkostOkna,pocetPlatnychKoef)
% cv09a ('../Lc.bmp', 16, 5);

inputimg = imread(inputImage);
inputimg = rgb2gray(inputimg);
metadata = imfinfo(inputImage);

vyska = sqrt(velkostOkna);
sirka = vyska;

% DCT_img = zeros(metadata.Height,metadata.Width);

for i = 1:vyska:(metadata.Height)
    for j = 1:sirka:(metadata.Width)
        dctKoefMatrix = dct2(inputimg(i:i+vyska-1,j:j+sirka-1));
        
        [dctKoefVect] = zigsc(dctKoefMatrix,vyska);
        dctKoefVect(pocetPlatnychKoef+1:velkostOkna) = 0;
        idctKoefMatrix = izigsc(dctKoefVect,vyska);

        dct_spatna = idct2(idctKoefMatrix);
        outputImg(i:i+vyska-1,j:j+sirka-1) = uint8(dct_spatna);
   
    end
end

rozdiel = imabsdiff(inputimg, outputImg);

subplot(1,3,1);imshow(inputimg);
subplot(1,3,2);imshow(outputImg);
subplot(1,3,3);imshow(rozdiel);

end
