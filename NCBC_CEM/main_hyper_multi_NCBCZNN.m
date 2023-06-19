clc
clear
close all

kind_num = 7;
band_num = 200;
addpath('./Hyper_data');

gt = load('WHU_Hi_LongKou_gt.mat'); 
hyper_img = load('WHU_Hi_LongKou.mat'); 
gt_data = gt.WHU_Hi_LongKou_gt;
% ȡ�߹���ͼ���е�X������
% hyper_img_data = im2double(Normalize(hyper_img.salinas_corrected(:,:,:))); 
hyper_img_data = Normalize(hyper_img.WHU_Hi_LongKou(:,:,:));


%% ��ȡͼ���С
[len, wid, band] = size(hyper_img_data);
hyper_img_reshape = reshape(hyper_img_data, len*wid, band); 
%% ��������ؾ���
R = zeros(band); 
R = hyper_img_reshape'*hyper_img_reshape;
R = (R)/(len*wid); 

%% �ڸ߹���ͼ���л�ȡĿ�����������Ϣ
% d_one = getd_original(1);
d_two = getd_original(3);
d_three = getd_original(6);
% d = [d_one,d_two,d_three];
d = [d_two,d_three];
% d = [d_three];
[len_d, wid_d] = size(d);  
zeros_temp = zeros(wid_d, wid_d); 

[d_lan, d_wid] = size(d); % ��204,3��
sup_ones = ones(d_wid,1); 
G = [2*R,d;   
     d',zeros_temp];
 
b = [zeros(band,1);sup_ones];  

%% ZNNģ�����w
timeSpan = 0: 0.01:10; 
x0 = ones(band+wid_d,1); 

options = odeset();   
[t, x] = ode45(@NCBCZNNCore, timeSpan, x0, options, G, b);

%% ����в�
 nerr = zeros(1);
for j = 1:length(t)
    T = t(j);
    X = x(j,1:(band+wid_d))'; 
    Err = G*X-b;
    nerr(j) = norm(Err); 
end

figure(5)
plot(t, nerr, 'LineWidth', 2);
set(gca,'looseInset',[0 0 0 0])
hold on;

%% �˲������˲��ؽ�ͼ�� 
solution = x(end,1:(band+wid_d))';
beta = solution(1:band); 

y = hyper_img_reshape*beta;
Y = reshape(y,len,wid); 

% y = hyper_img_reshape*x(1:(band));
% Y = reshape(y,len,wid);
%% ��ӡʵ����
figure(1)
% imshow(hyper_img_data(:,:,50));
imshow(hyper_img_data(:,:,200),'border','tight','initialmagnification','fit');
set (gcf,'Position',[0,0,wid,len]);     
title('ԭͼ')

% ��ӡCEM�˲�֮���ͼ��
figure(2)
% imshow(Y);
imshow(Y,'border','tight','initialmagnification','fit');
set (gcf,'Position',[0,0,wid,len]);      
title('CEM�˲����ͼ')

% ��ӡ��ֵͼ
figure(3)
% ͼ��ƽ��
Y = imgaussfilt(Y,1.8);
thresh = 0.55;
for i=1:len
    for j=1:wid
        if(Y(i,j)<thresh)
            Y(i,j)=0;
        else 
            Y(i,j)=1;
        end
    end
end
% level=graythresh(Y);
% Y=im2bw(Y,level);
foremm = bwmorph(Y,'dilate', 0);
% Y = bwlabel(foremm,4);
Y = bwlabel(Y,4);
imshow(Y,'border','tight','initialmagnification','fit');
set (gcf,'Position',[0,0,wid,len]);  
%title('��ֵͼ')
% Ѱ�Ҷ�ֵͼ�������ͨ����
img_reg = regionprops(Y, 'area', 'boundingbox');
areas = [img_reg.Area];
rects = cat(1,img_reg.BoundingBox);

% % % �޳���С��Ŀ���
% for countNum = 1 : length(rects)
%     if rects(countNum, 3) * rects(countNum, 4) < 128
%         rects(countNum, 3) = 0;
%         rects(countNum, 4) = 0;
%     end
% end
% 
% % ��ԭͼ�п��Ŀ��λ��
% figure(4)
% % imshow(hyper_img_data(:,:,45));
% imshow(hyper_img_data(:,:,200),'border','tight','initialmagnification','fit');
% set (gcf,'Position',[0,0,wid,len]);     
% for i = 1:size(rects, 1)
%     rectangle('position', rects(i, :), 'EdgeColor', 'g', 'LineWidth', 2);
% end