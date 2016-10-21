function OutSignal = Box(a, N, n)

if n > N-a || n < 1+a
    error('n must be +ve number < 20')
end 

OutSignal = zeros(1, N);
OutSignal (n-a : n+a) = 1;
