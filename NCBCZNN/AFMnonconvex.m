function E=AFMnonconvex(E)
  %%  ��͹������
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
%% ������3 �Ͻ粻��0.1 �߽�ֵ�� 0.2��1���۲쵽�Ĺ���������ֵԽ�������ٶ�Խ��
%     for i=1:length(E)
%          if E(i)>0.1
%            E(i) = 0.1;    % �߽�ֵ��0.1 0.2 0.4 0.6 0.8 1
%         end
%         if E(i)<-0.1
%             E(i) = -0.1;  % �߽�ֵ ������0.1 0.2 0.4 0.6 0.8 1
%         end
%     end
%     
    
   




    %%  ��͹������  
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
 %% ������1 �Ͻ��0.001-10 �߽�ֵ����Ϊ1.5 ��ֵԽ�� ����ԽС
    for i=1:length(E)
         if E(i)>0.0001 % 0.00001 0.0001, 0.001 0.01 , 0.1 , 1 , 10
           E(i) = 2;
        end
        if E(i)<-0.0001 % ���� 0.01 , 0.1 , 1 , 10
            E(i) = -2;
        end
    end    
    
    
    