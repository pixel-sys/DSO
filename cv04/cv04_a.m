function cv04_a(inputImg)
%cv04_a('Lc.bmp'); -console luncher

InputImage = imread(inputImg);

prescalovanyImage = uint64(InputImage(:,:,1)) + uint64(InputImage(:,:,2))*10 + uint64(InputImage(:,:,3))*100;

for i = 0:max(prescalovanyImage(:))
    maticaVyskytu = prescalovanyImage == i;
    hist(1,i+1) = sum (maticaVyskytu(:));
end

bar(hist)

end

