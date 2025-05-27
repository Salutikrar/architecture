workspace {
    name "Сайт конференции"
    description "Система управления пользователями и докладами конференций"
    model {

        !identifiers hierarchical

        user = person "User" "Пользователь системы"
        system = softwareSystem "TED Talks pro" {
            description "Система управления конференциями и докладами"

            userService = container "User Service" {
                description "Сервис управления пользователями и аутентификацией"
                technology "FastAPI, Python"

                authController = component "AuthController" {
                    description "Обрабатывает аутентификацию (POST /token)"
                }

                userController = component "UserController" {
                    description "Управление пользователями (CRUD операции)"
                }
            }

            presentationProducer = container "Presentation Producer" {
                description "Сервис управления докладами"
                technology "Kafka, FastAPI, Python"
            }

            presentationConsumer = container "Presentation Consumer" {
                description "Сервис обработки событий о докладах"
                technology "Kafka, Python"
            }

            db = container "SQL Database" {
                description "База данных"
                technology "PostgreSQL"
                tags "Database"
                user_db = component "База данных пользователей" "Хранит данные пользователей"
            }

            mongo_db = container "Mongo Database" {
                description "База данных"
                technology "mongo"
                tags "Database"
                report_db = component "База данных докладов" "Хранит данные докладов"
            }

            redis = container "Redis Cache" {
                description "Кэш для хранения часто запрашиваемых данных"
                technology "Redis"
                tags "Database"
                user_db = component "База данных пользователей" "Хранит данные пользователей"
            }

            kafka = container "Apache Kafka" {
                description "Брокер сообщений для событий"
                technology "Kafka"
                tags "Broker"
            }
        }
        user -> system "Управляет конференциями и докладами"
        user -> system.userService "Работает с пользователями" "REST/HTTP :8000, JWT"
        user -> system.presentationProducer "Управляет докладами" "REST/HTTP :8001, JWT"


        system.userService -> system.db "Хранит данные пользователей""SQL request"
        system.userService -> system.redis "Кэширует данные пользователей" "redis request"
        system.presentationProducer -> system.kafka "Отправляет события" "Kafka"
        system.kafka -> system.presentationConsumer "Доставляет события" "Kafka"
        system.presentationConsumer -> system.mongo_db "Изменяет БД" "MongoDB"
        system.presentationProducer -> system.mongo_db "Запросы к БД" "MongoDB request"
    }

    views {
        themes default
        properties {
            structurizr.tooltips true
        }

        systemContext system "context" {
            include *
            autoLayout
        }

        container system "container" {
            include *
            autoLayout
        }

        dynamic system "dynamic" {
            autoLayout lr
            description "Добавление доклада в конференцию"

            user -> system.userService "1. POST /token (аутентификация)"
            system.userService -> system.redis "2. Проверка пользователя на наличие в кэше"
            system.userService -> system.db "3. Запрос пользователя"
            user -> system.presentationProducer "4. POST /presentations (создание)"
            system.presentationProducer -> system.kafka "5. Отправка события создания"
            system.kafka -> system.presentationConsumer "6. Получение события"
            system.presentationConsumer -> system.mongo_db "7. Сохранение доклада"

            user -> system.presentationProducer "8. GET /presentations (запрос списка)"
            system.presentationProducer -> system.mongo_db "9. Запрос докладов"
        }

        styles {
            element "Database" {
                shape Cylinder
            }
            element "Broker" {
                shape Pipe
            }
        }

    }

}
