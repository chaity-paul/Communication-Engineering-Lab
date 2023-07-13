bits = [1 0 0 1 1 1 0];
bitrate = 1;
n = 1000;
N = n * length(bits);
T = length(bits) / bitrate;
dt = T / N;
t = 0 : dt : T;
x = zeros(1, length(t));
for i = 1 : length(bits)
  if bits(i) == 1
    x((i - 1) * n + 1 : i * n) = -1;
  else
    x((i - 1) * n + 1 : i * n) = 1;
  endif
end

plot(t, x, 'Linewidth', 2);
grid on;

dem = zeros(1, int16(length(x) / n));
for i = 1 : length(x) / n
  if x(i * n) == -1
    dem(i) = 1;
  endif
end
display(dem);

