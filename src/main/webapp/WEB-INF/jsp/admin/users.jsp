<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.findkinweb.entity.User" %>
<html>
<head>
    <title>用户管理</title>
    </head>
    <body>
        <h1>用户管理</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>电话</th>
                    <th>电子邮件</th>
                    <th>角色</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<User> users = (List<User>) request.getAttribute("users");
                    for (User user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getUsername() %></td>
                    <td><%= user.getPhone() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getCreateTime() %></td>
                    <td><%= user.getCreateTime() %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/user/edit?id=<%= user.getId() %>">编辑</a>
                        <a href="${pageContext.request.contextPath}/admin/user/delete?id=<%= user.getId() %>">删除</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
    </html>
    
    
