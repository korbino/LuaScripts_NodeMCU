--Led Controll file
--Functions:
function ledOperations (pin, pwmRate, messageToConsole)
    print(messageToConsole)
    pwm.setup(pin, 500, pwmRate)
    pwm.start(pin)
    pwm.setduty(1, pwmRate)
end

function setRGBLedMode(r,g,b,debug)
    pwm.setup(1,500,512) --red pin 1
    pwm.setup(2,500,512) --green pin 2
    pwm.setup(3,500,512) --blue pin 3
    pwm.start(1) 
    pwm.start(2) 
    pwm.start(3)
    pwm.setduty(1,r) 
    pwm.setduty(2,g) 
    pwm.setduty(3,b) 
    print("red:"..r.." green:"..g.." blue:"..b)
    print("DEBUG: "..debug)
end


--carbage collector:
collectgarbage()
