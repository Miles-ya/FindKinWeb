<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
    <h1>登录</h1>
    <form action="login" method="post">
        <% if (request.getAttribute("error") != null) { %>
            <p style="color:red;"><%= request.getAttribute("error") %></p>
        <% } %>
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required><br>
        <button type="submit">登录</button>
    </form>
</body>
</html>
