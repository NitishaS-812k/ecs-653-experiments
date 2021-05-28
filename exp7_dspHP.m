%high pass
clear all;
fpass_hp = 0.6;
fstop_hp = 0.5;
rp_hp = 3;     %passband ripple in dB
rs_hp = 40;    %stopband ripple in dB
fs_hp = 2000;  %sampling frequency
samples = 1024;
hpfilter = designfilt('highpassfir', 'StopbandFrequency', fstop_hp, ...
                      'PassbandFrequency', fpass_hp, 'StopbandAttenuation', ...
                      rs_hp, 'PassbandRipple', rp_hp, 'DesignMethod', ...
                      'kaiserwin');

[num,den] = tf(hpfilter);
z_hp = roots(num);
p_hp = roots(den);
Hhp = filt(num,den,fs_hp);
disp('The transfer function of the filter is');
Hhp
disp('The order of the high pass filter is')
n = filtord(hpfilter)
figure(1)
freqz(num,den,samples,fs_hp)
title('High Pass filter designed with specifications')
figure(2)
zplane(z_hp,p_hp)
title('pole and zero plot of FIR High pass filter')
