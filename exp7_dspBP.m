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
bpfilter = designfilt('bandpassfir', 'StopbandFrequency1', fs1_bp, ...
                      'PassbandFrequency1', fp1_bp, 'PassbandFrequency2', ...
                      fp2_bp, 'StopbandFrequency2', fs2_bp, ...
                      'StopbandAttenuation1', Ast, 'PassbandRipple', Prp, ...
                      'StopbandAttenuation2', Ast, 'DesignMethod', ...
                      'kaiserwin');
[num, den] = tf(bpfilter);
z_bp = roots(num);
p_bp = roots(den);
[bpf,w] = freqz(bpfilter,1024,fs_bp);
figure(1)
subplot(2,1,1)
plot(w, 10*(log10(abs(bpf))))
ylabel('Magnitude Response(in dB)')
xlabel('Frequency(Hz)')
ylim([-40 5])
subplot(2,1,2)
plot(w, unwrap(angle(bpf)))
title('Band Pass filter designed with specifications')
ylabel('Phase response(in radians)')
xlabel('Frequency(Hz)')
ylim([-40 10])
figure(2)
zplane(z_bp,p_bp)
title('pole and zero plot of FIR Band pass filter')