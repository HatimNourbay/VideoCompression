function imgResult = quantification(imgSrc)


A = imgSrc;
block_size = 8;
%define the zig zag scanning matrix
zigzagScan = [0 1 5 6 14 15 27 28; ...
    2 4 7 13 16 26 29 42;...
    3 8 12 17 25 30 41 43;...
    9 11 18 24 31 40 44 53;...
    10 19 23 32 39 45 52 54; ...
    20 22 33 38 46 51 55 60;...
    21 34 37 47 50 56 59 61;...
    35 36 48 49 57 58 62 63;];
% retain the most important "xc" coefficients by creating the
% quantization mask
xc= 32;
impMatrix = ones(block_size).*(zigzagScan<xc);

[height width] = size(A);
A_rec = zeros(size(A));
for i = 1 : block_size: height-block_size + 1
    for j = 1 : block_size: width-block_size + 1
        A_rec(i:i+block_size - 1,j:j+block_size - 1) =...
            round(A(i:i+block_size - 1,j:j+block_size - 1).*impMatrix);
    end
end


imgResult = A_rec;