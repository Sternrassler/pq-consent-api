CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);

CREATE TABLE sessions (
    session_id serial PRIMARY KEY,
    user_id INTEGER NOT NULL,
    session_key VARCHAR ( 50 ) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_used TIMESTAMP NOT NULL
);

CREATE TABLE posts (
    post_id serial PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR ( 255 ) NOT NULL,
    body TEXT NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_updated TIMESTAMP NOT NULL
);

CREATE TABLE comments (
    comment_id serial PRIMARY KEY,
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_updated TIMESTAMP NOT NULL
);

CREATE TABLE tags (
    tag_id serial PRIMARY KEY,
    name VARCHAR ( 50 ) UNIQUE NOT NULL
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL
);

CREATE TABLE comment_tags (
    comment_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL
);

CREATE TABLE likes (
    like_id serial PRIMARY KEY,
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    created_on TIMESTAMP NOT NULL
);

CREATE TABLE follows (
    follow_id serial PRIMARY KEY,
    user_id INTEGER NOT NULL,
    follower_id INTEGER NOT NULL,
    created_on TIMESTAMP NOT NULL
);

CREATE TABLE notifications (
    notification_id serial PRIMARY KEY,
    user_id INTEGER NOT NULL,
    type VARCHAR ( 50 ) NOT NULL,
    post_id INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    created_on TIMESTAMP NOT NULL,
    seen BOOLEAN NOT NULL
);

CREATE TABLE messages (
    message_id serial PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    created_on TIMESTAMP NOT NULL,
    seen BOOLEAN NOT NULL
);

CREATE TABLE message_tags (
    message_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL
);

CREATE TABLE message_likes (
    like_id serial PRIMARY KEY,
    user_id INTEGER NOT NULL,
    message_id INTEGER NOT NULL,
    created_on TIMESTAMP NOT NULL
);

CREATE TABLE message_replies (
    reply_id serial PRIMARY KEY,
    user_id INTEGER NOT NULL,
    message_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    created_on TIMESTAMP NOT NULL,
    seen BOOLEAN NOT NULL
);

CREATE TABLE message_reply_tags (
    reply_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL
);

CREATE TABLE message_reply_likes (
    like_id serial PRIMARY KEY,
    user_id INTEGER NOT NULL,
    reply_id INTEGER NOT NULL,
    created_on TIMESTAMP NOT NULL
);
