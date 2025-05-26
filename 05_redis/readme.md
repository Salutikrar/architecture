# Отчёт по лабораторной работе №5

Речинская Ангелина М8О-106СВ-24 Вариант №3

## Задание

1. Для данных, хранящихся в реляционной базе PotgreSQL реализуйте шаблон сквозное чтение и сквозная запись (Пользователь/Клиент …)

2. В качестве кеша – используйте Redis

3. Замерьте производительность запросов на чтение данных с и без кеша с использованием утилиты wrk https://github.com/wg/wrk изменяя количество потоков из которых производятся запросы (1, 5, 10)

4. Актуализируйте модель архитектуры в Structurizr DSL

5. Ваши сервисы должны запускаться через docker-compose командой docker-compose up(создайте Docker файлы для каждого сервиса)

## Выполненные задачи

### Реализованные механизмы:
Для всех операций чтения (GET /users, GET /users/{username}, GET /users/search/{name_mask}) реализована следующая логика:
  1. Проверка наличия данных в Redis
  2. Если данные есть в кеше - возврат из кеша
  3. Если данных нет - запрос к PostgreSQL и сохранение в кеш

Для операций записи (POST/PUT/DELETE) реализована инвалидация кеша:
  - При создании/изменении пользователя инвалидируются соответствующие ключи
  - При удалении пользователя также инвалидируются ключи

### Docker-конфигурация
Обновлен `docker-compose.yml`:
  ```yaml
  cache:
    image: redis:6.2-alpine
    container_name: cache
    restart: always
    ports:
      - "6379:6379"
    command: redis-server --save 20 1 --loglevel warning
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 5s
      timeout: 5s
      retries: 3
  ```



### Замеры производительности с использованием wrk

Тестировались запросы на получение данных пользователя (GET /users/user{id})
Использованы различные конфигурации нагрузки (длительность каждого теста 20 секунд):
  - 1 поток, 10 соединений
  - 5 потоков, 10 соединений
  - 10 потоков, 10 соединений

test.sh:
```bash
wrk -d 20 -t 1 -c 10 --latency -s ./get.lua http://localhost:8000
wrk -d 20 -t 5 -c 10 --latency -s ./get.lua http://localhost:8000
wrk -d 20 -t 10 -c 10 --latency -s ./get.lua http://localhost:8000
```

get.lua
```lua
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

```

Для того, чтобы запускать get.lua пришлось немного изменить файл init-db.sql, поменяв там username
Тестирование без кеша произволилось на прошлой ЛР, добавив туда эти файлы, изменив файл init-db.sql и добавив утилиту wrk

Без кеша:
```bash
# ./test.sh
Running 20s test @ http://localhost:8000
  1 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   129.86ms   35.70ms 292.61ms   79.58%
    Req/Sec    77.77     25.95   140.00     73.60%
  Latency Distribution
     50%  121.61ms
     75%  142.98ms
     90%  170.30ms
     99%  258.55ms
  1542 requests in 20.04s, 480.37KB read
Requests/sec:     76.94
Transfer/sec:     23.97KB

Running 20s test @ http://localhost:8000
  5 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   134.70ms   36.04ms 289.05ms   73.34%
    Req/Sec    15.59      5.32    30.00     55.38%
  Latency Distribution
     50%  124.79ms
     75%  153.40ms
     90%  187.86ms
     99%  244.89ms
  1484 requests in 20.05s, 470.72KB read
Requests/sec:     74.00
Transfer/sec:     23.47KB

Running 20s test @ http://localhost:8000
  10 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   130.71ms   41.08ms 313.26ms   80.36%
    Req/Sec     8.51      2.57    20.00     70.79%
  Latency Distribution
     50%  117.01ms
     75%  148.00ms
     90%  185.74ms
     99%  270.84ms
  1532 requests in 20.06s, 485.62KB read
Requests/sec:     76.37
Transfer/sec:     24.21KB
```

С использование redis:
```bash
# ./test.sh
Running 20s test @ http://localhost:8000
  1 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   141.29ms   61.25ms 524.63ms   86.85%
    Req/Sec    74.72     30.26   131.00     70.16%
  Latency Distribution
     50%  123.15ms
     75%  161.98ms
     90%  212.94ms
     99%  379.62ms
  1448 requests in 20.06s, 452.50KB read
Requests/sec:     72.20
Transfer/sec:     22.56KB

Running 20s test @ http://localhost:8000
  5 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   149.98ms   70.23ms 678.01ms   87.83%
    Req/Sec    14.88      5.95    30.00     91.09%
  Latency Distribution
     50%  129.77ms
     75%  166.01ms
     90%  231.62ms
     99%  437.35ms
  1371 requests in 20.10s, 431.67KB read
Requests/sec:     68.23
Transfer/sec:     21.48KB

Running 20s test @ http://localhost:8000
  10 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   127.92ms   46.93ms 375.96ms   82.23%
    Req/Sec     8.79      3.00    20.00     70.95%
  Latency Distribution
     50%  113.01ms
     75%  145.59ms
     90%  191.67ms
     99%  307.64ms
  1575 requests in 20.07s, 496.99KB read
Requests/sec:     78.48
Transfer/sec:     24.76KB
```

### Анализ результатов:
При использовании Redis не наблюдается значительного прироста производительности в текущей конфигурации

Возможные причины:
   - Высокая скорость работы PostgreSQL в контейнере
   - Накладные расходы на сериализацию/десериализацию данных
   - Неоптимальные тайминги кеширования

При увеличении нагрузки разница должна стать более заметной


### Обновленная архитектурная модель Structuriser DSL

![context](images/structurizr-1-context.png)

![container](images/structurizr-1-container.png)

![dynamic](images/structurizr-1-dynamic.png)
