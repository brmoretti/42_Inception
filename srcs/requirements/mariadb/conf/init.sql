CREATE DATABASE IF NOT EXISTS wordpress;
USE wordpress;
CREATE USER IF NOT EXISTS 'user_wordpress'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;
