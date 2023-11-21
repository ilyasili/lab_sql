CREATE TABLE Categories 
  (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
  );

CREATE TABLE News 
  (
    news_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    category_id INT,
    publication_date DATE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
  );

CREATE TABLE Comments 
  (
    comment_id INT PRIMARY KEY,
    news_id INT,
    commenter_name VARCHAR(255) NOT NULL,
    comment_text TEXT NOT NULL,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (news_id) REFERENCES News(news_id)
  );

CREATE TABLE Ratings 
  (
    rating_id INT PRIMARY KEY,
    news_id INT,
    ip_address VARCHAR(15) NOT NULL,
    rating_value INT CHECK (rating_value >= 1 AND rating_value <= 10),
    UNIQUE (news_id, ip_address),  
    FOREIGN KEY (news_id) REFERENCES News(news_id)
  );
