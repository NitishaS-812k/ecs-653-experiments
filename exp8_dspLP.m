%low pass iir
fpass = 0.3;
fstop = 0.5;
rp = 1;
rs = 30;
fs = 1000;
samples = 1024;
lpf_iir = designfilt('lowpassiir', 'StopbandFrequency', fstop, ...
                     'PassbandFrequency', fpass, 'StopbandAttenuation', ...
                     rs, 'PassbandRipple', rp);
disp('The order of the filter is');
n = filtord(lpf_iir)
[num, den] = tf(lpf_iir);
disp('The transfer function of the filter is');
lpiirtf = filt(num,den,fs)
z_hp = roots(num);
p_hp = roots(den);
figure(1)
freqz(num,den,samples);
title('low pass iir designed to specifications')
figure(2)
zplane(z_hp,p_hp)
title('pole and zero plot of IIR low pass filter')