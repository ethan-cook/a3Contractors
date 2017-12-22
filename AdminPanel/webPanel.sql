CREATE TABLE logins
(
	`id` INT NOT NULL PRIMARY KEY auto_increment PRIMARY KEY,
	`username` VARCHAR(50) NOT NULL UNIQUE,
    `email` VARCHAR (60) NOT NULL UNIQUE,
	`password` VARCHAR(255) NOT NULL,
	`created` DATETIME DEFAULT current_timestamp
);