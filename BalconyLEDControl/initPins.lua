--Init all pins during module restart:

function initOutputPins(pin)
    gpio.mode(pin,gpio.OUTPUT)
    gpio.write(pin,gpio.LOW)
end
initOutputPins(1)
initOutputPins(2)
initOutputPins(3)



--carbage collector:
collectgarbage()
