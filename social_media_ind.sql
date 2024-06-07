CREATE INDEX idx_users_email ON users(email);

CREATE INDEX idx_posts_user_date ON posts(user_id, created_at);

CREATE INDEX idx_comments_content_prefix ON comments((LEFT(content, 10)));

CREATE INDEX idx_users_username_prefix ON users((LEFT(username, 5)));

CREATE INDEX idx_posts_content_prefix ON posts((LEFT(content, 15)));

CREATE INDEX idx_posts_user_content ON posts(user_id, content);

CREATE INDEX idx_comments_post_id ON comments(post_id);

CREATE INDEX idx_users_email_created ON users(email, created_at);
