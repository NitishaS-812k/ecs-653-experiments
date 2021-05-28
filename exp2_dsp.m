clc;

%continuous sinusoidal signal 2(a)
A = 5;
f = 50;
t = 0:0.001:0.1;
x1 = A*cos(2*pi*f*t);
subplot(4,1,1);
plot(t,x1);
xlabel('time \rightarrow');
ylabel('amplitude');
title('sinusoidal signal');

%sampled version of 2(a)
fs = 1000;
Ts = 1/fs;
n = 0:100;
xn = A*cos(2*pi*f*n*Ts);
subplot(4,1,2);
stem(n, xn);
xlabel('time \rightarrow');
ylabel('amplitude');
title('discrete time sampled signal');

%even and odd components of a signal 2(b)
n = -10:10;
x = ((n >= 0)-(n >= 10));
x2 = fliplr(x);
xe = 0.5*(x + x2); %even component
xo = 0.5*(x - x2); %odd component

subplot(4,1,3);
stem(n,xe);
xlabel('n\rightarrow');
ylabel('xe(n)');
title('even component');

subplot(4,1,4);
stem(n,xo);
xlabel('n\rightarrow');
ylabel('xo(n)');
title('odd component');