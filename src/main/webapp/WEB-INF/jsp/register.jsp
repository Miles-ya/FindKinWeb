<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
    <h1>注册</h1>
    <form action="register" method="post">
        <% if (request.getAttribute("error") != null) { %>
            <p style="color:red;"><%= request.getAttribute("error") %></p>
        <% } %>
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required><br>
        <label for="phone">电话:</label>
        <input type="text" id="phone" name="phone"><br>
        <label for="email">电子邮件:</label>
        <input type="email" id="email" name="email"><br>
        <button type="submit">注册</button>
    </form>
</body>
</html>
