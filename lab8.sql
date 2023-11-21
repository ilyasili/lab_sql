Створення таблиці "Users"
CREATE TABLE Users 
  (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
  );

Вставка даних в таблицю "Users"
INSERT INTO Users (user_id, username, email) VALUES
  (1, 'User1', 'user1@example.com'),
  (2, 'User2', 'user2@example.com'),
  (3, 'User3', 'user3@example.com');

Створення таблиці "Projects"
CREATE TABLE Projects 
  (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL
  );

Вставка даних в таблицю "Projects"
INSERT INTO Projects (project_id, project_name) VALUES
  (1, 'ProjectA'),
  (2, 'ProjectB');

Створення таблиці "Tasks"
CREATE TABLE Tasks 
  (
    task_id INT PRIMARY KEY,
    task_name VARCHAR(255) NOT NULL,
    author_id INT,
    project_id INT,
    FOREIGN KEY (author_id) REFERENCES Users(user_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
  );

Вставка даних в таблицю "Tasks"
INSERT INTO Tasks (task_id, task_name, author_id, project_id) VALUES
  (1, 'Task1', 1, 1),
  (2, 'Task2', 2, 1),
  (3, 'Task3', 1, 2);

Створення таблиці "TaskAssignees"
CREATE TABLE TaskAssignees 
  (
    assignment_id INT PRIMARY KEY,
    task_id INT,
    user_id INT,
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
  );

Вставка даних в таблицю "TaskAssignees"
INSERT INTO TaskAssignees (assignment_id, task_id, user_id) VALUES
  (1, 1, 2),
  (2, 1, 3),
  (3, 2, 1),
  (4, 3, 2),
  (5, 3, 3);

Створення таблиці "Files"
CREATE TABLE Files 
  (
    file_id INT PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    file_url VARCHAR(255) NOT NULL,
    project_id INT,
    task_id INT,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id)
  );

-- Вставка даних в таблицю "Files"
INSERT INTO Files (file_id, file_name, file_url, project_id, task_id) VALUES
  (1, 'File1', 'https://example.com/file1', 1, NULL),
  (2, 'File2', 'https://example.com/file2', NULL, 1),
  (3, 'File3', 'https://example.com/file3', 2, NULL);
