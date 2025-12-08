package com.example.findkinweb.servlet.admin;

import com.example.findkinweb.dao.UserDao;
import com.example.findkinweb.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/user/edit")
public class UserEditServlet extends HttpServlet {
    private final UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        User user = userDao.findById(userId);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/WEB-INF/jsp/admin/edit_user.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        User user = userDao.findById(userId);
        user.setUsername(req.getParameter("username"));
        user.setPhone(req.getParameter("phone"));
        user.setEmail(req.getParameter("email"));
        user.setRole(req.getParameter("role"));
        userDao.update(user);
        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }
}
