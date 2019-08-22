% GRADIENTDESCENT执行梯度下降以学习theta
% theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) 
% 以alpha作为梯度下降学习速率, 进行num_iters次梯度下降来更新theta.
% 返回1--进行num_iters次梯度下降后的theta, 
% 返回2--每次梯度下降后的损失

function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

    m = length(y); % 训练样本的大小
    J_history = zeros(num_iters, 1);
    J=zeros(m,1);
    for iter = 1:num_iters
        % Instructions: 在参数向量theta上执行单次梯度下降步骤。
        % Hint: 在调试时,在此处打印出成本函数(computeCost)和渐变的值会很有用。
        
        J = X*theta-y;
        temp1=theta(1)-alpha*(1/m)*sum(J.*X(:,1));
        temp2=theta(2)-alpha*(1/m)*sum(J.*X(:,2));
        theta(1)=temp1;
        theta(2)=temp2;
       
        
        % 在每次迭代后的损失J.
        J_history(iter) = computeCost(X, y, theta);
    end

end
