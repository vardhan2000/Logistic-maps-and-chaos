function feigenbaum_constant
    N = 10;
    r_arr = zeros(1,N);
    r = 2.8;
    i = 1;
    take_readings_after = 100000;
    prev_period = 1;
    accuracy = 1000000; % values are considered same if they match till 7 decimal places
    while i <= N % we note down r_n till 1024 bifurcations. For more than
                 % that the iteration will take too long
        x_n = 0.1;
        period_start = 0;
        count = 0;
        period = 1; 
        while 1
            if count == take_readings_after
                period_start = floor(accuracy*x_n);
            elseif count > take_readings_after
                if floor(x_n*accuracy) == period_start
                   if period > prev_period
                       prev_period = period;
                       fprintf("%f\n", r); % print r_n onto command window 
                       r_arr(i) = r;
                       i = i+1;
                   end
                   break;
                else
                    period = period+1;
                end
            end
            x_n = r * x_n * (1-x_n);
            count = count+1;
        end
        r = r + 0.000001; % increment r by 10^(-6)
    end
    
    % calculating and generating the value of feigenbaum number by using
    % various r_n
    feigen_const_arr = zeros(1,N-2);
    for i = 2:N-1
        feigen_const_arr(i-1) = (r_arr(i)-r_arr(i-1)) / (r_arr(i+1)-r_arr(i));
    end
    n = 2:N-1;
    plot(n,feigen_const_arr,'b.-');
    ylim([2 5]);
    xlabel('n');
    ylabel('\sigma');
    title('Feigenbaum constant');
end