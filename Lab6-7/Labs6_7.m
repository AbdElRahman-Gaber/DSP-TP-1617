
[x,y] = butter(3,0.5,'low');
[H, W]= freqz(x,y);
figure();
plot(W/pi, abs(H)); 
title('Low-Pass Butterworth Filter');