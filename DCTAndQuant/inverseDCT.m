function resultImg = inverseDCT(imgSrc, block_size)

A_transf = im2double(imgSrc);
[height, width] = size(A_transf);
Dblock = dctmtx(block_size);
A_rec = zeros(size(A_transf));
for i = 1 : block_size: height-block_size + 1
    for j = 1 : block_size: width-block_size + 1
        A_rec(i:i+block_size - 1,j:j+block_size - 1) =...
            Dblock'*A_transf(i:i+block_size - 1,j:j+block_size - 1)*Dblock;
    end
end

resultImg  = A_rec;