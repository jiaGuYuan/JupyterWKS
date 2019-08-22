% FEATURENORMALIZE规范化X中的特征,
% featureNormalize(X)返回值:
%     X_norm: 标准化后的特征(均值为0, 方差为1),在处理学习算法时这通常是一个很好的预处理步骤。
%     mu: 规范化前特征X的均值
%     sigma: 规范化前特征X的标准差
function [X_norm, mu, sigma] = featureNormalize(X)

    m = size(X, 1); %返回矩阵X第一个维度的大小(行数),即样本数目
    n = size(X, 2); %返回矩阵X第二个维度的大小(列数),即特征数目

    % 计算各特征的均值
    mu = zeros(n, 1);
    for i = 1:n
        mu(i) = (1/m)*sum(X(:, i)); %计算第i个特征的均值
    end
    % mu = mean(X) %使用mean函数求平均值

    % 计算各特征的方差
    sigma = zeros(n, 1);
    for i = 1:n
        offset = X(:, i) - mu(i);
        sigma(i) = ((1/m)*sum( offset .* offset)) .^ 0.5; %计算第i个特征的标准差
    end
    % sigma = std(X) %使用std函数求标准差

    %标准化特征
    X_norm = (X - mu') ./ (sigma'); %标准化特征 x_norm = (x-E(X))/sigma(X)

end
