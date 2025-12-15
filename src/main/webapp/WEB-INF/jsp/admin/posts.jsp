<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.findkinweb.entity.MissingPerson" %>
<%@ page import="com.example.findkinweb.entity.User" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>帖子管理 - 寻亲网</title>
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
                    <h1 class="h2">帖子管理</h1>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">姓名</th>
                                <th scope="col">性别</th>
                                <th scope="col">年龄</th>
                                <th scope="col">失踪地点</th>
                                <th scope="col">失踪时间</th>
                                <th scope="col">状态</th>
                                <th scope="col">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<MissingPerson> posts = (List<MissingPerson>) request.getAttribute("posts");
                                if (posts != null) {
                                    for (MissingPerson post : posts) {
                            %>
                            <tr>
                                <td><%= post.getId() %></td>
                                <td><%= post.getName() %></td>
                                <td>
                                    <% if ("Male".equalsIgnoreCase(post.getGender())) { %>
                                        男
                                    <% } else if ("Female".equalsIgnoreCase(post.getGender())) { %>
                                        女
                                    <% } else { %>
                                        <%= post.getGender() %>
                                    <% } %>
                                </td>
                                <td><%= post.getAge() %></td>
                                <td><%= post.getMissingLocation() %></td>
                                <td><%= post.getMissingTime() %></td>
                                <td>
                                    <% if (post.getStatus() == 0) { %>
                                        <span class="badge bg-warning text-dark">未找到</span>
                                    <% } else { %>
                                        <span class="badge bg-success">已找到</span>
                                    <% } %>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/post/edit?id=<%= post.getId() %>" class="btn btn-sm btn-outline-primary">编辑</a>
                                    <a href="${pageContext.request.contextPath}/admin/post/delete?id=<%= post.getId() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('确定要删除这篇帖子吗?')">删除</a>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
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
