% COMPUTECOSTMULTI使用多个变量进行线性回归的成本
% computeCostMulti(X, y, theta)使用theta作为线性回归的参数以计算X和y中的数据点的成本

function J = computeCostMulti(X, y, theta)

    m = length(y); % 训练样本数目

    J = 0;
    J = X*theta-y;  % X*theta为假设函数(拟合函数); '*' --矩阵相乘
    J = (1/(2*m)) .* (J' * J);   % '.*' --矩阵对应元素相乘

end
