create schema social_media;

CREATE TABLE users (
    user_id int auto_increment not null PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    post_id int auto_increment not null PRIMARY KEY,
    user_id INT,
    foreign key(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments (
    comment_id int auto_increment not null PRIMARY KEY,
    post_id INT,
    foreign key(post_id) references posts(post_id) on delete cascade,
    user_id INT,
    foreign key(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE likes (
    like_id int auto_increment not null PRIMARY KEY,
    post_id int,
    foreign key(post_id) references posts(post_id) on delete cascade,
    user_id INT,
    foreign key(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE follows (
    follow_id int auto_increment not null PRIMARY KEY,
    follower_id INT,
    foreign key(follower_id) REFERENCES users(user_id) ON DELETE CASCADE,
    followed_id INT,
    foreign key(followed_id) REFERENCES users(user_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(follower_id, followed_id)
);
