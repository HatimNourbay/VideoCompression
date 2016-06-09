close all;
clear all;

[I,B1,B2,B3,P] = read_yuv('foreman/foreman_cif.yuv','cif',100,5);

%figure(1),imagesc(I), colormap('gray');
%figure(2),imagesc(P), colormap('gray');

mbSize = 8;

[motionVect, EScomputations] = motionEstimation_FS(P, I, mbSize, 8);

imgComp = motionCompensation(I, motionVect, mbSize);

figure(1),imagesc(imgComp), colormap('gray');

imgDCT = transformAndFilterDCT(imgComp - P);

figure(2),imagesc(imgDCT), colormap('gray');

imgDCTI = transformAndFilterDCT(I);

figure(3),imagesc(imgDCTI), colormap('gray');