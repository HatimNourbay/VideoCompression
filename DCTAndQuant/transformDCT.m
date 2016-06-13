function imgDCT = transformDCT(img, block_size)

A = img;
[height width] = size(A);
Dblock = dctmtx(block_size);
A_transf = zeros(size(A));
for i = 1 : block_size: height-block_size + 1
    for j = 1 : block_size: width-block_size + 1
        A_transf(i:i+block_size - 1,j:j+block_size - 1) =...
            Dblock*A(i:i+block_size - 1,j:j+block_size - 1)*Dblock';
    end
end
imgDCT = A_transf;