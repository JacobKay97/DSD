lowerLim = -40;
upperLim = 64;

in = [lowerLim:1:upperLim];
out = mod(in,2*pi);
out2 = zeros(1, length(in));
out3 = zeros(1, length(in));

for i = 1:length(in)
    if(out(i) <= pi)
        out(i) =  - (out(i)-pi/2);  
    else
        out(i) = out(i) - 3*pi/2;

    end
end

test = cos(in);
test2= sin(out);

sum(test-test2)
max(out)/pi
min(out)/pi