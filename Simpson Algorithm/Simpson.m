function I = Simpson(x,y)
% x is an array of x values
% y is an array of y values that correspond to the array of x values


%Function setup

if nargin ~= 2 
    error('hey you need two inputs'); 
end

if length(x) ~= length(y) 
    error('x values need y values, y values need x');
end

spacing = diff(x); % this tells you what the size of the intervals between x values is

for i = 1:length(spacing) % this checks if interval sizes are the same
    if spacing(1) ~= spacing (i)
        error('intervals are not linearly spaced'); 
    end
end

if rem(length(x),2) == 1 
    trap = 0; % even # of intervals, use simpsons 1/3
else
    trap = 1;
    warning('Trapezoid rule will be needed'); % odd # of intervals, use trap as well
end 

% Simpson's 1/3

if trap == 0 % no trap rule
    
sum = y(1);

for i = 2 : length(x)-1
    
    if rem(i,2) == 0
        sum = sum + (y(i) * 2); %if even 
    else 
        sum = sum + (y(i) * 4); %if odd
    end
    
end

sum = sum + y(length(x));

area = ( x(length(x)) - x(1) ) / ( 3 * length(x) );

sum = sum + area;

end




if trap == 1 % we trappin'
    
    sum = y(1);

for i = 2 : length(x)-2
    
    if rem(i,2) == 0
        sum = sum + (y(i) * 2); %if even 
    else 
        sum = sum + (y(i) * 4); %if odd
    end
    
end

sum = sum + y(length(x)-1);

area = ( x(length(x)) - x(1) ) / ( 3 * length(x) );

sum = sum + area;

trap = ( y(length(x-1)) + y(length(x)) ) / 2 * ( x(length(x)) - x(length(x-1)) );


end



I = sum + trap;



    
    
     
