clc;
close all;
T = 1;
Wp = 0.2*pi;
Ws = 0.3*pi;
Ap = 7;
As = 16;
R = (10^(0.1*Ap)-1)/(10^(0.1*As)-1);
N = ceil(0.5*(log10(R)/log10(Wp/Ws)));
Wc = Wp/((10^(0.1*Ap)-1)^(1/(2*N)));
[b,a] = butter(N,Wc,'low', 's');
Hs = tf(b,a);
[numd, dend] = bilinear(b,a,1/T);
Hz = tf(numd,dend,T);
wp = 2*atan(Wp*T/2);
ws = 2*atan(Ws*T/2);
w = 0:0.01:pi;
Hw = freqz(numd,dend,w);
subplot(1,2,1)
plot(w,abs(Hw));
xlabel('Frequency')
ylabel('Magnitude')
subplot(1,2,2)
plot(w, mag2db(abs(Hw)))
xlabel('Frequency')
ylabel('Magnitude(dB)')