<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.findkinweb.entity.User" %>
<html>
<head>
    <title>编辑用户</title>
</head>
<body>
    <h1>编辑用户</h1>
    <% User user = (User) request.getAttribute("user"); %>
    <form action="${pageContext.request.contextPath}/admin/user/edit" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required><br>

        <label for="phone">电话:</label>
        <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>"><br>

        <label for="email">电子邮件:</label>
        <input type="email" id="email" name="email" value="<%= user.getEmail() %>"><br>

        <label for="role">角色:</label>
        <select id="role" name="role" required>
            <option value="user" <%= "user".equals(user.getRole()) ? "selected" : "" %>>用户</option>
            <option value="admin" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>管理员</option>
        </select><br>

        <button type="submit">更新</button>
    </form>
</body>
</html>
