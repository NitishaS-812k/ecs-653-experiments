clear all;
%high pass iir
fpass = 0.6;
fstop = 0.4;
rp = 1;
rs = 40;
fs = 1000;
samples = 1024;
hpf_iir = designfilt('highpassiir', 'StopbandFrequency', fstop, ...
                     'PassbandFrequency', fpass, 'StopbandAttenuation', ...
                     rs, 'PassbandRipple', rp);
disp('The order of the filter is');
n = filtord(hpf_iir)
[num, den] = tf(hpf_iir);
disp('The transfer function of the filter is');
hpiirtf = tf(num,den,fs)
z_hp = roots(num);
p_hp = roots(den);
[hpf,w] = freqz(hpf_iir,samples,fs);
figure(1)
freqz(num,den,samples)
title('High Pass filter designed with specifications')
figure(2)
zplane(z_hp,p_hp)
title('pole and zero plot of IIR High pass filter')