vsim -gui work.floor 

add wave -position insertpoint  \
sim:/floor/clk \
sim:/floor/in \
sim:/floor/out \
sim:/floor/exp \
sim:/floor/sign


force -freeze sim:/floor/clk 1 0, 0 {10 ns} -r 20
force -freeze sim:/floor/in 11000001011100110111000010100100 0

run 20ns