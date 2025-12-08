package com.example.findkinweb.servlet.admin;

import com.example.findkinweb.dao.MissingPersonDao;
import com.example.findkinweb.entity.MissingPerson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/posts")
public class PostListServlet extends HttpServlet {
    private final MissingPersonDao missingPersonDao = new MissingPersonDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MissingPerson> posts = missingPersonDao.findAll();
        req.setAttribute("posts", posts);
        req.getRequestDispatcher("/WEB-INF/jsp/admin/posts.jsp").forward(req, resp);
    }
}
