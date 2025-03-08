
x= -10:0.2:10;
f=2*x+3;
l=x.^2-5*x+2;
plot(x, f , 'b-', x, l, 'r--');
xlabel('x');
ylabel('f(x)');
title("plot of linear and quardratic functions");
legend('f(x)=2x+3','l(x)=x^2-5x+2');
