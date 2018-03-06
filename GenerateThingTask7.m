lowerLim = -40;
upperLim = 64;

in = [lowerLim:1:upperLim];
out = mod(in,2*pi);
out2 = zeros(1, length(in));
out3 = zeros(1, length(in));

for i = 1:length(in)
    if(out(i) <= pi/2)
        out3(i) = 1;
    elseif(out(i) <= pi)
        %second quadrant
        out(i) = pi - out(i);
        out3(i) = -1;
    elseif(out(i) <= 3*pi/2)
        out(i) = out(i) - pi;
        out3(i) = -1;
    else
        out(i) = 2*pi - out(i);
        out3(i) = 1;
    end
end

test = cos(in);
test2= out3.*cos(out);

sum(test-test2)
