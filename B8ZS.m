%bits = [1 0 1 1 0 0 1];
%bits  = [1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0];
bits = [1 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1];

bitrate = 1;
n = 1000;#ekta bit e koto gulo point
T = length(bits)/bitrate;#time
N = n*length(bits);#total point
dt = T/N;#por por duita point er moddhe difference
t = 0:dt:T;
x = zeros(1,length(t));#zeros(n x m)
current = -1 %asssume the last bit is 1
zero = 0;
for i=1:length(bits)
  if bits(i)==1
    x((i-1)*n + 1:i*n) = -current;
    current = -current;
    one = one + 1;
    zero = 0;
  else
    x((i-1)*n + 1:i*n) = 0;
    zero = zero + 1;
    if(zero == 8) %000vb0vb
      x((i-1)*n + 1:i*n) = current;
      x((i-2)*n + 1:(i- 1)*n) = -current;
      x((i-4)*n + 1:(i- 3)*n) = -current;
      x((i-5)*n + 1:(i- 4)*n) = current;
      zero = 0;
     end
   end

end

plot(t, x, 'Linewidth', 5);
grid on;

dem = zeros(1 , int16(length(x)/ n));

current = -1;
for i = 1 : length(x) / n
  if(x(i * n) == current)
    dem(i) = 0;
    dem(i + 1) = 0;
    x(i * n + 1: (i + 1) * n) = 0;
    current = -current

  elseif x(i * n) == -current
    dem(i) = 1;
    current = -current;
  else
    dem(i) = 0;

  end
end
display(dem);
