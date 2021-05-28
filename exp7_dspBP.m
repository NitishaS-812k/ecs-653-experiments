%band pass filter
clc;
clear all;
close all;
fs1_bp = 0.35;
fp1_bp = 0.45;
fp2_bp = 0.55;
fs2_bp = 0.65;
fs_bp = 2000;
Ast = 40;
Prp = 1;
samples = 1024;
bpfilter = designfilt('bandpassfir', 'StopbandFrequency1', fs1_bp, ...
                      'PassbandFrequency1', fp1_bp, 'PassbandFrequency2', ...
                      fp2_bp, 'StopbandFrequency2', fs2_bp, ...
                      'StopbandAttenuation1', Ast, 'PassbandRipple', Prp, ...
                      'StopbandAttenuation2', Ast, 'DesignMethod', ...
                      'kaiserwin');
disp('The order of the filter is');
n = filtord(bpfilter)
[num, den] = tf(bpfilter);
disp('The transfer function of the filter is');
bptf = filt(num,den,fs_bp)
z_bp = roots(num);
p_bp = roots(den);
figure(1)
freqz(num,den,samples,fs_bp);
title('Band Pass filter designed with specifications')
figure(2)
zplane(z_bp,p_bp)
title('pole and zero plot of FIR Band pass filter')