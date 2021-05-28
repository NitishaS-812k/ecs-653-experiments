%analog low pass filter
nlp = 5;
fclp = 300; %cutoff frequency
fs = 1000;
[blp,alp] = butter(nlp,fclp/(fs/2), 'low');
figure(1)
freqz(blp,alp)
title('analog IIR low pass butterworth filter with order 5')
disp('The transfer function of the low pass filter is');
lpftf = filt(blp,alp,fs)


%analog high pass filter
nhp = 5;
fchp = 400;
[bhp,ahp] = butter(nhp, fchp/(fs/2), 'high');
figure(2)
freqz(bhp, ahp)
title('analog IIR high pass filter (Butterworth n = 5)')
disp('The transfer function of the high pass filter is');
hpftf = filt(bhp,ahp,fs)


%analog band pass filter
nbp = 5;
bandp = [300, 400];
[bbp, abp] = butter(nbp,bandp/(fs) , 'bandpass');
figure(3)
freqz(bbp,abp)
title('analog IIR band pass filter (Butterworth n = 5)')
disp('The transfer function of the low pass filter is');
bpftf = filt(bbp,abp,fs)