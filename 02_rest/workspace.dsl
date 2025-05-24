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

            db = container "Database" {
                description "In-memory хранилище"
                technology "Python List/Dict"
                tags "Database"
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


        system.userService -> system.db "Хранит данные пользователей""Python List"
        system.presentationService -> system.db "Хранит данные докладов""Python List"
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
            user -> system.presentationService "2. POST /presentations (создание)"
            system.presentationService -> system.db "3. Проверка уникальности title"
            system.presentationService -> system.db "4. Сохранение доклада"

            user -> system.presentationService "5. GET /presentations (запрос списка)"
            system.presentationService -> system.db "6. Запрос докладов"
        }

        styles {
            element "Database" {
                shape Cylinder
            }
        }

    }

}
