-- 1.
CREATE TABLE `hackerhero_practice`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `encrypted_password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`));

-- 2.
INSERT INTO users (first_name, last_name, email, encrypted_password, created_at, updated_at) VALUES ('Michael', 'Jordan', 'mj@gmail.com', 'password1', NOW(), NOW());

INSERT INTO users (first_name, last_name, email, encrypted_password, created_at, updated_at) VALUES ('Stephen', 'Curry', 'curry@gmail.com', 'password2', NOW(), NOW());

INSERT INTO users (first_name, last_name, email, encrypted_password, created_at, updated_at) VALUES ('Lebron', 'James', 'lebron@gmail.com', 'password3', NOW(), NOW());

-- 3.
UPDATE users set email = 'goat@gmail.com' WHERE id = 1;

-- 4.
UPDATE users set name = 'Michael' WHERE last_name = 'Choi';

-- 5.
UPDATE users set name = 'Bryan' WHERE id IN(3, 5, 7, 12, 19);

-- 6.
DELETE FROM users WHERE id = 1;

-- 7.
DELETE FROM users;

-- 8.
-- Dropping the table means removing the entire table, including all records associated with that table, while deleting all records means removing only the data within the table, leaving the table structure intact.
DROP TABLE users;

-- 9.
ALTER TABLE users RENAME COLUMN email TO email_address;

-- 10.
ALTER TABLE users MODIFY COLUMN id BIGINT;

-- 11.
ALTER TABLE users ADD COLUMN is_active TINYINT(1) NOT NULL DEFAULT 0;
