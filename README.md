# FindKinWeb

This is a Java web application for publishing and searching for missing person information.

## Requirements

*   Java 17
*   Maven 3.x
*   Tomcat 10.x or 11.x
*   MySQL 8.x

## Database Setup

1.  Create a MySQL database named `findkinweb`.
2.  Create the `user` and `missing_person` tables using the following SQL scripts:

```sql
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'user',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `missing_person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `missing_time` datetime NOT NULL,
  `missing_location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) NOT NULL,
  `contact_visibility` int NOT NULL,
  `status` int NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `missing_person_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

```

## Configuration

1.  Open the file `src/main/java/com/example/findkinweb/util/DatabaseUtil.java`.
2.  Update the database connection details:

```java
public class DatabaseUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/findkinweb";
    private static final String USER = "your_username";
    private static final String PASSWORD = "your_password";
    // ...
}
```
Replace `your_username` and `your_password` with your MySQL username and password.

## Build and Deploy

1.  Build the project using Maven:

```bash
mvn clean install
```

2.  This will create a `FindKinWeb-1.0-SNAPSHOT.war` file in the `target` directory.
3.  Deploy the `FindKinWeb-1.0-SNAPSHOT.war` file to your Tomcat server.

## Next Steps

The next steps in the development of this project are:
1. Implement the search functionality.
2. Implement the admin backend for user and data management.
3. Implement data statistics.
4. Improve the UI.
