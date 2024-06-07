CREATE INDEX idx_users_email ON Users(email);

CREATE INDEX idx_posts_user_date ON Posts(user_id, created_at);

CREATE INDEX idx_comments_content_prefix ON Comments((LEFT(content, 10)));

CREATE INDEX idx_users_username_prefix ON Users((LEFT(username, 5)));

CREATE INDEX idx_profiles_user_id ON Profiles(user_id);

CREATE INDEX idx_friends_user_date ON Friends(user_id1, friendship_date);

CREATE INDEX idx_posts_content_prefix ON Posts((LEFT(content, 15)));

CREATE INDEX idx_posts_user_content ON Posts(user_id, content);

CREATE INDEX idx_comments_post_id ON Comments(post_id);

CREATE INDEX idx_users_email_created ON Users(email, created_at);
