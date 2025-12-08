<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.findkinweb.entity.MissingPerson" %>
<html>
<head>
    <title>编辑帖子</title>
</head>
<body>
    <h1>编辑帖子</h1>
    <% MissingPerson post = (MissingPerson) request.getAttribute("post"); %>
    <form action="${pageContext.request.contextPath}/admin/post/edit" method="post">
        <input type="hidden" name="id" value="<%= post.getId() %>">
        <label for="name">姓名:</label>
        <input type="text" id="name" name="name" value="<%= post.getName() %>" required><br>

        <label for="gender">性别:</label>
        <input type="text" id="gender" name="gender" value="<%= post.getGender() %>" required><br>

        <label for="age">年龄:</label>
        <input type="number" id="age" name="age" value="<%= post.getAge() %>" required><br>

        <label for="missingTime">失踪时间:</label>
        <input type="date" id="missingTime" name="missingTime" value="<%= post.getMissingTime() %>" required><br>

        <label for="missingLocation">失踪地点:</label>
        <input type="text" id="missingLocation" name="missingLocation" value="<%= post.getMissingLocation() %>" required><br>

        <label for="description">描述:</label>
        <textarea id="description" name="description" required><%= post.getDescription() %></textarea><br>

        <label for="contactInfo">联系信息:</label>
        <input type="text" id="contactInfo" name="contactInfo" value="<%= post.getContactInfo() %>" required><br>

        <label for="contactVisibility">联系人可见性:</label>
        <input type="number" id="contactVisibility" name="contactVisibility" value="<%= post.getContactVisibility() %>" required><br>

        <label for="status">状态:</label>
        <select id="status" name="status" required>
            <option value="0" <%= post.getStatus() == 0 ? "selected" : "" %>>未找到</option>
            <option value="1" <%= post.getStatus() == 1 ? "selected" : "" %>>已找到</option>
        </select><br>

        <button type="submit">更新帖子</button>
    </form>
</body>
</html>
