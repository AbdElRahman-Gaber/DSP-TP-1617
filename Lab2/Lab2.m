%Reminder 1
f = 1;
fs = 20;
t= 0 : 0.1 : 10;
y1 = sin(2*pi*f*t);
y2 = sin((2*pi*f*t)/fs);

figure
subplot(2,1,1)      
plot(t,y1)
title('contineous')

subplot(2,1,2)      
stem(t,y2)       
title('sampled')


%% Ex 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = step(10,4);

for k = 1 : 9   
    y(k) = (x(k) + x(k+1))/2;
end

figure(2);
stem(y);

% 1.2:
% my modification is to use y(k) = x(k) + x(k-1),, Let's try this!

for k = 2 : 10   
   y(k) = (x(k) + x(k-1))/2;
end

figure;
stem(y);

%% Ex 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = step(10,4);

for k = 1 : 10   
    y1(k) = sum(f(1:k));
end

figure;
stem(y);
% for step, it is not stable >> will add up to infinity

%%%%%%%%%%%%
%2.2
f = Dirac(10, 4);
for k = 1 : 10   
    y2(k) = sum(f(1:k)) ;
end
figure;
stem(y);
% for Dirac, it is stable >> will converge to a certain number

%%%%%%%%%%%%
%2.3
x = Dirac(10, 4);
for k = 2 : 10   
    y(k) = x(k) + 2*y(k-1);
end
figure;
stem(y);
% this system will not be stable >> add up to infinit

%%%%%%%%%%%%
%2.4
x = Dirac(10, 4);
for k = 2 : 10   
    y(k) = x(k) + y(k-1)/3;
end
figure;
stem(y);
%this system will be stable >> add up to 0


%% Ex 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%






