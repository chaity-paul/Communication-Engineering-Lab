%modulation
  %bits = input('Enter the bits : ');
  bits = [0 1 0 0 1 1];
  bitrate = 1;
  n = 1000;
  N = n * length(bits);
  T = length(bits) / bitrate;
  dt = T / N;
  t = 0 : dt : T;
  x = zeros(1, length(t));

  current = -1;
  for i=1:length(bits)
    if bits(i)==1
      x((i-1)*n + 1: (i-1)*n + (n / 2)) = -current;
      x((i-1)*n + (n / 2) + 1: i * n) = current;
      current = -current;
    else
      x((i-1)*n + 1: (i-1)*n + (n / 2)) = current;
      x((i-1)*n + (n / 2) + 1: i * n) = -current;
    end
  end

  plot(t, x, 'Linewidth', 2);
  grid on;

%demodulation
  dem = zeros(1 , int16(length(x)/ n));
current = -1;
for i = 1 : length(x) / n
  if(x((i - 1)* n + 1) == current)
  dem(i) = 0;
else
  dem(i) = 1;
  current = -current;
  end
end
display(dem);
