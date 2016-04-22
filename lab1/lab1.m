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
clear;
x = -2*pi:pi/100:3*pi;
plot(x, f(x), x, 0);
% Based on above plot, approximate start guesses are: 
% -1, -0.5, 2, 3, 4.5 for all roots
% -1 and 4.5 smallest and biggest root
guess = 4.5;
previous_guess = 0;
iterations = 0;
while abs(guess - previous_guess) > 10^-10
    iterations = iterations +1;
    previous_guess = guess;
    guess = guess - (f(guess)/df(guess));
end
disp('Done with Newton-Raphsons method')
guess
iterations
% root = -0.8984 in 3 iterations
% root = 4.5178 in 2 iterations
