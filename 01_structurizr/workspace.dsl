workspace {
    name "Сайт конференции"
    model {

        !identifiers hierarchical

        organizer = person "Организатор конференции"
        speaker = person "Спикер"
        system = softwareSystem "TED Talks pro" {
            description "Система поиска докладов для конференции"

            userWeb = container "Веб приложение клиента" {
                description "Приложение для осуществления работы с сервисом"
                technology "Web Browser"
            }

            backend = container "Backend веб приложение клиента" {
                description "Приложение для осуществления работы с сервисом"
                technology "C++"
            }

            userService = container "Сервис пользователей" {
                description "Реализует управление пользователями"
                technology "C++"
            }

            reportService = container "Сервис докладов" {
                description "Реализует управление докладами"
                technology "C++"
            }

            group "Слой хранения" {
                user_db = container "База данных пользователей" {
                    description "Хранит данные о пользователях"
                    technology "PostgreSQL"
                    tags "Database"
                }

                report_db = container "База данных докладов" {
                    description "Хранит данные о докладах"
                    technology "PostgreSQL"
                    tags "Database"
                }
            }
        }

        notifications = softwareSystem "Система уведомлений" {
            description "Уведомляет спикера о выборе его доклада"
            tags "ExternalSystem"
        }

        organizer -> system "Выбирает доклады для конференции"
        speaker -> system "Публикует доклады"
        system -> notifications "Передает информацию о выбранном докладе"


        organizer -> system.userWeb "Управление услугой"
        speaker -> system.userWeb "Управление услугой"
        system.userWeb -> system.backend "Получение данных, выполнение запросов" "WebSocket"
        system.backend -> system.userService "Запросы данных о пользователях" "REST/HTTP :80"
        system.backend -> system.reportService "Запросы данных о докладах" "REST/HTTP :80"
        system.userService -> system.user_db "Создание нового пользователя" "REST/HTTP :80"
        system.userService -> system.user_db "Поиск пользователя по логину" "REST/HTTP :80"
        system.reportService -> system.report_db "Создание доклада" "REST/HTTP :80"
        system.reportService -> system.report_db "Получение списка всех докладов" "REST/HTTP :80"
        system.reportService -> system.report_db "Добавление доклада в конференцию" "REST/HTTP :80"
        system.reportService -> system.report_db "Получение списка докладов в конференции" "REST/HTTP :80"
        system.userService -> notifications "Передает информацию о добавлении доклада в конфференцию" "REST/HTTP :80"

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

            organizer -> system.userWeb "добавляет доклад в конференцию"
            system.userWeb -> system.backend "запрос на добавление доклада в конференцию"
            system.backend -> system.userService "проверить, что пользователь существует"
            system.userService -> system.user_db "получение информации о пользователе"
            system.backend -> system.reportService "запрос на добавление доклада в конференцию"
            system.reportService -> system.report_db "проверить, что доклад существует"
            system.reportService -> system.report_db "добавить доклад в конференцию организатора"
            system.userService -> notifications "отправить уведомление спикеру о добавлении его доклада в конференцию"
        }

        styles {
            element "ExternalSystem" {
                background #c0c0c0
                color #ffffff
            }
            element "Database" {
                shape Cylinder
            }
        }

    }

}
