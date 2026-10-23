local key = getgenv().HIDE_LAT_KEY or "hl_piYJyhqq_MkRVEANodbTXwkArcsLJ5VK2"
local hwid = (gethwid and gethwid()) or "unknown"
local url = "https://loadstri.ng/l/e164610d-399f-4065-8662-02a89ff87354"
local send = request or http_request or (syn and syn.request)
if not send then error("A header-capable HTTP request function is required") end
local result = send({Url=url, Method="GET", Headers={ ["X-Hide-Key"]=key, ["X-HWID"]=hwid }})
if not result or not result.Body or (result.StatusCode and (result.StatusCode < 200 or result.StatusCode >= 300)) then error("hide.lat authorization failed: " .. tostring(result and result.StatusCode)) end
local chunk, err = loadstring(result.Body)
if not chunk then error(err) end
return chunk()
