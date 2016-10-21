% 1.1
N = 20;
n = 10;

DiracOut = Dirac (N, n);
k = 1:1:N;

figure
stem (k, DiracOut);
title('Dirac Function')
xlabel('k')
ylabel('Dirac output')

%% ----------------------------------
% 1.2
StepOut = Step (N, n);
k = 1:1:N;

figure
stem (k, StepOut);
title('Step Function')
xlabel('k')
ylabel('Step output')
