function [GLCM] = cv06b(inputImage, vzdialenost)
% [GLCM] = cv06b('Lena.png',1);

inputImg = rgb2gray(imread(inputImage));
imgMetadata = imfinfo (inputImage);

GLCM = uint16(zeros(imgMetadata.Width,imgMetadata.Height));

odsadenie = vzdialenost-1;
h=waitbar(0,'Please wait...');

for i=1:(imgMetadata.Height)
    for j = 1:(imgMetadata.Width-vzdialenost)
        GLCMx = inputImg (i,j);
        GLCMy = inputImg (i,j+vzdialenost);
%         [GLCMx GLCMy]
%         pause
        GLCM (GLCMx,GLCMy) = GLCM (GLCMx,GLCMy)+1;
    end
waitbar(i/imgMetadata.Height,h);
end
imshow(GLCM,[]);
close(h);


