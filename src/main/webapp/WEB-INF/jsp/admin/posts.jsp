<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.findkinweb.entity.MissingPerson" %>
<html>
<head>
    <title>帖子管理</title>
</head>
<body>
    <h1>帖子管理</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>失踪地点</th>
                <th>失踪时间</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<MissingPerson> posts = (List<MissingPerson>) request.getAttribute("posts");
                for (MissingPerson post : posts) {
            %>
            <tr>
                <td><%= post.getId() %></td>
                <td><%= post.getName() %></td>
                <td><%= post.getGender() %></td>
                <td><%= post.getAge() %></td>
                <td><%= post.getMissingLocation() %></td>
                <td><%= post.getMissingTime() %></td>
                <td><%= post.getStatus() == 0 ? "未找到" : "已找到" %></td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/post/edit?id=<%= post.getId() %>">编辑</a>
                    <a href="${pageContext.request.contextPath}/admin/post/delete?id=<%= post.getId() %>">删除</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
