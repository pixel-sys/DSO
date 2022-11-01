function cv06a(imgName)
%cv06a("Lena.png")

img = imread(imgName);
grayImg = double(rgb2gray(img));

Gx = edge(grayImg,"sobel",0.5,"vertical");
Gy = edge(grayImg,"sobel",0.5,"horizontal");

energyX = sum(sum(Gx))
energyY = sum(sum(Gy))

if (energyX > energyY)
    disp("Vertikalny smer")
else if (energyY > energyX)
    disp("Horizontalny smer")
else
    disp("Ziadny zo smerov nie je dominantny")
end

end