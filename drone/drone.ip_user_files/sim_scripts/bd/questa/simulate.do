onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib drone_opt

do {wave.do}

view wave
view structure
view signals

do {drone.udo}

run -all

quit -force
