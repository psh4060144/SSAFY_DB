-- 공통
SELECT * FROM articles;
SELECT * FROM users;
DROP TABLE articles;
DROP TABLE users;
PRAGMA table_info('articles');


-- 실습용 데이터
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE articles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(50) NOT NULL,
  content VARCHAR(100) NOT NULL,
  userId INTEGER NOT NULL,
  FOREIGN KEY (userId) 
    REFERENCES users(id)
);

INSERT INTO 
  users (name)
VALUES 
  ('하석주'),
  ('송윤미'),
  ('유하선');

INSERT INTO
  articles (title, content, userId)
VALUES 
  ('제목1', '내용1', 1),
  ('제목2', '내용2', 2),
  ('제목3', '내용3', 1),
  ('제목4', '내용4', 4),
  ('제목5', '내용5', 1);


-- INNER JOIN

-- 기본 형태
-- SELECT
--   select_list
-- FROM
--   table_a
-- INNER JOIN
--   table_b
-- ON
--   table_b.fk = table_a.pk

-- phase 1. 조건에 만족하는 모든 필드 조회
SELECT
  *
FROM
  articles
INNER JOIN
  users
ON
  users.id = articles.userId;

-- phase 2. 최종 출력 필드에 맞게 title 과 name 만 조회.
SELECT
  articles.title, users.name
  -- 그냥 title, name 해도 되긴 하는데, 명시적이지 않아서 비추천.
FROM
  articles
INNER JOIN
  users
ON
  users.id = articles.userId;

-- phase 3. 1번 작성자가 작성한 게시글만 조회
SELECT
  articles.title, users.name
FROM
  articles
INNER JOIN
  users
ON
  users.id = articles.userId
WHERE
  users.id = 1;


-- LEFT JOIN

-- 기본 형태
-- SELECT
--   select_list
-- FROM
--   table_a
-- LEFT JOIN
--   table_b
-- ON
--   table_b.fk = table_a.pk

-- phase 1. 모든 유저의 정보를 출력하면서 이 유저들이 작성한 게시글 정보도 같이 출력.
SELECT
  *
FROM
  users
LEFT JOIN
  articles
ON
  articles.userId = users.id;

-- phase 2. phase 1 에서 article 정보가 null 인 사용자를 출력.
SELECT
  *
FROM
  users
LEFT JOIN
  articles
ON
  articles.userId = users.id
where articles.userId IS NULL;

-- phase 3. phase 2 에서 사용자 이름만 출력.
SELECT
  users.name
FROM
  users
LEFT JOIN
  articles
ON
  articles.userId = users.id
where articles.userId IS NULL;