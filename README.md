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
