function imgDCT = transformAndFilterDCT(imgSrc)

   A = im2double(imgSrc); 
   q_mtx =     [16 11 10 16 24 40 51 61; 
            12 12 14 19 26 58 60 55;
            14 13 16 24 40 57 69 56; 
            14 17 22 29 51 87 80 62;
            18 22 37 56 68 109 103 77;
            24 35 55 64 81 104 113 92;
            49 64 78 87 103 121 120 101;
            72 92 95 98 112 100 103 99];
   
    q_mtx = round(q_mtx./16);
   
    % apply DCT block by block and store the result in the A_transf matrix
    % & filter the result
    block_size = 8;
    Q = zeros (block_size,block_size);
    Q(1:3,1:3) = 1;
    tic;
    [height width] = size(A);
    Dblock = dctmtx(block_size);
    A_transf = zeros(size(A));
    for i = 1 : block_size: height-block_size + 1 
        for j = 1 : block_size: width-block_size + 1 
            A_transf(i:i+block_size - 1,j:j+block_size - 1) = Dblock*A(i:i+block_size - 1,j:j+block_size - 1)*Dblock';
            A_transf(i:i+block_size - 1,j:j+block_size - 1) = round(A_transf(i:i+block_size - 1,j:j+block_size - 1)./q_mtx);
        end
    end
    toc
    %figure(4), imshow(A_transf), title('DCT par block de 8 pixels');
    % apply the inverse DCT block by block and store the result in the A_rec matrix
    A_rec = zeros(size(A));
    for i = 1 : block_size: height-block_size + 1 
        for j = 1 : block_size: width-block_size + 1 
            A_rec(i:i+block_size - 1,j:j+block_size - 1) = A_rec(i:i+block_size - 1,j:j+block_size - 1) .*16;
            A_rec(i:i+block_size - 1,j:j+block_size - 1) = Dblock'*A_transf(i:i+block_size - 1,j:j+block_size - 1)*Dblock;
            
        end
    end
    %figure(5), imshow(A_rec), title('DCT inverse par block de 8 pixels');
    
    
    
imgDCT = A_rec;