%low pass fir
clc;
close all;
fpass_lp = 500;
fstop_lp = 600;
rp_lp = 3;     %passband ripple in dB
rs_lp = 40;    %stopband ripple in dB
fs_lp = 2000;  %sampling frequency
dev_lp = [(10^(rp_lp/20)-1)/(10^(rp_lp/20)+1) 10^(-rs_lp/20)];
[N_lp, F0_lp, A0_lp,W_lp] = firpmord([fpass_lp, fstop_lp], [1 0], dev_lp, fs_lp);
blp =  firpm(N_lp, F0_lp, A0_lp,W_lp);
freqz(blp,1,1024,fs_lp);
title('Low pass FIR filter designed too meet specifications')
z_lp = roots(blp);
p_lp = 0;
figure(2)
zplane(z_lp,p_lp)
title('pole zero plot of the low pass filter')