%modulation
  bits = input('Enter the bits : ');
  bitrate = 1;
  n = 1000;
  N = n * length(bits);
  T = length(bits) / bitrate;
  dt = T / N;
  t = 0 : dt : T;
  x = zeros(1, length(t));

  for i = 1 : length(bits)
    if bits(i) == 1
      x((i - 1) * n + 1 : i * n) = 1;
    endif
  end

  plot(t, x, 'Linewidth', 2);
  grid on;

%demodulation
  dem = zeros(1, int16(length(x) / n));
  for i = 1 : length(x) / n
    dem(i) = x(n * i);
  endfor
  display(dem);

