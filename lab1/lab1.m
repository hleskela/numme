%% Assignment 1
% The issue can be resolved with "+ (-10^kv(j) - pi)" instead. 
% The larger the number, the less pi plays a role in the addition
% to 10^kv(j), which means the error will go towards the limit pi.
kv=0:10;
fv = [];
for j=1:length(kv)
    fv(j) = ((pi+10^kv(j))) - 10^kv(j) - pi
end
semilogy(kv,abs(fv))

%% Assignment 2

met1 = [];
met2 = [];
time1 = [];
time2 = [];

n = 200;
for ii = 1:100
    A = randn(n,n);
    b = randn(n,1);
    tic();
    x=gausselim(A,b);
    time1(ii) = toc();
    met1(ii) = norm(A*x-b);
    tic();
    x = A\b;
    time2(ii) = toc();
    met2(ii) = norm(A*x-b);
end
disp('mean values hand written code')
mean(met1)
mean(time1)
disp('mean values built-in')
mean(met2) % These met2 things have no meaning, remove
mean(time2)

%% Assignment 3
f = x -4*sin(2*x) -3
plot(f, [-5 5])