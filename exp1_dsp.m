clc

%unit sample 1(i)
n = -10:10;
x = (n == 0);
subplot(3,3,1);
stem(n,x);
xlabel('n\rightarrow');
ylabel('x(n)');
title('unit impulse');

%unit step sequence 1(ii)
N = 20;
x1 = ones(1,N);
n = 0:1:N-1;
subplot(3,3,2);
stem(n,x1);
xlabel('n\rightarrow');
ylabel('x(n)');
title('unit step sequence');

%unit ramp sequence 1(iii)
p = ones(1,N);
n = 0:1:N-1;
x2 = n.*p;
subplot(3,3,3);
stem(n,x2);
xlabel('n\rightarrow');
ylabel('x(n)');
title('unit ramp sequence');

%exponential sequence 1(iv)
N = 50;
u = ones(1,N);
n = 0:1:N-1;
x3 = 0.8.^(n).*u;
subplot(3,3,4);
stem(n,x3);
xlabel('n\rightarrow');
ylabel('x(n)');
title('exponential sequence');

%square wave 1(v)
L = 50;
A = 5;
p = 20;
f = 1/p;
dc = 60; %duty cycle
t = 0:L-1;
x4 = A*square(2*pi*f*t, dc);
subplot(3,3,5);
stem(t,x4);
xlabel('n\rightarrow');
ylabel('x(n)');
title('square wave');

%sawtooth waveform 1(v)
L = 50;
A = 5;
p = 20;
f = 1/p;
x5 = A*sawtooth(2*pi*f*t);
subplot(3,3,6);
stem(t,x5);
xlabel('n\rightarrow');
ylabel('x(n)');
title('sawtooth wave');

%x(n) = u(n)-u(n-10) 1(vi)
n = -10:20;
x6 = ((n >= 0)-(n >= 10));
subplot(3,3,7);
stem(n, x6);
xlabel('n\rightarrow');
ylabel('x(n)');
title('x(n)');