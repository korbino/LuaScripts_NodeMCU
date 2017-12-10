-- ====a simple HTTP server====

--load file with led controll functions. 
--This file will include all functions, that will be need for LED RGB controll
require("ledControll")
require("initGlobalVariables")

--WebServer itself:
srv = net.createServer(net.TCP)

srv:listen(80, function(conn)
    conn:on("receive", function(sck, payload)
        print(payload)   
        initLedBrightnessVariable()     --first time checking for led brightness
        --LISTNENING INCOMING MODE PARAMS----       
        if payload:find("color=red") then  
            sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")                                
            if (ledBrightness == "High") then
                setRGBLedMode(1023,0,0,"led brightness is HIGH, color is RED")
            elseif (ledBrightness == "Middle") then          
                setRGBLedMode(512,0,0,"led brightness is MIDDLE, color is RED") 
            elseif (ledBrightness == "Low") then          
                setRGBLedMode(20,0,0,"led brightness is Low, color is RED")    
            end
        end
        if payload:find("color=green") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")             
           if (ledBrightness == "High") then
                setRGBLedMode(0,1023,0,"led brightness is HIGH, color is GREEN")
            elseif (ledBrightness == "Middle") then          
                setRGBLedMode(0,512,0,"led brightness is MIDDLE, color is GREEN") 
            elseif (ledBrightness == "Low") then          
                setRGBLedMode(0,20,0,"led brightness is Low, color is GREEN")    
            end
        end  
        if payload:find("color=blue") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")            
            if (ledBrightness == "High") then
                setRGBLedMode(0,0,1023,"led brightness is HIGH, color is BLUE")
            elseif (ledBrightness == "Middle") then          
                setRGBLedMode(0,0,512,"led brightness is MIDDLE, color is BLUE") 
            elseif (ledBrightness == "Low") then          
                setRGBLedMode(0,0,20,"led brightness is Low, color is BLUE")    
            end
        end
        if payload:find("color=white") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")            
           if (ledBrightness == "High") then
                setRGBLedMode(1023,1023,1023,"led brightness is HIGH, color is WHITE")
            elseif (ledBrightness == "Middle") then          
                setRGBLedMode(512,512,512,"led brightness is MIDDLE, color is WHITE") 
            elseif (ledBrightness == "Low") then          
                setRGBLedMode(20,20,20,"led brightness is Low, color is WHITE")    
            end
        end
        if payload:find("color=none") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")               
           setRGBLedMode(0,0,0,"Led mode is OFF")
        end
        if payload:find("color=test") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")  
           sck:send("This is TEST")          
           dofile("a.lua")           
        end            

        --Listnening brightness update from server - to update local variable
        if payload:find("updateBrightness=true") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")  
           print("DEBUG: Was recieved updateBrightness=true command")    
           initLedBrightnessVariable() --init ledBrightness variable  
           print("DEBUG: Was called initLedBrightnessVariable")    
           --dofile("a.lua")           
        end   
    end)
    conn:on("sent", function(sck) sck:close() end)
end)

--carbage collector:
collectgarbage()
