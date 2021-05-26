%low pass iir
fpass = 0.5;
fstop = 0.6;
rp = 1;
rs = 40;
fs = 2000;
samples = 1024;

lpf_iir = designfilt('lowpassiir', 'PassbandFrequency', fpass, ...
                     'StopbandFrequency', fstop, 'PassbandRipple', rp, ...
                     'StopbandAttenuation', rs);
n = filtord(lpf_iir)
[num, den] = tf(lpf_iir);
z_lp = roots(num);
p_lp = roots(den);
[lpf,w] = freqz(lpf_iir,samples,fs);
figure(1)
subplot(2,1,1)
plot(w, mag2db(abs(lpf)))
xlim([0,1000])
ylabel('Magnitude Response(in dB)')
xlabel('Frequency(Hz)')
ylim([-40 5])
subplot(2,1,2)
plot(w, unwrap(angle(lpf)))
title('Low Pass filter designed with specifications')
ylabel('Phase response(in radians)')
xlabel('Frequency(Hz)')
ylim([-40 10])
figure(2)
zplane(z_lp,p_lp)
title('pole and zero plot of IIR Low pass filter')