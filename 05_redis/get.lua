local frandom = io.open("/dev/urandom", "rb")
local d = frandom:read(4)
math.randomseed(d:byte(1) + (d:byte(2) * 256) + (d:byte(3) * 65536) + (d:byte(4) * 4294967296))

number =  math.random(0,100)
request = function()
    headers = {}
    headers["Content-Type"] = "application/json"
    headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0ODI5NjI1Nn0.XWeyLWYqsOnjjE06lZSWoI9AKcxVUcHg87k9hy2V4hY"
    body = ''
    return wrk.format("GET", "/users/user".. tostring(number), headers, body)
end
