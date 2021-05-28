%5a
na = -30:30;
No = [2,5,10,15];
x1 = ((na>=-No(1))-(na>=No(1)));
x2 = ((na>=-No(2))-(na>=No(2)));
x3 = ((na>=-No(3))-(na>=No(3)));
x4 = ((na>=-No(4))-(na>=No(4)));

figure(1)
subplot(2,1,1)
stem(na,x1)
grid on
xlabel('n')
[X1, w1] = dtft(x1);
subplot(2,1,2);
plot(w1/pi, abs(fftshift(X1))/abs(max(X1)))
title('DTFT with N = 2')
grid on
xlabel('radians / \pi')

figure(2)
subplot(2,1,1)
stem(na,x2)
grid on
xlabel('n')
[X2, w2] = dtft(x2);
subplot(2,1,2);
plot(w2/pi, abs(fftshift(X2))/abs(max(X2)))
title('DTFT with N = 5')
grid on
xlabel('radians / \pi')

figure(3)
subplot(2,1,1)
stem(na,x3)
grid on
xlabel('n')
[X3, w3] = dtft(x3);
subplot(2,1,2);
plot(w3/pi, abs(fftshift(X3))/abs(max(X3)))
title('DTFT with N = 10')
grid on
xlabel('radians / \pi')

figure(4)
subplot(2,1,1)
stem(na,x4)
grid on
xlabel('n')
[X4, w4] = dtft(x4);
subplot(2,1,2);
plot(w4/pi, abs(fftshift(X4))/abs(max(X4)))
title('DTFT with N = 15')
grid on
xlabel('radians / \pi')
%with increasing N, the main lobe width decreases and the number of ripples
%increases while their height decreases.

%5b
nb = 0:100;
xcos = cos(0.25*pi*nb);
[Xcos, wcos] = dtft(xcos);
figure(5)
subplot(2,1,1)
stem(nb, xcos)
grid on
subplot(2,1,2)
plot(wcos/pi, abs(fftshift(Xcos))/abs(max(Xcos)))
title('DTFT')
grid on
xlabel('radians / \pi')

function [X,w3] = dtft(x)
    N = 500;        
    X = fft(x,N);
    w = 2*pi*(0:(N-1))/N;
    w2 = fftshift(w);
    w3 = unwrap(w2 - 2*pi);
end