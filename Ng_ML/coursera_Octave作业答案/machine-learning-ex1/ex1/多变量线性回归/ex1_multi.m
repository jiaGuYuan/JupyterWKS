%% 多变量线性回归
%
%  Instructions
%  ------------
% 
%  对于本练习，您需要实现如下函数(对应如下文件)：
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  对于本练习的这一部分，您需要更改以下代码的某些部分以进行各种实验（例如，更改学习率）.
%

%% ================ Part 1: 特征正规化 ================
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2); %数据前2列为X
y = data(:, 3);   %数据第3列为y
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]);

fprintf('Program paused. Press enter to continue.\n');
pause;

% 缩放特征;使它们的均值为0,方差为1
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% 可以在这里绘制出标准化特征前后的特征分布图

% 将截距项添加到X.
XX = [ones(m, 1) X];

%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: 提供了以下初始代码，该代码运行具有特定学习率（alpha）的梯度下降。 
%
%  你的任务是首先确保你的功能 - 使computeCost和gradientDescent在此特定学习率
%  的梯度下降代码支持多个变量并可以正常运行。之后，尝试使用不同的alpha值运行渐变下降，
%  并查看哪一个为您提供最佳结果。
%
%  最后，您应该在最后完成代码，以预测1650平方英尺3房的价格。
%
% 提示：通过使用'hold on'命令，您可以在同一个图上绘制多个图形。
%
% 提示：在预测时，请确保执行相同的特征规范化。
%

fprintf('Running gradient descent ...\n');

% 测试不同的学习速率和梯度下降迭代次数
figureRowNum = 1;  %4;
figureColNum = 1;  %5;
for i=linspace(1, figureRowNum*figureColNum, figureRowNum*figureColNum)
    %alpha = 0.01 * i;
    alpha = 0.13;
    num_iters = 200;
   
    
    % 初始Theta并执行梯度下降
    theta = zeros(3, 1); %本例中有两个变量,加上截距项所以需要一个三维theta
    [theta, J_history] = gradientDescentMulti(XX, y, theta, alpha, num_iters);

    % 绘制代价收敛图
    subplot(figureRowNum, figureColNum, i);
    plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
    xlabel('Number of iterations');
    ylabel('Cost J');
    tipStr=['alpha=' num2str(alpha)];
    title(tipStr);

    % 显示梯度下降的结果
    fprintf('Theta computed from gradient descent alpha=%f: \n', alpha);
    fprintf(' %f \n', theta);
    fprintf('\n');
end

% Part 4: 可视化 J(theta_1, theta_2)
% 对不同的theta_1, theta_2计算J(θ); 并绘制网格线图
theta1_vals = linspace(90000, 130000, 100);
theta2_vals = linspace(-6700, -6300, 100);
J_vals = zeros(length(theta1_vals), length(theta2_vals));
for i = 1:length(theta1_vals)
    for j = 1:length(theta2_vals)
        t = [theta1_vals(i); theta2_vals(j)];    % t是一个列向量
        J_vals(i,j) = computeCostMulti(X, y, t);
    end
end
% 因为surf绘图的原因,需要对J_vals进行转置
J_vals = J_vals';
% 绘制网格线表面图
figure;
surf(theta1_vals, theta2_vals, J_vals)
xlabel('\theta_1'); ylabel('\theta_2');


% 预测一个1650平方英尺,有3个房间的价格
house = [1650 3];
% 标准化要预测的特征. --注意:这里不能使用featureNormalize(house)来标准化,因为house只有一个样本(其标准差为0,不能做为除数)
house = (house - mu') ./ (sigma');
house = [1 house];  %添加截距项  
price = house * theta;

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;



%% ================ Part 3: 正规方程. -- 直接通过计算得到结果 ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: 以下代码使用正规方程计算线性回归的闭合形式解。 您需要在normalEqn.m中完成代码
%               在这样做之后，您应该完成此代码以预测1650平方英尺,3房的价格。
%

%% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

[X mu sigma] = featureNormalize(X);

% 将截距项添加到X.
X = [ones(m, 1) X];

% 从正规方程计算参数
theta = normalEqn(X, y);

% 显示正规方程的结果
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
house = [1650 3];
% 标准化要预测的特征. --注意:这里不能使用featureNormalize(house)来标准化,因为house只有一个样本(其标准差为0,不能做为除数)
house = (house - mu') ./ (sigma');
house = [1 house];  %添加截距项  
price = house * theta;

fprintf(['Predicted price of a 1650 sq-ft, 3 br house (using normal equations):\n $%f\n'], price);

