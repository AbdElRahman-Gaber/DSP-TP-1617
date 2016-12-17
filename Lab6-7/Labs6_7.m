%% Ex.1
%1. ButterWorth Filter

[a,b] = butter(3, 0.5, 'low'); %Low-pass filter
[H, W]= freqz(a,b);
figure(); 
subplot(2,2,1); plot(W/pi, abs(H)); title('Low-Pass Butterworth Filter');

[a,b] = butter(3,0.5, 'high'); %High-pass filter
[H, W]= freqz(a,b);
subplot(2,2,2); plot(W/pi, abs(H)); title('High-pass Butterworth Filter');

[a,b] = butter(3, [0.4 0.6]); %Band-pass filter with pass band 0.4-0.6
[H, W]= freqz(a,b);
subplot(2,2,3); plot(W/pi, abs(H)); title('Band-pass Butterworth Filter');


[a,b] = butter(3,[0.4 0.6],'stop'); %Band-stop filter with stop band 0.4-0.6
[H, W]= freqz(a,b);
subplot(2,2,4); plot(W/pi, abs(H)); title('Band-Stop - Butterworth');

%% Chebychev-I Filter

[a,b] = cheby1(3,1,0.5,'low');  %Low-pass filter
[H, W]= freqz(a,b);
figure();
subplot(2,2,1); plot(W/pi, abs(H)); title('Low-pass Chebychev-I filter');


[a,b] = cheby1(3,1, 0.5, 'high'); %High-pass filter
[H, W]= freqz(a,b);
subplot(2,2,2); plot(W/pi, abs(H)); title('High-pass Chebychev-I filter');


[a,b] = cheby1(3,1, [0.4 0.6]); %Band-pass filter with pass band 0.4-0.6
[H, W]= freqz(a,b);
subplot(2,2,3); plot(W/pi, abs(H)); title('Band-pass Chebychev-I filter');

[a,b] = cheby1(3,1, [0.4 0.6] , 'stop'); %Band-stop filter with stop band 0.4-0.6
[H, W]= freqz(a,b);
subplot(2,2,4); plot(W/pi, abs(H)); title('Band-stop Chebychev-I filter');





