%bits = [1 0 1 1 0 0 1];
bits = [1 1 1 1 1 1 1 1 0 0 0 0 0 0 1];
bitrate = 1;
n = 1000;#ekta bit e koto gulo point
T = length(bits)/bitrate;#time
N = n*length(bits);#total point
dt = T/N;#por por duita point er moddhe difference
t = 0:dt:T;
x = zeros(1,length(t));#zeros(n x m)
current = 0 %asssume the last bit is 1
next = 1

for i=1:length(bits)
  if bits(i)==1
    if current == 0
      x((i-1)*n + 1:i*n) = next;
      current = next;
      next = -next;
    else
      x((i-1)*n + 1:i*n) = 0;
      current = 0;
      end
  else
    x((i-1)*n + 1:i*n) = current;
  end
end
plot(t, x, 'Linewidth', 10);
grid on;

dem = zeros(1 , int16(length(x)/ n)); % proti bit er jonno n ta kore signal neya hoyechuilo
% so length(x) ta signal kotogula bit generate korbe
% length(x) / n
current = 0;
for i = 1 : length(x) / n
  if(x((i-1)*n + 1:i*n) == current)
    dem(i) = 0;

  else
    dem(i) = 1;
  end
  current = x(i * n);
end
display(dem);
