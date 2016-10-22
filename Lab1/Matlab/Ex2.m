% Excercise 2
% 2.1
n1 = 1000;
n2 = 10000;

Xn1 = randn(1, n1);
figure; histogram(Xn1);
figure; histfit(Xn1);

Xn2 = randn(1, n2);
figure; histogram(Xn2);
figure; histfit(Xn2);

% Discussion:
% The 2 experients have the same shape "the bell shape"
% representing that this random process tend to have a normal distribution, independent of the number of samples.

%% ----------------------------------
%2.2
n1 = 1000;
n2 = 10000;

Xn3 = rand(1, n1);
figure; histogram(Xn3);

Xn4 = rand(1, n2);
figure; histogram(Xn4);

% Discussion:
% The 2 experients have the same shape "the Uniform shape"
% representing that this random processes tend to have a uniform distribution, independent of the number of samples.

%% ----------------------------------
%2.3
[acor,lag] = xcorr(Xn1);

figure
plot(lag, acor)
title('Autocorrelation of Gaussian distributed signal')
xlabel('lag')
ylabel('auto correlation')

[acor_,lag_] = xcorr(Xn3);

figure
plot(lag_, acor_)
title('Autocorrelation of uniform distributed signal ')
xlabel('lag')
ylabel('auto correlation')

% The gaussian distribution is white, as its autocorrelation is almost 0
% The 0 correlation means that there is no pattern in the signal, it is naturally random
% The Uniform distribution has a pattern, so its correlation != 0

%% ----------------------------------
%2.4
s1 = round(rand(1, 50));
s2 = round(rand(1, 50));
s3 = round(rand(1, 50));

s = [s1 s2 s3];

[acor1,lag1] = xcorr(s1, s);
figure
plot(lag1, acor1)
title('Autocorrelation of s1 and s')
xlabel('lag')
ylabel('auto correlation')

[acor2,lag2] = xcorr(s2, s);
figure
plot(lag2, acor2)
title('Autocorrelation of s2 and s')
xlabel('lag')
ylabel('auto correlation')

[acor3,lag3] = xcorr(s3, s);
figure
plot(lag3, acor3)
title('Autocorrelation of s3 and s')
xlabel('lag')
ylabel('auto correlation')

% The 3 correlations are almost the same,
% I this this is because the 3 original signals are random, and have the same distributions

