INSERT INTO roles (role_name) VALUES
('db_admin'),        -- Привилегии на ниво база данни
('table_admin'),     -- Привилегии на ниво таблица
('column_admin');    -- Привилегии на ниво колона

INSERT INTO users (username, email, password) VALUES
('admin_user', 'admin@example.com', 'admin_pass'),
('table_user', 'table@example.com', 'table_pass'),
('column_user', 'column@example.com', 'column_pass');

INSERT INTO user_roles (user_id, role_id) VALUES
((SELECT user_id FROM users WHERE username = 'admin_user'), (SELECT role_id FROM roles WHERE role_name = 'db_admin')),
((SELECT user_id FROM users WHERE username = 'table_user'), (SELECT role_id FROM roles WHERE role_name = 'table_admin')),
((SELECT user_id FROM users WHERE username = 'column_user'), (SELECT role_id FROM roles WHERE role_name = 'column_admin'));


GRANT ALL PRIVILEGES ON social_media.* TO 'admin_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON social_media.posts TO 'table_user'@'localhost';
GRANT SELECT (username, email) ON social_media.users TO 'column_user'@'localhost';

FLUSH PRIVILEGES;