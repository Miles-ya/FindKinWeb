<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.findkinweb.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.findkinweb.entity.MissingPerson" %>
<%@ page import="com.example.findkinweb.dao.MissingPersonDao" %>
<!DOCTYPE html>
<html>
<head>
    <title>寻亲网</title>
</head>
<body>
    <h1>欢迎来到寻亲网</h1>

    <%
        User user = (User) session.getAttribute("user");
        if (user != null) {
    %>
        <p>你好, <%= user.getUsername() %>!</p>
        <a href="logout">退出登录</a>
        <br>
        <a href="publish">发布新的寻人启事</a>
    <%
        } else {
    %>
        <a href="login">登录</a>
        <a href="register">注册</a>
    <%
        }
    %>

    <hr>

    <h2>统计信息</h2>
    <%
        MissingPersonDao statsDao = new MissingPersonDao();
        int totalPosts = statsDao.countAll();
        int foundPeople = statsDao.countFound();
        int last7DaysPosts = statsDao.countLast7Days();
    %>
    <p>寻人启事总数: <%= totalPosts %></p>
    <p>已成功找到: <%= foundPeople %></p>
    <p>最近7天发布的帖子: <%= last7DaysPosts %></p>

    <hr>

    <h2>搜索失踪人员</h2>
    <form action="search" method="get">
        <label for="location">地点:</label>
        <input type="text" id="location" name="location">

        <label for="startTime">失踪时间:</label>
        <input type="date" id="startTime" name="startTime">

        <label for="endTime">至:</label>
        <input type="date" id="endTime" name="endTime">

        <label for="startAge">年龄介于:</label>
        <input type="number" id="startAge" name="startAge">

        <label for="endAge">和:</label>
        <input type="number" id="endAge" name="endAge">

        <label for="keyword">关键词:</label>
        <input type="text" id="keyword" name="keyword">

        <button type="submit">搜索</button>
    </form>

    <hr>

    <h2>失踪人员列表</h2>
    <%
        MissingPersonDao missingPersonDao = new MissingPersonDao();
        List<MissingPerson> missingPeople = (List<MissingPerson>) request.getAttribute("missingPeople");
        if (missingPeople == null) {
            missingPeople = missingPersonDao.findAll();
        }
        for (MissingPerson person : missingPeople) {
    %>
        <div>
            <h3><%= person.getName() %></h3>
            <p>性别: <%= person.getGender() %></p>
            <p>年龄: <%= person.getAge() %></p>
            <p>失踪地点: <%= person.getMissingLocation() %></p>
            <p>失踪时间: <%= person.getMissingTime() %></p>
            <% if (person.getPhoto() != null && person.getPhoto().length > 0) { %>
                <img src="image?id=<%= person.getId() %>" alt="照片 of <%= person.getName() %>" width="200">
            <% } %>
        </div>
        <hr>
    <%
        }
    %>

</body>
</html>