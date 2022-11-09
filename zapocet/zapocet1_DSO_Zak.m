function [] = zapocet1_DSO_Zak(inputImg, pocetBlokov, vzdialenost, uhol)
%zapocet1_DSO_Zak('../Lc.bmp', 16, 1, 0);

%Xaver Zak
%zapocet DSO 2.11.2022

inputImage = imread(inputImg);
imageMetadata = imfinfo(inputImg);
imageGray = rgb2gray(inputImage);

vyskaImg = imageMetadata.Height;
sirkaImg = imageMetadata.Width;

part = round(sqrt(pocetBlokov));
partHeight = round(vyskaImg/part);
partWidth = round(sirkaImg/part);

for i=1:part
for j=1:part
    partImage_orig{i,j} = inputImage(1+partHeight*(i-1):partHeight*(i),1+partWidth*(j-1):partWidth*(j),:);
    %parsuj gray img 
    partImage{i,j} = imageGray(1+partHeight*(i-1):partHeight*(i),1+partWidth*(j-1):partWidth*(j),:);
    %sprav GLCM z grayimg podla vstupu uhol+ distance
    GLCM{i,j} = graycomatrix(partImage{i,j},'Offset',[uhol vzdialenost]);
    
    % uloha 3 urob GLCM pre uhol 0 a distance 1
    GLCM_uloha3{i,j} = graycomatrix(partImage{i,j},'Offset',[0 1]);
    %hodnota priznaku kontrastu pre rozparsovany img
    hodnotaPriznaku{i,j} = graycoprops(GLCM_uloha3{i,j},{'contrast'}) ;
    T{i,j}= (hodnotaPriznaku{i,j}.Contrast);
    
end
end

T1 = cell2mat(T);
%figure;
counter =1;
%sort part images na based on their contrast from Min-->Max + show in
%subplot
for i=1:part
for j=1:part
     min_num=min(T1(:)); 
     [X,Y]=ind2sub(size(T1),find(T1==min_num));
     
     partImage_sorted{i,j} = partImage_orig{X,Y};
     
     subplot(part, part, counter);
     
     imshow(partImage_sorted{i,j}); 
     title(num2str(min_num));
     
     T1(X, Y) = 999;
     counter = counter +1; 
end
end

end

