local frandom = io.open("/dev/urandom", "rb")
local d = frandom:read(4)
math.randomseed(d:byte(1) + (d:byte(2) * 256) + (d:byte(3) * 65536) + (d:byte(4) * 4294967296))

number =  math.random(0,100)
request = function()
    headers = {}
    headers["Content-Type"] = "application/json"
    headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0ODI5NDM3NX0.R6iyaQH9A5rXtOHzHZvNWIJBLblfAKY2gTch-l9bF_0"
    body = ''
    return wrk.format("GET", "/users/user".. tostring(number), headers, body)
end
