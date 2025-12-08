package com.example.findkinweb.servlet.admin;

import com.example.findkinweb.dao.MissingPersonDao;
import com.example.findkinweb.entity.MissingPerson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/admin/post/edit")
public class PostEditServlet extends HttpServlet {
    private final MissingPersonDao missingPersonDao = new MissingPersonDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int postId = Integer.parseInt(req.getParameter("id"));
        MissingPerson post = missingPersonDao.findById(postId);
        req.setAttribute("post", post);
        req.getRequestDispatcher("/WEB-INF/jsp/admin/edit_post.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int postId = Integer.parseInt(req.getParameter("id"));
        MissingPerson post = missingPersonDao.findById(postId);
        post.setName(req.getParameter("name"));
        post.setGender(req.getParameter("gender"));
        post.setAge(Integer.parseInt(req.getParameter("age")));
        post.setMissingTime(LocalDate.parse(req.getParameter("missingTime")));
        post.setMissingLocation(req.getParameter("missingLocation"));
        post.setDescription(req.getParameter("description"));
        post.setContactInfo(req.getParameter("contactInfo"));
        post.setContactVisibility(Integer.parseInt(req.getParameter("contactVisibility")));
        post.setStatus(Integer.parseInt(req.getParameter("status")));
        missingPersonDao.update(post);
        resp.sendRedirect(req.getContextPath() + "/admin/posts");
    }
}
