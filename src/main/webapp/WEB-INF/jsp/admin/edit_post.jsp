<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.findkinweb.entity.MissingPerson" %>
<%@ page import="com.example.findkinweb.entity.User" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑帖子 - 寻亲网</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
</head>
<body>
    <%
        User sessionUser = (User) session.getAttribute("user");
        if (sessionUser == null || !"admin".equals(sessionUser.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
    %>

    <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
        <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">寻亲网 - 管理后台</a>
        <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-nav">
            <div class="nav-item text-nowrap">
                <a class="nav-link px-3" href="${pageContext.request.contextPath}/logout">退出登录</a>
            </div>
        </div>
    </header>

    <div class="container-fluid">
        <div class="row">
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">
                                <span data-feather="home"></span>
                                主面板
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/users">
                                <span data-feather="users"></span>
                                用户管理
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/admin/posts">
                                <span data-feather="file-text"></span>
                                帖子管理
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">编辑帖子</h1>
                </div>

                <% MissingPerson post = (MissingPerson) request.getAttribute("post"); %>
                <form action="${pageContext.request.contextPath}/admin/post/edit" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="id" value="<%= post.getId() %>">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="name" class="form-label">姓名</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%= post.getName() %>" required>
                        </div>

                        <div class="col-sm-6">
                            <label for="gender" class="form-label">性别</label>
                            <select class="form-select" id="gender" name="gender" required>
                                <option value="Male" <%= "Male".equals(post.getGender()) ? "selected" : "" %>>男</option>
                                <option value="Female" <%= "Female".equals(post.getGender()) ? "selected" : "" %>>女</option>
                                <option value="Other" <%= "Other".equals(post.getGender()) ? "selected" : "" %>>其他</option>
                            </select>
                        </div>
                        
                        <div class="col-sm-6">
                            <label for="age" class="form-label">年龄</label>
                            <input type="number" class="form-control" id="age" name="age" value="<%= post.getAge() %>" required>
                        </div>

                        <div class="col-sm-6">
                            <label for="missingTime" class="form-label">失踪时间</label>
                            <input type="date" class="form-control" id="missingTime" name="missingTime" value="<%= post.getMissingTime() %>" required>
                        </div>

                        <div class="col-12">
                            <label for="missingLocation" class="form-label">失踪地点</label>
                            <input type="text" class="form-control" id="missingLocation" name="missingLocation" value="<%= post.getMissingLocation() %>" required>
                        </div>

                        <div class="col-12">
                            <label for="description" class="form-label">描述</label>
                            <textarea class="form-control" id="description" name="description" rows="3" required><%= post.getDescription() %></textarea>
                        </div>
                        
                        <div class="col-md-4">
                            <label for="contactInfo" class="form-label">联系信息</label>
                            <input type="text" class="form-control" id="contactInfo" name="contactInfo" value="<%= post.getContactInfo() %>" required>
                        </div>

                        <div class="col-md-4">
                            <label for="contactVisibility" class="form-label">联系人可见性</label>
                            <select class="form-select" id="contactVisibility" name="contactVisibility" required>
                                <option value="0" <%= post.getContactVisibility() == 0 ? "selected" : "" %>>公开</option>
                                <option value="1" <%= post.getContactVisibility() == 1 ? "selected" : "" %>>仅注册用户</option>
                                <option value="2" <%= post.getContactVisibility() == 2 ? "selected" : "" %>>隐藏</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label for="status" class="form-label">状态</label>
                             <select class="form-select" id="status" name="status" required>
                                <option value="0" <%= post.getStatus() == 0 ? "selected" : "" %>>未找到</option>
                                <option value="1" <%= post.getStatus() == 1 ? "selected" : "" %>>已找到</option>
                            </select>
                        </div>
                    </div>

                    <hr class="my-4">

                    <button class="w-100 btn btn-primary btn-lg" type="submit">更新帖子</button>
                </form>

            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    <script>
        feather.replace()
    </script>
</body>
</html>
