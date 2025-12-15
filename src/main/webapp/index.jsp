<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.findkinweb.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.findkinweb.entity.MissingPerson" %>
<%@ page import="com.example.findkinweb.dao.MissingPersonDao" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>寻亲网</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 56px;
        }
        .hero-section {
            background: url('bg.jpg') no-repeat center center;
            background-size: cover;
            color: white;
            padding: 100px 0;
            text-align: center;
            height: 400px;
        }
        .hero-section h1 {
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }
        .stats-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .stats-card:hover {
            transform: translateY(-10px);
        }
        .person-card {
            border-radius: 15px;
            overflow: hidden;
        }
        .person-card img {
            height: 300px;
            object-fit: cover;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">寻亲网</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <%
                        User user = (User) session.getAttribute("user");
                        if (user != null) {
                    %>
                        <li class="nav-item">
                            <a class="nav-link" href="#">你好, <%= user.getUsername() %>!</a>
                        </li>
                        <%
                            if ("admin".equals(user.getRole())) {
                        %>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">管理后台</a>
                            </li>
                        <%
                            }
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="publish">发布寻人启事</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout">退出登录</a>
                        </li>
                    <%
                        } else {
                    %>
                        <li class="nav-item">
                            <a class="nav-link" href="login">登录</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register">注册</a>
                        </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <h1>欢迎来到寻亲网</h1>
            <p class="lead">每一次寻找，都承载着一个家庭的希望</p>
        </div>
    </div>

    <div class="container mt-5">
        <!-- Statistics Section -->
        <section class="text-center mb-5">
            <h2>网站统计</h2>
            <%
                MissingPersonDao statsDao = new MissingPersonDao();
                int totalPosts = statsDao.countAll();
                int foundPeople = statsDao.countFound();
                int last7DaysPosts = statsDao.countLast7Days();
            %>
            <div class="row mt-4">
                <div class="col-md-4 mb-3">
                    <div class="card stats-card bg-primary text-white">
                        <div class="card-body">
                            <h3 class="card-title"><%= totalPosts %></h3>
                            <p class="card-text">寻人启事总数</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card stats-card bg-success text-white">
                        <div class="card-body">
                            <h3 class="card-title"><%= foundPeople %></h3>
                            <p class="card-text">已成功找到</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card stats-card bg-info text-white">
                        <div class="card-body">
                            <h3 class="card-title"><%= last7DaysPosts %></h3>
                            <p class="card-text">最近7天发布</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <hr class="my-5">

        <!-- Search Section -->
        <section class="mb-5 p-4 bg-light rounded">
            <h2 class="text-center mb-4">搜索失踪人员</h2>
            <form action="search" method="get" class="row g-3 align-items-end">
                <div class="col-md-4">
                    <label for="location" class="form-label">地点:</label>
                    <input type="text" class="form-control" id="location" name="location">
                </div>
                <div class="col-md-4">
                    <label for="startTime" class="form-label">失踪时间:</label>
                    <input type="date" class="form-control" id="startTime" name="startTime">
                </div>
                <div class="col-md-4">
                    <label for="endTime" class="form-label">至:</label>
                    <input type="date" class="form-control" id="endTime" name="endTime">
                </div>
                <div class="col-md-2">
                    <label for="startAge" class="form-label">年龄介于:</label>
                    <input type="number" class="form-control" id="startAge" name="startAge">
                </div>
                <div class="col-md-2">
                    <label for="endAge" class="form-label">和:</label>
                    <input type="number" class="form-control" id="endAge" name="endAge">
                </div>
                <div class="col-md-4">
                    <label for="keyword" class="form-label">关键词:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword">
                </div>
                <div class="col-md-4 d-grid">
                    <button type="submit" class="btn btn-primary">搜索</button>
                </div>
            </form>
        </section>

        <hr class="my-5">

        <!-- Missing Persons List -->
        <section>
            <h2 class="text-center mb-4">失踪人员列表</h2>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <%
                    MissingPersonDao missingPersonDao = new MissingPersonDao();
                    List<MissingPerson> missingPeople = (List<MissingPerson>) request.getAttribute("missingPeople");
                    if (missingPeople == null) {
                        missingPeople = missingPersonDao.findAll();
                    }
                    for (MissingPerson person : missingPeople) {
                %>
                <div class="col">
                    <div class="card h-100 person-card">
                        <% if (person.getPhoto() != null && person.getPhoto().length > 0) { %>
                            <img src="image?id=<%= person.getId() %>" class="card-img-top" alt="照片 of <%= person.getName() %>">
                        <% } else { %>
                            <img src="https://via.placeholder.com/400x300.png?text=No+Photo" class="card-img-top" alt="No photo available">
                        <% } %>
                        <div class="card-body">
                            <h5 class="card-title"><%= person.getName() %></h5>
                            <p class="card-text"><strong>性别:</strong>
                                <% if ("Male".equalsIgnoreCase(person.getGender())) { %>
                                    男
                                <% } else if ("Female".equalsIgnoreCase(person.getGender())) { %>
                                    女
                                <% } else { %>
                                    <%= person.getGender() %>
                                <% } %>
                            </p>
                            <p class="card-text"><strong>年龄:</strong> <%= person.getAge() %></p>
                            <p class="card-text"><strong>失踪地点:</strong> <%= person.getMissingLocation() %></p>
                            <p class="card-text"><strong>失踪时间:</strong> <%= person.getMissingTime() %></p>
                        </div>
                        <div class="card-footer text-muted">
                            发布于 <%= person.getCreateTime() %>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </section>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center p-4 mt-5">
        <p>&copy; 2025 寻亲网. All Rights Reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>