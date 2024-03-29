clc
clear

simpleNum = 9;
kind_num = [simpleNum,simpleNum,simpleNum];
% kind_num = [3,3,6];
addpath('./Hyper_data');

gt = load('Indian_pines_gt.mat');
hyper_img = load('Indian_pines_corrected.mat');
gt_data = gt.indian_pines_gt;
hyper_img_data = im2double(Normalize(hyper_img.indian_pines_corrected(:,:,50)));

[len, wid] = size(gt_data);
count = 0;
for i = 1:len
    for j = 1:wid
        if gt_data(i,j) == kind_num(1) || gt_data(i,j) == kind_num(2) || gt_data(i,j) == kind_num(3)
            count = count + 1;
        end
    end
end

num = count;
kind_local = zeros(2, count);
% figure(2);
% imshow(hyper_img_data(:,:),[])

count = 1;
for i = 1:len
    for j = 1:wid
        if gt_data(i,j) == kind_num(1) || gt_data(i,j) == kind_num(2) || gt_data(i,j) == kind_num(3)
            kind_local(1,count) = i;
            kind_local(2,count) = j;
            count = count + 1;
        end
        hyper_img_data(i,j)=0;
    end
end

count = 1;
for i = 1:num-1
    temp=kind_local(:,i);
    a = temp(1);
    b = temp(2);
    hyper_img_data(a,b) = 255;
    i
end

figure(1);
imshow(hyper_img_data(:,:),[],'border','tight','initialmagnification','fit');
set(gcf,'Position',[0,0,wid,len]); 
% imshow(hyper_img_data(:,:),[])
hold on;
