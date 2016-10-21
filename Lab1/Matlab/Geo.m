function OutSignal = Ramp(a, k, N, n)

if n > N || n < 0
    error('n must be +ve number < 20')
end 

OutSignal = (a.^(k-n) ) .* Step(N,n);
