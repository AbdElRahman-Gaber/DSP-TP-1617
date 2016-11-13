function OutSignal = exponential(N, n)

if n > N || n < 0
    error('n must be +ve number < 20')
end 

for i=1 : N
    expout(i) = exp(i);
end

OutSignal = expout .* Step(N,n);
