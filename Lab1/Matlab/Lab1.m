% 1.1
N = 20;
n = 10;
k = 1:1:N;

DiracOut = Dirac (N, n);

figure
stem (k, DiracOut);
title('1.1 Dirac Function')
xlabel('k')
ylabel('Dirac output')

%% ----------------------------------
% 1.2
StepOut = Step (N, n);

figure
stem (k, StepOut);
title('1.2 Step Function')
xlabel('k')
ylabel('Step output')

%% ----------------------------------
% 1.3
a =2;

RampOut = Ramp (a, k, N, n);

figure
stem (k, RampOut);
title('1.3 Ramp Function')
xlabel('k')
ylabel('Ramp output')

%% ----------------------------------
% 1.4
a =2;

GeoOut = Geo (a, k, N, n);

figure
stem (k, GeoOut);
title('1.4 Geometric Function')
xlabel('k')
ylabel('Geometric output')

%% ----------------------------------
% 1.5
a = 3;
BoxOut = Box(a, N, n);

figure
stem (k, BoxOut);
title('1.5 Box Function')
xlabel('k')
ylabel('Box output')

%% ----------------------------------
% 1.6
% First:
Fc = 10;       % The Frequency of the wave
Fs = 100;     % Sampling Freq >> samples per second
nPeriods = 1;  % Number of periods

SinfnOut = Sinfn(Fc, Fs, nPeriods);

% Second:
Fc = 10;       % The Frequency of the wave
Fs = 1/1000;   % Sampling Freq = 1/Ts
nPeriods = 2;  % Number of periods

SinfnOut = Sinfn(Fc, Fs, nPeriods);

% Third:
Fc = 10;       % The Frequency of the wave
Fs = 1/30;     % Sampling Freq = 1/Ts
nPeriods = 2;  % Number of periods

SinfnOut = Sinfn(Fc, Fs, nPeriods);


