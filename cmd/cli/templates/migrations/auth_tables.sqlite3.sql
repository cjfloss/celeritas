CREATE TABLE users (
    id integer not null primary key autoincrement,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    user_active integer NOT NULL DEFAULT 0,
    email character varying(255) NOT NULL UNIQUE,
    password character varying(60) NOT NULL,
    created_at datetime NOT NULL DEFAULT (DATETIME('now')),
    updated_at datetime NOT NULL DEFAULT (DATETIME('now'))
);

CREATE TABLE remember_tokens (
    id integer not null primary key autoincrement,
    user_id integer NOT NULL REFERENCES users(id) ON DELETE SET NULL ON UPDATE CASCADE,
    remember_token character varying(100) NOT NULL,
    created_at datetime NOT NULL DEFAULT (DATETIME('now')),
    updated_at datetime NOT NULL DEFAULT (DATETIME('now'))
);

CREATE TABLE tokens (
    id integer not null primary key autoincrement,
    user_id integer NOT NULL REFERENCES users(id) ON DELETE SET NULL ON UPDATE CASCADE,
    first_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL UNIQUE,
    token_hash bytea NOT NULL,
    created_at datetime NOT NULL DEFAULT (DATETIME('now')),
    updated_at datetime NOT NULL DEFAULT (DATETIME('now')),
    expiry datetime NOT NULL,
    token character varying(255) NOT NULL
);
