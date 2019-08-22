% 计算线性回归的代价 J = COMPUTECOST(X, y, theta)

function J = computeCost(X, y, theta)

    m = length(y); % 训练样本数目

    J = 0;
    J = X*theta-y;  % X*theta为假设函数(拟合函数); '*' --矩阵相乘
    J = (1/(2*m))*sum(J.*J);   % '.*' --矩阵对应元素相乘

end
