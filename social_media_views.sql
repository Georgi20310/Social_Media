CREATE VIEW posts_with_user_info AS
SELECT p.post_id, p.content, p.created_at AS post_created_at, 
       u.user_id, u.username, u.email, u.created_at AS user_created_at
FROM posts p
JOIN users u ON p.user_id = u.user_id;

CREATE VIEW comments_with_post_and_user_info AS
SELECT c.comment_id, c.content AS comment_content, c.created_at AS comment_created_at, 
       p.post_id, p.content AS post_content, p.created_at AS post_created_at,
       u.user_id, u.username, u.email, u.created_at AS user_created_at
FROM comments c
JOIN posts p ON c.post_id = p.post_id
JOIN users u ON c.user_id = u.user_id;

CREATE VIEW follows_with_user_info AS
SELECT f.follow_id, f.created_at AS follow_created_at,
       follower.user_id AS follower_id, follower.username AS follower_username, follower.email AS follower_email, follower.created_at AS follower_created_at,
       followed.user_id AS followed_id, followed.username AS followed_username, followed.email AS followed_email, followed.created_at AS followed_created_at
FROM follows f
JOIN users follower ON f.follower_id = follower.user_id
JOIN users followed ON f.followed_id = followed.user_id;

