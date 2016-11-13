function y = convFn (x, h)

  iter = length(h) + 2*length(x);
  h_fliped = fliplr(h);
  
  %x = [zeros(1, length(h)), x ,zeros(1, length(h))];
  h_fliped = [zeros(1,length(x)), h_fliped , zeros(1, length(x)) ];
  
  z=  length(x) + length(h);
  h_fliped(z: end);
  
  c = 1;
  for i = 0 : z
      y(c) =  sum ( h_fliped(z+1-i: end-i) .* x);
      c = c+1;
  end

end