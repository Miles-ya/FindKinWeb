<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布寻人启事</title>
</head>
<body>
    <h1>发布寻人启事</h1>
    <form action="publish" method="post" enctype="multipart/form-data">
        <label for="name">姓名:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="gender">性别:</label>
        <select id="gender" name="gender" required>
            <option value="Male">男</option>
            <option value="Female">女</option>
            <option value="Other">其他</option>
        </select><br>

        <label for="age">年龄:</label>
        <input type="number" id="age" name="age" required><br>

        <label for="missingTime">失踪时间:</label>
        <input type="date" id="missingTime" name="missingTime" required><br>

        <label for="missingLocation">失踪地点:</label>
        <input type="text" id="missingLocation" name="missingLocation" required><br>

        <label for="description">描述:</label>
        <textarea id="description" name="description" required></textarea><br>

        <label for="photo">照片:</label>
        <input type="file" id="photo" name="photo"><br>

        <label for="contactInfo">联系信息:</label>
        <input type="text" id="contactInfo" name="contactInfo" required><br>

        <label for="contactVisibility">联系人可见性:</label>
        <select id="contactVisibility" name="contactVisibility" required>
            <option value="0">公开</option>
            <option value="1">仅注册用户</option>
            <option value="2">隐藏</option>
        </select><br>

        <button type="submit">发布</button>
    </form>
</body>
</html>
