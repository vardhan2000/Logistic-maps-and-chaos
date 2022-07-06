% generates a time series plot for given r
function time_series(r)
    % generating and storing:-
    % 1. various X_n which will act as y-coord for 
    % 2. various n which will act as x-coord
    [x_n,n] = generate_data(r);
    
    % plot the time series graph
    plot(n,x_n,'b.-');
    xlabel("n");
    ylabel("X_n");
    title(strcat('r = ', num2str(r,7)));
end


% generates values of x_n for various values of n(0 to 50)
% using the recursive relation
% x_(n+1) = r * x_n * (1 - x_n)
function [x_n_arr,n_arr] = generate_data(r)
    start = 0;
    limit = 50; % I've taken the limit=50 as it was told to "reproduce" 
                % the graphs given in pdf
    n_arr = start:limit;
    x_n_arr = zeros(1,limit-start+1);
    x_n = 0.1; % initial fraction X_0
    for i = 1:limit+1
        x_n_arr(i) = x_n;
        x_n = r * x_n * (1-x_n); % updating x_n
    end
end