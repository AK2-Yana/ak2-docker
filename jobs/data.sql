CREATE TABLE users (
    user_id VARCHAR(128) PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    enabled CHAR(1) CHECK (ENABLED IN ('Y','N') ) NOT NULL
);
CREATE TABLE authorities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(128) NOT NULL
);
CREATE TABLE user_roles (
    user_id VARCHAR(128),
    role_id Int,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (role_id) REFERENCES authorities(id)
);

INSERT INTO authorities (name) values ('ADMIN'), ('BASIC');
INSERT INTO users (user_id, password, enabled) VALUES('akito', '$2a$16$vd2hWbMqai3SLPH7NBn7texieaWtri7oKFV9UWjEiS/f8eeI535iG', 'Y');
INSERT INTO user_roles (user_id, role_id) VALUES('akito',1),('akito',2);