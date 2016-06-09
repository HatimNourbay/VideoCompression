function [Iframe,B1frame,B2frame,B3frame,Pframe] = read_yuv(filename, format, length, numBlock)

%Read and display the frames from an .yuv file
% % % filename='foreman_qcif.yuv';
% % % format='qcif';
% % % length = 300

fid = fopen(filename, 'r');
  if (fid == -1) 
    error('read_file: cannot open file for reading');
  end

% develop the CIF part
if (strcmp(format,'qcif')==1)
    width = 176;
    height = 144;
else 
    if (strcmp(format,'cif')==1)
        width = 352;
        height = 288;
    end    
end

currentImg = fread(fid,[width height], 'uint8');
colorU = fread(fid, [width/2 height/2], 'uint8');
colorV = fread(fid, [width/2 height/2], 'uint8');
oldI = currentImg';
% fill in luma and chroma dimensions
for(i=1:length)
    
    
    
    currentImg = fread(fid,[width height], 'uint8');
    currentImg = currentImg';
    colorU = fread(fid, [width/2 height/2], 'uint8');
    colorV = fread(fid, [width/2 height/2], 'uint8');
    %figure(1),imagesc(currentImg), colormap('gray');
    %figure(2),imagesc(currentImg - oldI), colormap('gray');
    %oldI = currentImg;
    
    if i == numBlock-4
        Iframe = currentImg;
    elseif i == numBlock - 3
        B1frame = currentImg;
    elseif i == numBlock - 2
        B2frame = currentImg;
    elseif i == numBlock - 1
        B3frame = currentImg;
    elseif i == numBlock
        Pframe = currentImg;
    end
        
    
end;


%for i = numBlock

fclose(fid);