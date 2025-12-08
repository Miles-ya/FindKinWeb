CREATE DATABASE IF NOT EXISTS findkinweb;
USE findkinweb;

CREATE TABLE IF NOT EXISTS `user` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255),
    `email` VARCHAR(255),
    `role` VARCHAR(255) NOT NULL,
    `create_time` DATE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `missing_person` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `gender` VARCHAR(255) NOT NULL,
    `age` INT NOT NULL,
    `missing_time` DATE NOT NULL,
    `missing_location` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `photo` LONGBLOB,
    `contact_info` VARCHAR(255) NOT NULL,
    `contact_visibility` INT NOT NULL,
    `status` INT NOT NULL,
    `create_time` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
);

-- Sample Data
INSERT INTO `user` (username, password, phone, email, role, create_time) VALUES
('admin', 'admin', '1234567890', 'admin@example.com', 'admin', CURDATE()),
('user1', 'password', '1112223333', 'user1@example.com', 'user', CURDATE());

INSERT INTO `missing_person` (user_id, name, gender, age, missing_time, missing_location, description, contact_info, contact_visibility, status, create_time) VALUES
(1, '张三', '男', 30, '2023-01-15', '北京市', '最后一次见到他时穿着蓝色夹克。', '123-456-7890', 0, 0, CURDATE()),
(2, '李四', '女', 25, '2023-02-20', '上海市', '右臂有一个纹身。', '987-654-3210', 1, 0, CURDATE());
