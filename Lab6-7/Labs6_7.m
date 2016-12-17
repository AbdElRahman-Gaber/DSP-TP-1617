%% Ex.1
%1.1 ButterWorth and Chebychev-I Filters
figure(); 
[a,b] = butter(3, 0.5, 'low'); %Low-pass filter
[H, W]= freqz(a,b);
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

figure();
[a,b] = cheby1(3,1,0.5,'low');  %Low-pass filter
[H, W]= freqz(a,b);
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

%% 1.2

figure();
[x,y] = cheby1(3,1,0.5,'low'); % Chebyshev-I filter with order 3
[H, W]= freqz(x,y);
subplot(2,2,1); plot(W/pi, abs(H)); title('Low-pass Chebyshev-I filter with order 3');

[x,y] = cheby1(5,1,0.5,'low'); % Chebyshev-I filter with order 5
[H, W]= freqz(x,y);
subplot(2,2,2); plot(W/pi, abs(H)); title('Low-pass Chebyshev-I filter with order 5');

[x,y] = cheby1(10,1,0.5,'low'); % Chebyshev-I filter with order 10
[H, W]= freqz(x,y);
subplot(2,2,3); plot(W/pi, abs(H)); title('Low-pass Chebyshev-I filter with order 10');

[x,y] = cheby1(20,1,0.5,'low'); % Chebyshev-I filter with order 20
[H, W]= freqz(x,y);
subplot(2,2,4); plot(W/pi, abs(H)); title('Low-pass Chebyshev-I filter with order 20');

% Discussion:
% By increasing the order the filter is closer to the ideal low pass
% filter, but the ripples increase as well.





