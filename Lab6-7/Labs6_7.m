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

%% Ex.2
% Dirac signal:
dirac = Dirac(40, 20); % dirac with n = 20 and N = 40 from lab 1

% Values of scaling
scale = 0.5; 
Ts = 1; 
alpha = scale*Ts;  
alpha_signal = exp(-alpha) ;

% Anti-Causal part of smoothing filter
DiracAnticausalSmoothing = zeros(length(dirac),1);
DiracLength=length(dirac)-2:-1:1;

for i =  DiracLength 
 DiracAnticausalSmoothing(i) = scale*alpha*alpha_signal*dirac(i+1)+(2*alpha_signal)*DiracAnticausalSmoothing(i+1)-(alpha_signal^2)*DiracAnticausalSmoothing(i+2);
end

figure(); stem (DiracAnticausalSmoothing); title('Dirac Anti-causal Smoothing'); 

% Causal part of smoothing
dirac_causal_smooth = zeros(length(dirac),1);

for i = 3:length(dirac);
 dirac_causal_smooth(i) = -scale*alpha*alpha_signal*dirac(i-1)+(2*alpha_signal)*DiracAnticausalSmoothing(i-1)-(alpha_signal^2)*DiracAnticausalSmoothing(i-2);
end

figure(); stem(dirac_causal_smooth); title('Dirac Causal Smoothing'); 

% Step Signal
step10=Step(40,10);
step30=Step(40,30);
step = step10 - step30;

% Causal Derivative function
StepCausal = zeros(length(step),1) ;

for i = 3 : length(step)
 StepCausal(i) = step(i)+alpha_signal*(alpha-1)*step(i-1)+(2*alpha_signal)*StepCausal(i-1)-(alpha_signal^2)*StepCausal(i-2) ;
end

figure(); stem (StepCausal); title('Causal Deravative');

%Anti-causal derivative function

StepAnticausal = zeros(length (step),1);
step_length = length(step)-2 : -1 : 1 ;

for i = step_length  
 StepAnticausal(i) = alpha_signal*(alpha+1)*step(i+1)-(alpha_signal^2)*step(i+2)+(2*alpha_signal)*StepAnticausal(i+1)-(alpha_signal^2)*StepAnticausal(i+2) ;  
end

figure(); stem (StepAnticausal); title('Anti-Causal Deravative');

%% Ex. 3



