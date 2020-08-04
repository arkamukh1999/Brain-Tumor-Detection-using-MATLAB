clc
clear all
close all
I=imread('C:\Users\arkam\Desktop\samples\6.jpg');
figure;
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);
subplot(2,2,1);
imshow(I); 
title('Brain MRI Image');
II=I;
I= rgb2gray(I);
I= im2bw(I,0.65);
subplot(2,2,2);
imshow(I);
title('Thresholded Image');
se = strel('disk', 20);
Io = imopen(I, se);
Iobr = imreconstruct(Io, I);
bw =Iobr;
subplot(2,2,3);
imshow(bw);
title('Only Tumour')
subplot(2,2,4);
B=bwboundaries(bw,'noholes'); 
imshow(II);
hold on 
for i=1:length(B) 
    plot(B{i}(:,2),B{i}(:,1), 'r' ,'linewidth',1.5); 
end
title('Detected Tumor(Highlighted in Red)'); 
if(length(B)==0)
    msgbox('Tumour Not Found')
else
    msgbox('Tumour Found')
end
    