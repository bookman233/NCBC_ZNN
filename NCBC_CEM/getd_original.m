function d = getd_original(kind_num)
    addpath('./Hyper_data');
    addpath('./RGB_data');
    gt = load('WHU_Hi_LongKou_gt.mat');
    hyper_img = load('WHU_Hi_LongKou.mat');
    gt_data = gt.WHU_Hi_LongKou_gt;
    % 取高光谱图像中的X个波段
    hyper_img_data = im2double(Normalize(hyper_img.WHU_Hi_LongKou(:,:,:)));

% % =============================================
%     addpath('./Hyper_data');
%     addpath('./RGB_data');
%     % gt = load('groundTruth_Cuprite_nEnd12.mat');
%     % hyper_img = load('CupriteS1_R188.mat');
%     gt = load('PaviaU_gt.mat');
%     hyper_img = load('PaviaU.mat');
%     gt_data = gt.paviaU_gt;
%     % 取高光谱图像中的X个波段
%     hyper_img_data = im2double(Normalize(hyper_img.paviaU(:,:,:)));
% % =============================================

%     addpath('./Hyper_data');
%     addpath('./RGB_data');
%     % gt = load('groundTruth_Cuprite_nEnd12.mat');
%     % hyper_img = load('CupriteS1_R188.mat');
%     gt = load('Indian_pines_gt.mat');
%     hyper_img = load('Indian_pines_corrected.mat');
%     gt_data = gt.indian_pines_gt;
%     % 取高光谱图像中的X个波段
%     hyper_img_data = im2double(Normalize(hyper_img.indian_pines_corrected(:,:,:)));

    % 需要搜索的目标种类
    kind = kind_num;
    [~,~,band] = size(hyper_img_data);
    [gt_lan, gt_wid] = size(gt_data);

    % 统计kind物种有多少个像素点
    kind_pix_num = 0;
    for i = 1:gt_lan
        for j = 1:gt_wid
            if gt_data(i,j) == kind
                kind_pix_num = kind_pix_num + 1;
            end
        end
    end

    % 统计kind物种在图中像素点的位置
    kind_local = zeros(kind_pix_num,2);
    count = 0;
    for i = 1:gt_lan
        for j = 1:gt_wid
            if gt_data(i,j) == kind
                count = count + 1;
                kind_local(count,:) = [i,j];
            end
        end
    end

    % 统计kind物种的平均光谱信息
    tempOne = zeros(1,1,band);
    for i = 1:kind_pix_num
        x = kind_local(i,1);
        y = kind_local(i,2);
        tempOne = tempOne + hyper_img_data(x,y,:);
    end
    tempOne = reshape(tempOne,band,1);
    tempOne = tempOne ./ kind_pix_num;
    d =tempOne;
end