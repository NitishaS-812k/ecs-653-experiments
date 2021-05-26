%6a
x = [1,2,3,4,5,6,7,8,9];
x_3 = circshift(x, 3);
x_n3 = circshift(x, -3);
figure(1)
subplot(2,1,1)
stem(x_3)
title('x(n-3)')
subplot(2,1,2)
stem(x_n3)
title('x(n+3)')

%6b
x1 = [1,2,2,1];
x2 = [1,2,3,4];
ycirc = cconv(x1,x2,length(x1));
N = length(x1) + length(x2) - 1;
x1pad = [x1 zeros(1, 2*N-length(x1))];
x2pad = [x2 zeros(1, 2*N-length(x2))];
ccirc = ifft(fft(x1pad).*fft(x2pad));  %linear convolution from circular convolution
ccirc = ccirc(1:N);

figure(2);
subplot(2,1,1)
stem(ycirc);
title('circular convolution of x1 and x2')
subplot(2,1,2);
stem(ccirc);
title('linear convolution of x1 and x2')

%6c
h = [1,2,3,1,2];
xn = [1,1,1,1,0];
H = fft(h);
Xn = fft(xn);
Y = Xn.*H;
y = ifft(Y);

figure(3)
stem(y)
ylim([0,10])
title('output of linear filter')