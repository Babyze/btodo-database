# bTodo - Database

This repository is a part of [bTodo Micsroservice Application](https://github.com/Babyze/btodo-main)

---

## Configure database

Edit .database.env.example then rename it to .database.env

```env
POSTGRES_USER=admin
POSTGRES_PASSWORD=admin
DB_ACCOUNT_USERNAME=service
DB_ACCOUNT_PASSWORD=service
```

## Run

```bash
docker compose up -d
```

---

## Notes

ALWAYS setting format file of initial bash file (sql/02-create-user-access.sh) is LF (if not, error will occur)
