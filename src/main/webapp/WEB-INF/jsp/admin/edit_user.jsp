<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.findkinweb.entity.User" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑用户 - 寻亲网</title>
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
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/admin/users">
                                <span data-feather="users"></span>
                                用户管理
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/posts">
                                <span data-feather="file-text"></span>
                                帖子管理
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">编辑用户</h1>
                </div>

                <% User userToEdit = (User) request.getAttribute("user"); %>
                <form action="${pageContext.request.contextPath}/admin/user/edit" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="id" value="<%= userToEdit.getId() %>">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="username" class="form-label">用户名</label>
                            <input type="text" class="form-control" id="username" name="username" value="<%= userToEdit.getUsername() %>" required>
                            <div class="invalid-feedback">
                                请输入用户名.
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label for="email" class="form-label">电子邮件</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= userToEdit.getEmail() %>">
                        </div>

                        <div class="col-sm-6">
                            <label for="phone" class="form-label">电话</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="<%= userToEdit.getPhone() %>">
                        </div>

                        <div class="col-sm-6">
                            <label for="role" class="form-label">角色</label>
                            <select class="form-select" id="role" name="role" required>
                                <option value="user" <%= "user".equals(userToEdit.getRole()) ? "selected" : "" %>>普通用户</option>
                                <option value="admin" <%= "admin".equals(userToEdit.getRole()) ? "selected" : "" %>>管理员</option>
                            </select>
                        </div>
                    </div>

                    <hr class="my-4">

                    <button class="w-100 btn btn-primary btn-lg" type="submit">更新用户</button>
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
