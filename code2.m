%Bakalis Dimitrios A.M. 3033
%Deutero Meros / Polymesa

image = imread('cameraman.tif');
figure;
imagesc(image);
title('Image');
colormap(gray);

rows = size(image,1);    % pixel values of input image
columns = size(image,2);

image_entropy = entropy(image) ;
display([image_entropy]);

% Q1

Q1 = [ [16 11 10 16 24 40 51 61];[12 12 14 19 26 58 60 55];
     [14 13 16 24 40 57 69 56];[14 17 22 29 51 87 80 62];
     [18 22 37 56 68 109 103 77];[24 35 55 64 81 104 113 92];
     [49 64 78 87 103 121 120 101];[72 92 95 98 112 100 103 99]
     ] ;

 
dct_blocks = zeros(rows,columns);

for i = 1:8:rows         % for loop with step = 8
    for j = 1:8:columns
        dct_blocks(i:(i+7),j:(j+7))= dct2(image(i:(i+7),j:(j+7)));
    end
end

quantum_blocks = zeros(rows,columns);
 
for i=1:8:rows
    for j=1:8:columns
        quantum_blocks(i:(i+7),j:(j+7)) = round(dct_blocks(i:(i+7),j:(j+7))./Q1);
    end
end

absolute_quantum_blocks = uint8(abs(quantum_blocks));
quantum_entropy = entropy(absolute_quantum_blocks);
display([quantum_entropy]);

reverse_quantum_blocks = zeros(rows,columns);
 
for i=1:8:rows
    for j=1:8:columns
        reverse_quantum_blocks(i:(i+7),j:(j+7)) = quantum_blocks(i:(i+7),j:(j+7)).* Q1;
    end
end
 
reverse_dct_blocks = zeros(rows,columns);
 
for i=1:8:rows
    for j=1:8:columns
        reverse_dct_blocks(i:(i+7),j:(j+7)) = idct2(reverse_quantum_blocks(i:(i+7),j:(j+7)));
    end
end
 
New_Image = uint8(reverse_dct_blocks);

Sums = sum(sum((double(image)-double(New_Image)).^2));
N = rows * columns ;
MSE = Sums / N ;

PSNR = 10 * log10(255*255/MSE) ;
display([PSNR]);

figure;
imagesc(New_Image);
title('New Image : Q1');
colormap(gray);

% Q2  = 3 * Q1 

Q2 = 3 * Q1;

dct_blocks = zeros(rows,columns);

for i = 1:8:rows         % for loop with step = 8
    for j = 1:8:columns
        dct_blocks(i:(i+7),j:(j+7)) = dct2(image(i:(i+7),j:(j+7)));
    end
end

quantum_blocks = zeros(rows,columns);
 
for i=1:8:rows
    for j=1:8:columns
        quantum_blocks(i:(i+7),j:(j+7)) = round(dct_blocks(i:(i+7),j:(j+7))./Q2);
    end
end

absolute_quantum_blocks = uint8(abs(quantum_blocks));
quantum_entropy = entropy(absolute_quantum_blocks);
display([quantum_entropy]);

reverse_quantum_blocks = zeros(rows,columns);
 
for i=1:8:rows
    for j=1:8:columns
        reverse_quantum_blocks(i:(i+7),j:(j+7)) = quantum_blocks(i:(i+7),j:(j+7)).* Q2;
    end
end
 
reverse_dct_blocks = zeros(rows,columns);
 
for i=1:8:rows
    for j=1:8:columns
        reverse_dct_blocks(i:(i+7),j:(j+7))= idct2(reverse_quantum_blocks(i:(i+7),j:(j+7)));
    end
end
 
New_Image = uint8(reverse_dct_blocks);

Sums = sum(sum((double(image)-double(New_Image)).^2));
N = rows * columns ;
MSE = Sums / N ;

PSNR = 10 * log10(255*255/MSE) ;
display([PSNR]);

figure;
imagesc(New_Image);
title('New Image : Q2');
colormap(gray);

% Q3  = 4 * Q1 

Q3 = 4 * Q1;

dct_blocks = zeros(rows,columns);

for i = 1:8:rows         % for loop with step = 8
    for j = 1:8:columns
        dct_blocks(i:(i+7),j:(j+7))= dct2(image(i:(i+7),j:(j+7)));
    end
end

quantum_blocks = zeros(rows,columns);
 
for i=1:8:rows
    for j=1:8:columns
        quantum_blocks(i:(i+7),j:(j+7)) = round(dct_blocks(i:(i+7),j:(j+7))./Q3);
    end
end

absolute_quantum_blocks = uint8(abs(quantum_blocks));
quantum_entropy = entropy(absolute_quantum_blocks);
display([quantum_entropy]);

reverse_quantum_blocks = zeros(rows,columns);
 
for i=1:8:rows
    for j=1:8:columns
        reverse_quantum_blocks(i:(i+7),j:(j+7)) = quantum_blocks(i:(i+7),j:(j+7)).* Q3;
    end
end
 
reverse_dct_blocks = zeros(rows,columns);
 
for i=1:8:rows
    for j=1:8:columns
        reverse_dct_blocks(i:(i+7),j:(j+7))= idct2(reverse_quantum_blocks(i:(i+7),j:(j+7)));
    end
end
 
New_Image = uint8(reverse_dct_blocks);

Sums = sum(sum((double(image)-double(New_Image)).^2));
N = rows * columns ;
MSE = Sums / N ;

PSNR = 10 * log10(255*255/MSE) ;
display([PSNR]);

figure;
imagesc(New_Image);
title('New Image : Q3');
colormap(gray);
