% NORMALEQN计算线性回归的闭合形式解法.
% normalEqn(X, y)使用正规方程计算闭合形式的线性回归解。

function [theta] = normalEqn(X, y)
    n = size(X, 2); %获取X的列数(特征数--不包含截距项)
    %theta = zeros(n+1, 1);

    theta = (pinv(X' * X)) * X' * y;
    
end
