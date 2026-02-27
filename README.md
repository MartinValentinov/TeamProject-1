# Scalable Quiz Platform

Уеб платформа за интерактивни викторини по **Математика**, **Физика** и **Информатика**, изградена чрез **микросървисна архитектура**, контейнеризация с Docker и оркестрация чрез Kubernetes.

## Описание на проекта

Проектът представлява мащабируема онлайн система за провеждане на тестове, в която потребителите могат да:

* Създават профили и да влизат в системата
* Решават викторини по различни предмети
* Получават автоматично оценяване (точки и проценти)
* Следят история на резултатите си

Архитектурата е разделена на независими микросървиси, които комуникират чрез REST API.

---

## Цел на проекта

Да мотивира хората да упражняват знанията си чрез интерактивно решаване на задачи, като развиват:

* логическо мислене
* разбиране на физични закони
* алгоритмична култура
* подготовка по STEM дисциплини

---

## Архитектура

Системата използва **Microservices Architecture**, като всеки сървис има собствена отговорност и база данни.

### Основни услуги:

| Service            | Отговорност                           |
| ------------------ | ------------------------------------- |
| **user-service**   | Регистрация, вход, JWT автентикация   |
| **quiz-service**   | Управление на въпроси и отговори      |
| **result-service** | Изчисляване и съхранение на резултати |

 Комуникацията между услугите се осъществява чрез **HTTP REST + JSON**.

---

## Контейнеризация и Оркестрация

* Всеки микросървис е Docker контейнер
* Kubernetes управлява:

  * Deployments
  * Services
  * Scaling
  * Recovery при срив
* NGINX Ingress служи като API Gateway

---

##  Използвани технологии

### Frontend

* HTML
* PicoCSS
* JavaScript

### Backend

* Python
* Flask
* SQLAlchemy

### Database

* PostgreSQL
* CloudNativePG (CNPG)

### DevOps / Infrastructure

* Docker
* Kubernetes
* Minikube
* Helm
* NGINX Ingress

### Version Control

* Git

### Project management

* GitHub

---

##  Бази данни

Проектът използва **3 отделни бази данни** (Database-per-Service pattern):

| Database    | Service        | Предназначение     |
| ----------- | -------------- | ------------------ |
| `user_db`   | user-service   | Потребители        |
| `quiz_db`   | quiz-service   | Въпроси и отговори |
| `result_db` | result-service | Резултати          |

За по-детайлна информация, виж `./docs` папката

---

##  Сигурност

* Паролите **не се съхраняват в plaintext**
* Използва се hashing чрез Flask security utilities
* JWT токени за stateless authentication
* Изолирана user база данни за повишена сигурност

---
<!--
##  Причини за използване на микросървиси

✔ Независимо мащабиране на услугите
✔ По-висока надеждност при срив
✔ Лесни обновявания (independent deployment)
✔ Разделяне на отговорностите в екипа
✔ По-добра сигурност чрез изолация
✔ Подходящо за cloud-native среда
---
-->

##  Kubernetes ресурси

* Deployment – управлява Pod-овете
* Service – вътрешна комуникация
* Ingress – външен достъп
* Secrets – защита на чувствителни данни
* Persistent Volumes – съхранение на данните
* CNPG Cluster – управление на PostgreSQL

---

##  Данни за въпросите

Към момента има **179** въпроса.

| Предмет     | Брой |
| ----------- | ---- |
| Математика  | 89   |
| Физика      | 63   |
| Информатика | 27   |

---

##  Екип

| Име                 | Отговорност             |
| ------------------- | ----------------------- |
| Мартин Валентинов   | Архитектура, Kubernetes |
| Александър Найденов | Backend, Flask, Users   |
| Йордан Цонев        | PostgreSQL, Данни       |
| Мартин Филипов      | Frontend                |

---

##  Стартиране на проекта (примерно)
---

##  Бъдещи подобрения

* Добавяне на leaderboard система
* Времево ограничени тестове
* Админ панел за управление на въпроси
* OAuth2 вход (Google / Microsoft)
* CI/CD pipeline
* Мониторинг с Prometheus + Grafana

---

##  Лиценз

Този проект е разработен с образователна цел към
**Технологично училище „Електронни системи“ към ТУ-София (2026).**

---

<!--
# Council Of Ministers

## Project Overview

### quiz-platform
```
- api-gateway/
- user-service/
- quiz-service/
- result-service/
- k8s/
- docker-compose.yml
- .env
- README.md
- .gitignore
```

### api-gateway
```
- nginx.conf
- Dockerfile
```

### Internal Architecture
```
controllers -> services -> domain -> repositories -> PostgreSQL
```

### k8s
```
- user-service.yaml
- quiz-serice.yaml
- result-service.yaml
- api-gateway.yaml
- postgres.yaml
- ingress.yaml
```
---
## user-service

### Folders
```
- app.py
- requirments.txt
- Dockerfile
- config/
    -> config.py
    -> jwt_config.py
- controllers/
    -> auth_controller.py
- services/
    -> auth_service.py
- domain/
    -> user.py
- repository/
    -> user_repository.py
- db/
    -> user_db.py
- tests/
```

### Responsibilities
```
- Register
- Login
- Password Hashing
- JWT issuing
```

### API
```
POST /api/v1/auth/register
POST /api/v1/auth/login
GET /api/v1/auth/me
```

### DB requirments
```
users(id, username, email, hashed_password)
```

---

## quiz-service

### Folders
```
- app.py
- requirments.txt
- Dockerfile
- controllers/
    -> quiz_controller.py
- services/
    -> quiz_service.py
- domain/
    -> question.py
- repository/
    -> question_repository.py
- db/
    -> quiz_db.py
- tests/
```

### Responsibilities
```
- Store quizzes
- Survey quizzes
- Validate asnswers
```

### API
```
GET /api/v1/quizzes/math
GET /api/v1/quizzes/physics
GET /api/v1/quizzes/IT
POST /api/v1/quizzes/submit
```

### DB requirments
```
questions(id, subject, condition, option_a, option_b, option_c, option_d, correct)
```

---

## result-service

### Folders
```
- app.py
- requirments.txt
- Dockerfile
- controllers/
    -> result_controller.py
- services/
    -> result_service.py
- domain/
    -> result.py
- repository/
    -> result_repository.py
- db/
    -> result_db.py
- tests/
```

### Responsibilities
```
- Calculate scors
- Save attempt
- Statistics
```

### API
```
POST /api/v1/results
GET /api/v1/results/{user_id}
```

### DB requirments
```
result(id, user_id, score, timestamp)
```
-->