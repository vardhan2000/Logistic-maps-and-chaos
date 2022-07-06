% plots a bifurcation diagram or orbit diagram for r = 1 to r = 4 
function orbit_diagram
   r_arr = zeros(1,100000); % stores the various values of r
   range_arr = zeros(1,100000); % stores the distinct values that x_n
                                % achieves for corresponding r
   r = 1; % we start from r =1 
   x_0 = 0.1; % X_0 = 0.1 
   count = 1;
   while r <= 4
       x_n = x_0;
       period_start = 0; % stores the value of x_n with which we start to 
                         % take the reading. If this value repeats for some
                         % n=p, it means that we've noted all the distinct
                         % values that x_n can achieve, till n=p-1, and
                         % hence we break the loop.
       
       for i = 1:601 % I've taken this upper limit of 601 because for the 
                     % chaotic part "period_start" might repeat after a
                     % very long time.
           
           if i == 300 % start taking the reading for values of x_n
               period_start = floor(x_n*1000);
               r_arr(count) = r;
               range_arr(count) = x_n;
               count = count + 1;
           elseif i > 300
               if floor(x_n*1000) == period_start % if values match till
                   break;                         % 3 decimal places then  
               else                               % the are considered same
                   r_arr(count) = r;
                   range_arr(count) = x_n;
                   count = count + 1;
               end
           end
           x_n = r * x_n * (1-x_n); % update x_n
       end
       r = r + 0.001; % increment r
   end
   
   % plot the graph of X vs r(orbit diagram) 
   plot(r_arr(1:count),range_arr(1:count),'b.');
   xlim([r_arr(1) 4]);
   xlabel("r");
   ylabel("X_n");
   title('orbit diagram');
end

