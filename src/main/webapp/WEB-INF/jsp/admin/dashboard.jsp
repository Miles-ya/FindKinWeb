<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理后台</title>
</head>
<body>
    <h1>管理后台</h1>
    <p>欢迎, 管理员!</p>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/users">用户管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/posts">帖子管理</a></li>
    </ul>
</body>
</html>
