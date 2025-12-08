package com.example.findkinweb.servlet;

import com.example.findkinweb.dao.MissingPersonDao;
import com.example.findkinweb.entity.MissingPerson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/image")
public class ImageServlet extends HttpServlet {
    private final MissingPersonDao missingPersonDao = new MissingPersonDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        MissingPerson person = missingPersonDao.findById(id);
        byte[] photo = person.getPhoto();

        if (photo != null && photo.length > 0) {
            resp.setContentType("image/jpeg"); // Or other appropriate content type
            resp.setContentLength(photo.length);
            resp.getOutputStream().write(photo);
        }
    }
}
