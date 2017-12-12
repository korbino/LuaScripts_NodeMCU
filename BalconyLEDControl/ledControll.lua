--Led Controll file
--Functions:
function setRGBVarsToZero()
     r = 0
     g = 0
     b = 0
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

function gerlandActivation()
    pwm.setup(1,500,512) --red pin 1
    pwm.setup(2,500,512) --green pin 2
    pwm.setup(3,500,512) --blue pin 3
    pwm.start(1) 
    pwm.start(2) 
    pwm.start(3)

    --main cycle of grland   
        setRGBVarsToZero()
        while (r < 1000) do --white color  controll
            pwm.setduty(1,r) 
            pwm.setduty(2,g) 
            pwm.setduty(3,b)   
            r = r+50
            g = g+50
            b = b+50         
            print("red:"..r.." green:"..g.." blue:"..b)
            tmr.delay(100)
        end
        while (r > 0) do --decrease light
            pwm.setduty(1,r) 
            pwm.setduty(2,g) 
            pwm.setduty(3,b)   
            r = r-50
            g = g-50
            b = b-50         
            print("red:"..r.." green:"..g.." blue:"..b)
            tmr.delay(100)
        end         
            setRGBVarsToZero()
         while (r < 1000) do --red color  controll         
            pwm.setduty(1,r) 
            pwm.setduty(2,g) 
            pwm.setduty(3,b)   
            r = r+50                   
            print("red:"..r.." green:"..g.." blue:"..b)
            tmr.delay(100)
        end
        while (r > 0) do --decrease light
            pwm.setduty(1,r) 
            pwm.setduty(2,g) 
            pwm.setduty(3,b)   
            r = r-50    
            print("red:"..r.." green:"..g.." blue:"..b)
            tmr.delay(100)
        end        

         setRGBVarsToZero()
         while (g < 1000) do --green color  controll         
            pwm.setduty(1,r) 
            pwm.setduty(2,g) 
            pwm.setduty(3,b)   
            g = g+50                   
            print("red:"..r.." green:"..g.." blue:"..b)
            tmr.delay(100)
        end
        while (g > 0) do --decrease light
            pwm.setduty(1,r) 
            pwm.setduty(2,g) 
            pwm.setduty(3,b)   
            g = g-50    
            print("red:"..r.." green:"..g.." blue:"..b)
            tmr.delay(100)
        end         

         setRGBVarsToZero()
         while (b < 1000) do --green color  controll         
            pwm.setduty(1,r) 
            pwm.setduty(2,g) 
            pwm.setduty(3,b)   
            b = b+50                   
            print("red:"..r.." green:"..g.." blue:"..b)
            tmr.delay(100)
        end
        while (b > 0) do --decrease light
            pwm.setduty(1,r) 
            pwm.setduty(2,g) 
            pwm.setduty(3,b)   
            b = b-50    
            print("red:"..r.." green:"..g.." blue:"..b)
            tmr.delay(100)
        end         
end

collectgarbage()
