function OutSignal = Sinfn(Fc, Fs, nPeriods)

%Fc = 10;   
%Fs = 100;     
%nPeriods = 2;

Ts = 1/Fs;     % seconds per sample
StopTime = nPeriods * (1/Fc);  % seconds
t = (0: Ts :StopTime-Ts)';     % seconds 

OutSignal = sin(2*pi*Fc*t);

figure;
stem(t, OutSignal);
title('Sine Signal versus Time');
xlabel('time (in seconds)');
ylabel('Magnitude');



