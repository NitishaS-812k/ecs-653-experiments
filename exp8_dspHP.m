clear all;
%high pass iir
fpass = 0.6;
fstop = 0.5;
rp = 1;
rs = 40;
fs = 2000;
samples = 1024;
hpf_iir = designfilt('highpassiir', 'StopbandFrequency', fstop, ...
                     'PassbandFrequency', fpass, 'StopbandAttenuation', ...
                     rs, 'PassbandRipple', rp);
n = filtord(hpf_iir)
[num, den] = tf(hpf_iir);
z_hp = roots(num);
p_hp = roots(den);
[hpf,w] = freqz(hpf_iir,samples,fs);
figure(1)
subplot(2,1,1)
plot(w, mag2db(abs(hpf)))
ylabel('Magnitude Response(in dB)')
xlabel('Frequency(Hz)')
ylim([-40 5])
subplot(2,1,2)
plot(w, unwrap(angle(hpf)))
title('High Pass filter designed with specifications')
ylabel('Phase response(in radians)')
xlabel('Frequency(Hz)')
ylim([-40 10])
figure(2)
zplane(z_hp,p_hp)
title('pole and zero plot of IIR High pass filter')