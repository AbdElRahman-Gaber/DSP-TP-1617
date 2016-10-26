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
% 3.1

xa = [0 0 0 0 1 2 3 4 5 0 0 0 0 0 0 0 0 0 0];
xb = [0 0 0 0 0 0 0 0 0 4 3 2 1 0 0 0 0 0 0];


for k = 2 : 10  
ya(k) = 3*xa(k-1) - 2*xa(k) + xa(k+1);
yb(k) = 3*xb(k-1) - 2*xb(k) + xb(k+1);
end

fprintf('The value of ya is : \n')
disp(ya);

fprintf('The value of yb is : \n')
disp(yb);

% 3.2

% The system is linear if it is homogeaneous and additive,
% ie. if the input is multiplied by a constant b, the output 
% will be scaled by the same amount 'b' .. and if the input of
% the 2 systems are added, the output will be the addition of 
% the 2 outputs .. to sum up: b*xa >> bxa ,, xa+xb >> ya+yb ,, 
% let's check this 

% first multiply x by 2 and check y 
for k = 2 : 10  
ya1(k) = 2* (3*xa(k-1) - 2*xa(k) + xa(k+1) );
end

fprintf('The value of ya1, after multiplying x by 2 is : \n')
disp(ya1);

% By cpmparing the results, ya1 = 2*ya 
% second we add xa + xb, and let this to be the input of the system,
% then check if the output = ya + yb 

for k = 2 : 10  
z(k) =  3*xa(k-1) - 2*xa(k) + xa(k+1) + 3*xb(k-1) - 2*xb(k) + xb(k+1);
end

y_sum = ya + yb;

fprintf('The value of z the o/p of xa+xb is : \n')
disp(z);

fprintf('The value of y_sum is : \n')
disp(y_sum);

% The 2 outputs are the same so, the system is homogeneous and additive
% So the system is Linear


%3.3
% nonlinear and noninvariant system proposed is:
% n*x(n)^2 + x(n-1)
% it is nonlinear because of the second order term x(n)^2
% it is noninvariant because of the n multiplied by x(x)^2

% source:
% https://ccrma.stanford.edu/~jos/fp/Showing_Linearity_Time_Invariance.html