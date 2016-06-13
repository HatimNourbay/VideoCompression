function result = imgBTreated(B,I,P,shiftLeft, shiftRight)

addpath(genpath('MotionTreatment'));

imgCompLeft = MotionImage(B,I);
imgCompRight = MotionImage(B,P);

imgComp = shiftLeft*imgCompLeft+shiftRight*imgCompRight;

figure(1),imagesc(imgComp), colormap('gray');

imgResid = transformAndFilterDCT(B - imgComp);

figure(2),imagesc(imgResid), colormap('gray');

imgFin = imgResid + imgComp;

figure;
figure(4),imagesc(imgFin), colormap('gray');
result = imgFin;