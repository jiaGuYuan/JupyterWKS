% GRADIENTDESCENTMULTI执行梯度下降以学习theta;
% theta = gradientDescentMulti(X, y, theta, alpha, num_iters)通过使用学习率alpha
% 进行num_iters次梯度下降迭代更新theta

function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)

    m = length(y); % 训练样本的大小
    J_history = zeros(num_iters, 1);
    J = zeros(m,1);
    n = length(theta);
    for iter = 1:num_iters
        % Instructions: 在参数向量theta上执行单次梯度下降步骤。
        % Hint: 在调试时,在此处打印出成本函数(computeCostMulti)和渐变的值会很有用。
        
        J = X*theta-y;  % h(θ)-y
        
        % 在一次迭代中更新所有theta
        %temp = zeros(n, 1);
        %for var_i = 1:n
        %    temp(var_i) = theta(var_i) - (alpha/m) * (J' * X(:,var_i));
        %    theta(var_i) = temp(var_i);
        %end
        
        theta = theta - (alpha/m) * (X' * J); % 等价于上面的循环
        
        % 在每次迭代后的损失J.
        J_history(iter) = computeCostMulti(X, y, theta);
    end

end
