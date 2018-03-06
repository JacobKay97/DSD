lowerLim = -40;
upperLim = 64;

in = [2, 4, 6, 8, 10]
out = mod(in,2*pi)
out2 = zeros(1, length(in));
out3 = zeros(1, length(in));

for i = 1:length(in)
    if(out(i) <= pi)
        out(i) =  - (out(i)-pi/2);  
    else
        out(i) = out(i) - 3*pi/2;

    end
end

cosIn = cos(in)
sinOut= sin(out)
cosOut = cos(out)
sinIn = sin(in)
%sum(test-test2)
max(out)/pi;
min(out)/pi;