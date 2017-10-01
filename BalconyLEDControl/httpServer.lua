-- ====a simple HTTP server====

--load file with led controll functions. 
--This file will include all functions, that will be need for LED RGB controll
require("ledControll")

--WebServer itself:
srv = net.createServer(net.TCP)

srv:listen(80, function(conn)
    conn:on("receive", function(sck, payload)
        print(payload) 
        if payload:find("color=red") then  
            sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")  
            sck:send("Led is Red")  
            setRGBLedMode(512,0,0,"")
        end
        if payload:find("color=green") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")  
           sck:send("Led is Green")
           setRGBLedMode(0,512,0,"")
        end  
        if payload:find("color=blue") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")  
           sck:send("Led is Blue")  
           setRGBLedMode(0,0,512,"")
        end
        if payload:find("color=white") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")  
           sck:send("Led is White")  
           setRGBLedMode(512,512,512,"")
        end
        if payload:find("color=none") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")  
           sck:send("Led is White")  
           setRGBLedMode(0,0,0,"")
        end
        if payload:find("color=test") then           
           sck:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")  
           sck:send("This is TEST")          
           dofile("a.lua")           
        end
    end)
    conn:on("sent", function(sck) sck:close() end)
end)

--carbage collector:
collectgarbage()
