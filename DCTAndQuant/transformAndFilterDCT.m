function imgDCT = transformAndFilterDCT(imgSrc)

block_size = 8;

imgTemp = transformDCT(imgSrc,block_size);
imgTemp = quantification(imgTemp);
imgTemp = inverseQuant(imgTemp);
imgTemp = inverseDCT(imgTemp, block_size);
imgDCT = imgTemp;


%    A = im2double(imgSrc); 
%    
%    
%     % apply DCT block by block and store the result in the A_transf matrix
%     % & filter the result
%     block_size = 8;
%     Q = zeros (block_size,block_size);
%     Q(1:3,1:3) = 1;
%     tic;
%     [height width] = size(A);
%     Dblock = dctmtx(block_size);
%     A_transf = zeros(size(A));
%     for i = 1 : block_size: height-block_size + 1 
%         for j = 1 : block_size: width-block_size + 1 
%             A_transf(i:i+block_size - 1,j:j+block_size - 1) = Dblock*A(i:i+block_size - 1,j:j+block_size - 1)*Dblock';
%             A_transf(i:i+block_size - 1,j:j+block_size - 1) = round(A_transf(i:i+block_size - 1,j:j+block_size - 1)./q_mtx);
%         end
%     end
%     toc
%     %figure(4), imshow(A_transf), title('DCT par block de 8 pixels');
%     % apply the inverse DCT block by block and store the result in the A_rec matrix
%     A_rec = zeros(size(A));
%     for i = 1 : block_size: height-block_size + 1 
%         for j = 1 : block_size: width-block_size + 1 
%             A_rec(i:i+block_size - 1,j:j+block_size - 1) = A_rec(i:i+block_size - 1,j:j+block_size - 1) .*16;
%             A_rec(i:i+block_size - 1,j:j+block_size - 1) = Dblock'*A_transf(i:i+block_size - 1,j:j+block_size - 1)*Dblock;
%             
%         end
%     end
%     %figure(5), imshow(A_rec), title('DCT inverse par block de 8 pixels');
%     
%     
%     
% imgDCT = A_rec;