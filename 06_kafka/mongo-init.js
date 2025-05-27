
db = db.getSiblingDB('conference_db');

db.createCollection('presentations');


db.presentations.createIndex({ "title": 1 }, { unique: true });


db.presentations.insertMany([
  {
    "title": "Искусственный интеллект в 2023",
    "description": "Современные тенденции ИИ",
    "speaker": "Иван Петров"
  },
  {
    "title": "Микросервисная архитектура",
    "description": "Лучшие практики разработки",
    "speaker": "Алексей Сидоров"
  },
  {
    "title": "Введение в Kubernetes",
    "description": "Основы оркестрации контейнеров",
    "speaker": "Мария Иванова"
  },
  {
    "title": "DevOps практики",
    "description": "CI/CD и автоматизация",
    "speaker": "Дмитрий Смирнов"
  },
  {
    "title": "Безопасность веб-приложений",
    "description": "Основные уязвимости и защита",
    "speaker": "Анна Кузнецова"
  },
  {
    "title": "React vs Angular",
    "description": "Сравнение фронтенд-фреймворков",
    "speaker": "Сергей Попов"
  },
  {
    "title": "Big Data аналитика",
    "description": "Обработка больших данных",
    "speaker": "Ольга Васильева"
  },
  {
    "title": "Blockchain технологии",
    "description": "Принципы работы блокчейна",
    "speaker": "Андрей Новиков"
  },
  {
    "title": "Квантовые вычисления",
    "description": "Будущее компьютерных технологий",
    "speaker": "Елена Морозова"
  },
  {
    "title": "Программирование на Go",
    "description": "Основы языка Golang",
    "speaker": "Павел Волков"
  },
  {
    "title": "Машинное обучение на Python",
    "description": "Практическое введение в ML",
    "speaker": "Наталья Белова"
  },
  {
    "title": "Разработка мобильных приложений",
    "description": "Flutter vs React Native",
    "speaker": "Артем Козлов"
  },
  {
    "title": "Тестирование ПО",
    "description": "Unit, интеграционные и E2E тесты",
    "speaker": "Виктория Лебедева"
  },
  {
    "title": "Архитектура облачных решений",
    "description": "AWS, Azure и Google Cloud",
    "speaker": "Игорь Соколов"
  },
  {
    "title": "NoSQL базы данных",
    "description": "MongoDB, Cassandra, Redis",
    "speaker": "Юлия Воробьева"
  },
  {
    "title": "Автоматизация тестирования",
    "description": "Selenium и Cypress",
    "speaker": "Кирилл Павлов"
  },
  {
    "title": "Веб-сокеты и реальное время",
    "description": "Socket.io и аналоги",
    "speaker": "Алина Семенова"
  },
  {
    "title": "Оптимизация SQL запросов",
    "description": "Индексы и EXPLAIN",
    "speaker": "Роман Федоров"
  },
  {
    "title": "Функциональное программирование",
    "description": "Основные принципы",
    "speaker": "Дарья Никитина"
  },
  {
    "title": "Разработка API",
    "description": "REST, GraphQL и gRPC",
    "speaker": "Александр Медведев"
  },
  {
    "title": "Управление IT-проектами",
    "description": "Agile и Scrum методологии",
    "speaker": "Екатерина Романова"
  }
]);
