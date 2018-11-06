PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  author_id INTEGER,
  title TEXT NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER,
  reply_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  liked INTEGER NOT NULL,
  user_id INTEGER ,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ("God", "N/A"),
  ("Navaneet", "Ramabadran"),
  ("Steven", "Le"),
  ("Kush", "Patel"),
  ("Jesus", "Christ"),
  ("Donald", "Trump");

INSERT INTO
  questions (author_id, title, body)
VALUES
  (6, "Do you believe in Roe v Wade?", "Seriously tho?"),
  (4, "What is your net worth?", "Bank Account Statement too"),
  (1, "you like pizza?", "toppings?");

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (5, 1),
  (1, 3),
  (2, 2),
  (3, 1),
  (1, 3);

INSERT INTO
  replies (body, question_id, reply_id, user_id)
VALUES
  ("probs not", 1, 2, 6),
  ("hahahaha srsly tho", 1, NULL, 1),
  ("I am rich in life", 2, NULL, 1),
  ("nah i got no monies", 2, 3, 2),
  ("LOL Y'ALL SO BROKE", 2, 4, 4),
  ("ya, pineapple", 3, NULL, 5),
  ("i disown you", 3, 6, 1);

INSERT INTO
  question_likes(liked, user_id, question_id)
VALUES
  (1, 1, 1),
  (1, 1, 2),
  (1, 1, 3),
  (1, 5, 1),
  (1, 5, 2),
  (1, 5, 3),
  (0, 6, 1),
  (0, 6, 2),
  (0, 6, 3);
