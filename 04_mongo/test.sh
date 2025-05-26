wrk -d 20 -t 1 -c 10 --latency -s ./get.lua http://localhost:8000
wrk -d 20 -t 5 -c 10 --latency -s ./get.lua http://localhost:8000
wrk -d 20 -t 10 -c 10 --latency -s ./get.lua http://localhost:8000
