%PLOTDATA将数据点x和y绘制成新图PLOTDATA(x，y)绘制数据点，并给出数字轴的人口和利润标签.

% ====================== YOUR CODE HERE ======================
% 说明：使用"figure"和"plot"命令将训练数据绘制成图形。
% 使用"xlabel"和"ylabel"命令设置轴标签。 
% 假设人口和收入数据已作为此函数的x和y参数传入。
%
% 提示: 您可以在绘图中使用'rx'选项，使标记显示为红色十字。 
%       此外，您可以使用plot(...,'rx', 'MarkerSize', 10）使标记更大;


function plotData(x, y)
    figure; %打开一个新的绘图窗口

    plot(x, y, 'rx', 'MarkerSize', 10);
    ylabel('Profit in $10,000s'); 
    xlabel('Population of City in 10,000s'); 
end
