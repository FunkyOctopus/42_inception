CREATE DATABASE wordpress;
CREATE USER 'olgerret'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'olgerret'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '4242';