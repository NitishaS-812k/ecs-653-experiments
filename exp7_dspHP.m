%high pass
clear all;
fpass_hp = 0.6;
fstop_hp = 0.5;
rp_hp = 3;     %passband ripple in dB
rs_hp = 40;    %stopband ripple in dB
fs_hp = 2000;  %sampling frequency
hpfilter = designfilt('highpassfir','PassbandFrequency',fpass_hp,...
    'StopbandFrequency', fstop_hp, 'PassbandRipple', rp_hp,...
    'StopbandAttenuation',rs_hp,'DesignMethod','kaiserwin');

[num,den] = tf(hpfilter);
z_hp = roots(num);
p_hp = roots(den);
[h,w] = freqz(hpfilter,1024,fs_hp);
figure(1)
subplot(2,1,1)
plot(w, 10*(log10(abs(h))))
ylabel('Magnitude Response(in dB)')
xlabel('Frequency(Hz)')
ylim([-40 5])
subplot(2,1,2)
plot(w, unwrap(angle(h)))
title('High Pass filter designed with specifications')
ylabel('Phase response(in radians')
xlabel('Frequency(Hz)')
ylim([-40 10])
figure(2)
zplane(z_hp,p_hp)
title('pole and zero plot of FIR High pass filter')