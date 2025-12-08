package com.example.findkinweb.servlet;

import com.example.findkinweb.dao.UserDao;
import com.example.findkinweb.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");

        if (userDao.findByUsername(username) != null) {
            req.setAttribute("error", "用户名已存在");
            req.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(req, resp);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password); // Storing password in plaintext as per SRS
        user.setPhone(phone);
        user.setEmail(email);
        user.setRole("user");
        user.setCreateTime(LocalDate.now());

        userDao.save(user);

        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
