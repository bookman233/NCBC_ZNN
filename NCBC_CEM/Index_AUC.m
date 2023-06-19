% 计算结果的各项指标
% OA: overall classification accuracy
% AA: average classification accuracy
% PA: producer' s accuracy
% kappa: Kappa coefficient
% Mean: Mean 均值
% SD: standard deviation 标准差
% MP: mean preserving
function [OA, AA, PA, kappa, Mean, SD, MP] = Index_AUC(GT_img, CEM_img)
    [len, wid] = size(GT_img);
    
    % True Positive: 该像素点有目标，预测也有目标
    TP = 0;
    % True Negative: 该像素点没有目标，预测也没有目标
    TN = 0;
    % False Positive: 该像素点没有目标，预测有目标
    FP = 0;
    % False Negative: 该像素点有目标，预测没有目标
    FN = 0;
    
    for i_len = 1:len
        for i_wid = 1:wid
            if GT_img(i_len,i_wid) == 1 && CEM_img(i_len,i_wid) == 1
                TP = TP + 1;
            elseif GT_img(i_len,i_wid) == 0 && CEM_img(i_len,i_wid) == 0
                TN = TN + 1;
            elseif GT_img(i_len,i_wid) == 0 && CEM_img(i_len,i_wid) == 1
                FP = FP + 1;
            else
                FN = FN + 1;
            end
        end
    end
    
    %% Mean
    Mean_count = 0;
    for i_len = 1:len
        for i_wid = 1:wid
            Mean_count = Mean_count + CEM_img(i_len, i_wid);
        end
    end
    Mean = Mean_count/(len*wid);
    
    %% standard deviation
    SD_count = 0;
    for i_len = 1:len
        for i_wid = 1:wid
            SD_count = SD_count + (CEM_img(i_len, i_wid)-Mean)^2;
        end
    end
    SD_count = SD_count/(len*wid);
    SD = sqrt(SD_count);
    
    %% mean preserving
    M_Filter = Mean;
    M_GT = 0;
    for i_len = 1:len
        for i_wid = 1:wid
            M_GT = M_GT + GT_img(i_len, i_wid);
        end
    end
    M_GT = M_GT/(len*wid);
    MP = M_Filter/M_GT;
    
    % overall classification accuracy
    OA = (TP+TN)/(TP+TN+FP+FN);
    % average classification accuracy
    AA = 0.5*(TP/(TP+FN)+TN/(TN+FP));
    % producer’s accuracy
    PA = TP/(TP+FP);
    % Kappa coefficient
    p_zero = (TP+TN)/(TP+TN+FP+FN);
    p_e = ((TP+FN)*(TP+FP)+(FP+TN)*(FN+TN))/((TP+TN+FP+FN)^2);
    kappa = (p_zero-p_e)/(1-p_e);
end

