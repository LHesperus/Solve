clc
clear all
close all

%%
img = imread('1.jpg');

[height,width,~] = size(img);
h=[240,240,190];
matrix = (img(:,:,1)>h(1))|(img(:,:,2)>=h(2))|(img(:,:,3)>=h(3)); % ѡ���ɫ�����ص�
matrix(round(0.2*height):height,round(0.35*width):round(0.65 *width)) = 0;  % �м��������򱣳ֲ���
se = strel('disk',3);
matrix = imclose(matrix,se);  % �ز���ƽ����Ե
figure
imshow(matrix)
[a,b] = find(matrix ==1);
blue = [67,142,219];
blue2 = [0,0,255];
red = [255,0,0];
color = blue;
for i = 1:size(a)
    img(a(i),b(i),1) = color(1);
    img(a(i),b(i),2) = color(2);
    img(a(i),b(i),3) = color(3);
end
%ƽ������
img1(:,:,1)=medfilt2(img(:,:,1));%��
img1(:,:,2)=medfilt2(img(:,:,2));%��
img1(:,:,3)=medfilt2(img(:,:,3));%��
figure
imshow(img1);
imwrite(img1,'finish.jpg')