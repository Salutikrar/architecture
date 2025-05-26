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

            presentationService = container "Presentation Service" {
                description "Сервис управления докладами"
                technology "FastAPI, Python"

                presentationController = component "PresentationController" {
                    description "Управление докладами (CRUD операции)"
                }
            }

            // conference = container "Сервис конференции"{
            //     description "Сервис управления конференциями"
            //     technology "FastAPI, Python"
            // }

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
            // db = container "Database" {
            //     description "База данных"
            //     technology "PostgreSQL"
            //     tags "Database"
            //     user_db = component "База данных пользователей" "Хранит данные пользователей"
            //     report_db = component "База данных докладов" "Хранит данные докладов"
            //     conference_db = component "База данных конференций" "Хранит данные конференции"
            // }
        }
        user -> system "Управляет конференциями и докладами"
        user -> system.userService "Работает с пользователями" "REST/HTTP :8000, JWT"
        user -> system.presentationService "Управляет докладами" "REST/HTTP :8001, JWT"


        system.userService -> system.db "Хранит данные пользователей""SQL request"
        system.userService -> system.redis "Кэширует данные пользователей" "redis request"
        system.presentationService -> system.mongo_db "Хранит данные докладов""mongo request"
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
            system.userService -> system.redis "2. Запрос пользователя"
            system.userService -> system.db "3. Запрос пользователя"
            user -> system.presentationService "4. POST /presentations (создание)"
            system.presentationService -> system.mongo_db "5. Проверка уникальности title"
            system.presentationService -> system.mongo_db "6. Сохранение доклада"

            user -> system.presentationService "7. GET /presentations (запрос списка)"
            system.presentationService -> system.mongo_db "8. Запрос докладов"
        }

        styles {
            element "Database" {
                shape Cylinder
            }
        }

    }

}
