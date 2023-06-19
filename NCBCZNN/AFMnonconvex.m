function E=AFMnonconvex(E)
  %%  非凸不变量
%     for i=1:length(E)
%         if E(i)>0.05
%             if E(i)< 0.01
%                 E(i) = (E(i) / norm (E(i)));
%             end
%         end
%         if E(i)<-0.05
%             if E(i)>-0.01
%                 E(i) = (E(i) / norm (E(i)));
%             end
%         end
%     end  
%% 变量组3 上界不变0.1 边界值从 0.2到1，观察到的规律性是数值越大收敛速度越快
%     for i=1:length(E)
%          if E(i)>0.1
%            E(i) = 0.1;    % 边界值从0.1 0.2 0.4 0.6 0.8 1
%         end
%         if E(i)<-0.1
%             E(i) = -0.1;  % 边界值 负数的0.1 0.2 0.4 0.6 0.8 1
%         end
%     end
%     
    
   




    %%  非凸不变量  
    for i=1:length(E)
        if E(i)>0.0001
            if E(i)< 0.0002 
                E(i) = (E(i) / norm (E(i)));
            end
        end
        if E(i)<-0.0001
            if E(i)>-0.0002
                E(i) = (E(i) / norm (E(i)));
            end
        end
    end  
 %% 变量组1 上界从0.001-10 边界值不变为1.5 数值越大 精度越小
    for i=1:length(E)
         if E(i)>0.0001 % 0.00001 0.0001, 0.001 0.01 , 0.1 , 1 , 10
           E(i) = 2;
        end
        if E(i)<-0.0001 % 负的 0.01 , 0.1 , 1 , 10
            E(i) = -2;
        end
    end    
    
    
    