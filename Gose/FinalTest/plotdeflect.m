function [plot1,plot2] = plotdeflect(x1 ,x2, y1, y2)


hold off
plot1 = plot(-x1,-y1);       
hold on
plot2 = plot(-x2,-y2);        
hold off
title('Deflection of Beam')
ylabel('Y Axis')
xlabel('X Axis')
end