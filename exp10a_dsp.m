%10 a
clc;
close all;
T = 1;
wp = 0.2*pi;
ws = 0.6*pi;
e = sqrt(1/0.8^2-1);
A = 1/0.2;
Wp = wp/T;
Ws = ws/T;
N = ceil((1/2)*(log10(e^2/(A^2-1))/log10(Wp/Ws)));
Wc = Wp/((e^2)^(1/(2*N)));
[b,a] = butter(N,Wc,'low','s');
Hs = tf(b,a);
[numd, dend] = impinvar(b,a,1/T);
Hz = tf(numd,dend,T);
w = 0:0.01:pi;
Hw = freqz(numd, dend, w);
plot(w/pi,abs(Hw))
xlabel('Frequency in pi units')
ylabel('Magnitude')