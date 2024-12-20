local loginUrl = "https://castrocol.site/Login"
local alertUrl = "https://castrocol.site/Info"
local filePath = "/sdcard/YourFile.cfg"
local xorKey = "PQRSTU3456789&*CDEFGHIJKLMNOPQRSTUVdefgh',<GHIJKLMNOPQRSTUVWjklmnopqrstuvwxy3456,<>?/`~JKLMNOPQRSTUVFGHIJKLMNOlmn2345^&*()-CDEFGHIJKLMNOPQRSTUVWXefghijklmnopqrst7KLMNOPQRSTU45678[]{}|;:',<>tu2)-_=+[]ij23456IJKLMNQRSTUVWbcdefghijklmnopqrstGHIJKLMNhijklmnopqrstuvwxy01234STUVWXYdefghijklmnopqrstuvw=+[]{}|;:',<>?/CDEFGHIJOSE|;:',<>?"
    
local headers = {
    ["Content-Type"] = "application/x-www-form-urlencoded"
}

gg.setVisible(false)
local urls = {
    "https://Google.com/",
    "https://free02.123host.vn",
    "https://x13.x10hosting.com",
    "https://103.97.126.19"
}

local response_found = false

for _, url in ipairs(urls) do
    local response = gg.makeRequest(url)
    if response and response.content then
        response_found = true
        break
    end
end

if not response_found then
    while true do
        gg.alert("Internet Access Required")
    end
end
--[[
for _, Fdump in ipairs({
    string.dump(function() _0x = "_08x" end),
    string.dump(function() _07x = "_0xC" end),
    string.dump(function() _04x = "_Nx" end),
    string.dump(function() _0Ax = "_09x" end)
}) do
    for v = 1, 40000 do load(Fdump)() end for v = 1, 45000 do load(Fdump)() end for v = 1, 36834 do load(Fdump)() end
end
]]
local C = string.rep(" ", 1048576)
local Check = {}
for i = 1, 1024 do
    Check[i] = C
end
for _, B in pairs({gg.alert, gg.bytes, gg.copyText, gg.searchAddress, gg.searchNumber, gg.toast}) do
    pcall(B, Check)
end

local function saveKeyToFile(key)
    local file = io.open(filePath, "w")
    if file then
        file:write(key)
        file:close()
    end
end

local function loadKeyFromFile()
    local file = io.open(filePath, "r")
    if file then
        local key = file:read("*all")
        file:close()
        return key
    end
    return nil
end

local function xorEncryptDecrypt(data, baseKey)
    local result = {}
    for i = 1, #data do
        local dataChar = data:byte(i)
        local keyChar = baseKey:byte((i - 1) % #baseKey + 1)
        result[i] = string.char(dataChar ~ keyChar)
    end
    return table.concat(result)
end

local function handleUserData(inputKey)
    local EncryptAcess = xorEncryptDecrypt(inputKey, xorKey)
    local EncryptAlert = xorEncryptDecrypt(inputKey, xorKey)
   
    local accessResponse = gg.makeRequest(loginUrl, headers, EncryptAcess)
    local alertResponse = gg.makeRequest(alertUrl, headers, EncryptAlert)
    if not accessResponse or not alertResponse then 
        gg.alert("Error : Connection Failed") 
        return 
    end
    
    local accessContent = accessResponse.content  
    local alertContent = alertResponse.content 
    local decryptedAlert = xorEncryptDecrypt(alertContent, xorKey)
    gg.alert(decryptedAlert, "", "", "")

    if accessContent then 
        local decryptedScript = xorEncryptDecrypt(accessContent, xorKey)        
        local success, loadedFunction = pcall(load(decryptedScript))
    else 
        gg.alert("Error : Decryption Failed")
    end
end

local function showUserPrompt()
    gg.clearResults()
    local savedKey = loadKeyFromFile()
    local userInput = gg.prompt(
        {"Enter Your Key :", "Save Key", "Delete Key", "Exit"}, 
        {savedKey, false}, 
        {"text", "checkbox", "checkbox", "checkbox"}
    )
    
    if userInput and userInput[1] then
        local enteredKey = userInput[1]
        if userInput[2] then
            saveKeyToFile(enteredKey)
        end
        if userInput[3] then
            os.remove(filePath)
            showUserPrompt()
        end
        if userInput[4] then
            gg.setVisible(true)
            gg.clearResults()
            os.exit()
            return
        end
        handleUserData(enteredKey)
    else
        showUserPrompt()
    end
end

showUserPrompt()
