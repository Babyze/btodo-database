CREATE DATABASE btodo;

\c btodo;

CREATE TABLE account (
    account_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email varchar(255) UNIQUE,
    is_deleted boolean,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp
);

CREATE TABLE auth (
    auth_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email varchar(255) UNIQUE NOT NULL,
    password varchar(60),
    account_id bigint REFERENCES account(account_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp
);

CREATE INDEX auth_email_idx ON auth USING HASH (email);

CREATE TABLE todo (
    todo_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    todo_name text,
    account_id bigint REFERENCES account(account_id),
    status smallint,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp
);

CREATE INDEX todo_account_id_idx ON todo (account_id, status);

CREATE TABLE task (
    task_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    task_name text,
    status smallint,
    todo_id bigint REFERENCES todo(todo_id),
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp
);

CREATE INDEX task_todo_id_idx ON task (todo_id, status)