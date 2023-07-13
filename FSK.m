bits = [1 0 1 1 0 0 1];
bitrate = 1;
n = 1000;#ekta bit e koto gulo point
T = length(bits)/bitrate;#time
N = n*length(bits);#total point
dt = T/N;#por por duita point er moddhe difference
t = 0:dt:T;
x = zeros(1,length(t));#zeros(n x m)
f = 3
a = 2
signal_for_one = a * sin( 2 * pi * f * t);
signal_for_zero = a * sin(2 * pi * 2 * f * t);

for i=1:length(bits)
  if bits(i)==1
    x((i-1)*n + 1:i*n) = signal_for_one((i - 1) * n + 1: i * n);
  else
    x((i-1)*n + 1:i*n) = signal_for_zero((i - 1) * n + 1: i * n);
  end
end
plot(t, x, 'Linewidth', 2);
grid on;

dem = zeros(1 , int16(length(x)/ n));
for i = 1 : length(x) / n
  if(x((i - 1) * n + 1 : i *n) == signal_for_zero((i - 1) * n + 1: i * n))
  dem(i) = 0;
else
  dem(i) = 1;
  end
end
display(dem);
