clc
clear
close all

addpath('./Hyper_data');

gt = load('WHU_Hi_LongKou_gt.mat');
hyper_img = load('WHU_Hi_LongKou.mat');
gt_data = gt.WHU_Hi_LongKou_gt;
hyper_img_data = im2double(Normalize(hyper_img.WHU_Hi_LongKou(:,:,:)));

% 统计共有多少类目标
[len, wid, band] = size(hyper_img_data);
kind_num = max(max(gt_data));

bands_info = zeros(kind_num, band);

for index = 1:kind_num
    bands_info(index, :) = getd_original(index, gt_data, hyper_img_data);
end

bands_info_max = 1.2*max(max(bands_info));

figure(1)
set(gca,'FontSize',14)
for index = 1:kind_num
    plot(bands_info(index,:), 'LineWidth', 2);
    xlim([0 band])
    ylim([0 bands_info_max])
    hold on;
end
xlabel('Band');
ylabel('Data Value');
hold on;

% legend({'1','2','3','4','5','6'},'NumColumns',3);
legend({'1','2','3','4','5','6','7','8','9'},'NumColumns',3);
% legend({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16',},'NumColumns',3);
