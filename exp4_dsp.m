n = -5:5;
N= 3;
step1 = n>=(-N);
step2 = n>=(N+1);
xa = step1-step2;
w = conv(xa,xa) %a


%4b
xb = [2,1,3,5,9,0,0]; %signal iszero padded to make them start at the same time
h = [0, 0, 5,5,8,9,2];
z = conv(xb,h)


%4c
xc = [1,4,1,3];
z = autocorr(xc)