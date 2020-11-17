CREATE DATABASE IF NOT EXISTS `elbook`;
CREATE USER IF NOT EXISTS 'elbook'@'%' IDENTIFIED BY 'elbook';
GRANT ALL ON `elbook`.* TO 'elbook'@'%';
FLUSH PRIVILEGES;