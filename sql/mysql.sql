CREATE TABLE IF NOT EXISTS member (
    id           INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS entries(
  id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  body VARCHAR(255),
  created_at TIMESTAMP
)CHARSET=utf8;
