package com.example.findkinweb.servlet;

import com.example.findkinweb.dao.MissingPersonDao;
import com.example.findkinweb.entity.MissingPerson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private final MissingPersonDao missingPersonDao = new MissingPersonDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String location = req.getParameter("location");
        String startTimeStr = req.getParameter("startTime");
        String endTimeStr = req.getParameter("endTime");
        String startAgeStr = req.getParameter("startAge");
        String endAgeStr = req.getParameter("endAge");
        String keyword = req.getParameter("keyword");

        LocalDate startTime = null;
        if (startTimeStr != null && !startTimeStr.isEmpty()) {
            try {
                startTime = LocalDate.parse(startTimeStr);
            } catch (DateTimeParseException e) {
                // Handle parsing error if necessary
            }
        }

        LocalDate endTime = null;
        if (endTimeStr != null && !endTimeStr.isEmpty()) {
            try {
                endTime = LocalDate.parse(endTimeStr);
            } catch (DateTimeParseException e) {
                // Handle parsing error if necessary
            }
        }

        Integer startAge = null;
        if (startAgeStr != null && !startAgeStr.isEmpty()) {
            startAge = Integer.parseInt(startAgeStr);
        }

        Integer endAge = null;
        if (endAgeStr != null && !endAgeStr.isEmpty()) {
            endAge = Integer.parseInt(endAgeStr);
        }

        List<MissingPerson> missingPeople = missingPersonDao.search(location, startTime, endTime, startAge, endAge, keyword);
        req.setAttribute("missingPeople", missingPeople);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
