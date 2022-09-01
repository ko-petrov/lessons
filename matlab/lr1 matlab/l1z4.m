x=linspace(-2*pi,3*pi);
f = sin(x.^2);
g = cos(x.^2);
plot(x,f, 'r -',x,g, 'g -');
title('графики: ');
legend('sin(x)','cos(x)');
grid on;