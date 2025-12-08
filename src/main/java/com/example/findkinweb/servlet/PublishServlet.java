package com.example.findkinweb.servlet;

import com.example.findkinweb.dao.MissingPersonDao;
import com.example.findkinweb.entity.MissingPerson;
import com.example.findkinweb.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.io.InputStream;

@WebServlet("/publish")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class PublishServlet extends HttpServlet {
    private final MissingPersonDao missingPersonDao = new MissingPersonDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.getRequestDispatcher("/WEB-INF/jsp/publish.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        MissingPerson person = new MissingPerson();
        person.setUserId(user.getId());
        person.setName(req.getParameter("name"));
        person.setGender(req.getParameter("gender"));
        person.setAge(Integer.parseInt(req.getParameter("age")));
        person.setMissingTime(LocalDate.parse(req.getParameter("missingTime")));
        person.setMissingLocation(req.getParameter("missingLocation"));
        person.setDescription(req.getParameter("description"));
        person.setContactInfo(req.getParameter("contactInfo"));
        person.setContactVisibility(Integer.parseInt(req.getParameter("contactVisibility")));
        person.setStatus(0); // 0: Not found
        person.setCreateTime(LocalDate.now());

        // Handle file upload
        Part filePart = req.getPart("photo");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                person.setPhoto(inputStream.readAllBytes());
            }
        }

        missingPersonDao.save(person);
        resp.sendRedirect(req.getContextPath() + "/");
    }
}
