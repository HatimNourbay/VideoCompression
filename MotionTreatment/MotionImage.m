function result = MotionImage(img, imgRef)

mbSize = 8;
[motionVect, EScomputations] = motionEstimation_FS(img, imgRef, mbSize, 8);
imgComp = motionCompensation(imgRef, motionVect, mbSize);

result = imgComp;