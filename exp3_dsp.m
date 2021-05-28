f1 = 10;
fs = 100;
tmin = 0;
tmax = 10/f1;
t = tmin:1e-3:tmax;
x1 = cos(2*pi*f1*t);
Ts = 1/fs;
ts = tmin:Ts:tmax;
x1_sampled = cos(2*pi*f1*ts);
x1_reconstructed = zeros(1, length(t));
samples = length(ts);
for i = 1:1:length(t)
    x1_reconstructed(i) = sum(x1_sampled.*sinc((t(i)-(1:samples)*Ts)./Ts));
end
figure(1)
subplot(3,1,1)
plot(t,x1);
grid on
title('cosine signal')
subplot(3,1,2)
stem(ts, x1_sampled)
grid on
title('sampled signal')
subplot(3,1,3)
plot(t,x1_reconstructed)
hold on
plot(t, x1);
legend('reconstructed', 'original')
hold off
title('Reconstructed vs original signal')
grid on