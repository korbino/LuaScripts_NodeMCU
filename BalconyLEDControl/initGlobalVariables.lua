-- ==Init all global Variables==
--ledBrightness = nil
 
--==Functions:=====
--init led britness 
function initLedBrightnessVariable ()
    http.get("http://192.168.1.103:8080/smartHome/options?optionName=Brightness&isGetFromDB=true", nil, function(code, data)
    if (code < 0) then
        print("HTTP request failed")
        ledBrightness = nil
    elseif(data == "High")  then         
        ledBrightness = "High"
        print("ledBrightness: "..ledBrightness)
    elseif(data == "Middle") then
        ledBrightness = "Middle"
        print("ledBrightness: "..ledBrightness)
    elseif(data == "Low") then
        ledBrightness = "Low"
        print("ledBrightness: "..ledBrightness)  
    else
        print ("something wrong was recieved from main web server, and it the: "..ledBrightness)  
    end --end of if chain
  end) --end of http request   
end --end of function

initLedBrightnessVariable()



