<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.findkinweb.entity.User" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布寻人启事 - 寻亲网</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .publish-container {
            padding-top: 56px;
        }
        .publish-form {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <%
        User user = (User) session.getAttribute("user");
        // Redirect to login if user is not logged in
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
    %>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">寻亲网</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">你好, <%= user.getUsername() %>!</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/publish">发布寻人启事</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">退出登录</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container publish-container">
        <div class="publish-form">
            <h1 class="text-center mb-4">发布寻人启事</h1>
            <form action="${pageContext.request.contextPath}/publish" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name" class="form-label">姓名</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="gender" class="form-label">性别</label>
                        <select class="form-select" id="gender" name="gender" required>
                            <option selected disabled value="">请选择...</option>
                            <option value="Male">男</option>
                            <option value="Female">女</option>
                            <option value="Other">其他</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="age" class="form-label">年龄</label>
                        <input type="number" class="form-control" id="age" name="age" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="missingTime" class="form-label">失踪时间</label>
                        <input type="date" class="form-control" id="missingTime" name="missingTime" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="missingLocation" class="form-label">失踪地点</label>
                    <input type="text" class="form-control" id="missingLocation" name="missingLocation" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">详细描述</label>
                    <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                </div>

                <div class="mb-3">
                    <label for="photo" class="form-label">上传照片</label>
                    <input class="form-control" type="file" id="photo" name="photo">
                </div>
                
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="contactInfo" class="form-label">联系信息</label>
                        <input type="text" class="form-control" id="contactInfo" name="contactInfo" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="contactVisibility" class="form-label">联系信息可见性</label>
                        <select class="form-select" id="contactVisibility" name="contactVisibility" required>
                            <option value="0">公开</option>
                            <option value="1">仅对注册用户可见</option>
                            <option value="2">隐藏 (仅管理员可见)</option>
                        </select>
                    </div>
                </div>

                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-primary">发布</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center p-4 mt-5">
        <p>&copy; 2025 寻亲网. All Rights Reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
