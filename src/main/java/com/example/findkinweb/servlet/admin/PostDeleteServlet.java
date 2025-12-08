package com.example.findkinweb.servlet.admin;

import com.example.findkinweb.dao.MissingPersonDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/post/delete")
public class PostDeleteServlet extends HttpServlet {
    private final MissingPersonDao missingPersonDao = new MissingPersonDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int postId = Integer.parseInt(req.getParameter("id"));
        missingPersonDao.delete(postId);
        resp.sendRedirect(req.getContextPath() + "/admin/posts");
    }
}
