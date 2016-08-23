clc;
close all;


img=imread('./1.jpg');

figure(1);
subplot(1,2,1);imshow(img);
[row, col,cnl]=size(img);
dims = [row col];
lab=rgb2lab(img);
Y1=single(reshape(img(:,:,1),[row*col,1]));
Y2=single(reshape(img(:,:,2),[row*col,1]));
Y3=single(reshape(img(:,:,3),[row*col,1]));
Y=[Y1,Y2,Y3];

nbrpixel=nbrhood(row,col);

Y = zscore(Y,[],2);
L = zscore(L,[],2);


clear opts
opts.steps = 2;
opts.hyp.a0 = 2;
opts.hyp.b0 = 2;
opts.hyp.mu0 = 0;
opts.hyp.kappa0 = 2;
[MAPr, samplesr] = PMC_ddCRP_NG(Y',nbrpixel,opts);


%%
subplot(1,2,2);
imagesc(reshape(MAPr.Pi,dims));
axis([1 row 1: col]);

%%

figure(2)
subplot(1,2,1);
imshow(img);
axis image
%%
l1=single(reshape(lab(:,:,2),[row*col,1]));
l2=single(reshape(lab(:,:,3),[row*col,1]));
L=[l1,l2];
[MAPl, samplesl] = PMC_ddCRP_NG(L',nbrpixel,opts);
%%
subplot(1,2,2);
imagesc(reshape(MAPl.Pi,dims));
axis image
%%


