package com.submission.mis.onlinesubmissionmis.controller;

import com.submission.mis.onlinesubmissionmis.model.Teacher;
import com.submission.mis.onlinesubmissionmis.service.TeacherService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class TeacherLogin extends HttpServlet {

    TeacherService service=new TeacherService();
    Teacher teacher=new Teacher();
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        req.getRequestDispatcher("/WEB-INF/LoginForm.jsp").forward(req,res);

    }
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        String category=req.getParameter("category");
        if(category.equals("student")){
            req.getRequestDispatcher("/WEB-INF/LoginForm.jsp").forward(req,res);
        }
        if(service.Login(email,password)){
            HttpSession session = req.getSession();

            Teacher teacher=service.getTeacherByEmail(email);
            session.setAttribute("teacher", teacher);
            session.setAttribute("email",email);
            session.setAttribute("teacherName", teacher.getFirstName() + " " + teacher.getLastName());
            session.setAttribute("successMessage","Login successful welcome back "+teacher.getFirstName());
            session.setMaxInactiveInterval(30 * 60);
            req.getRequestDispatcher("/WEB-INF/teacherDashboard..jsp").forward(req,res);
        }
        req.setAttribute("message","<p  style='color:red;'>Invalid Credentials</p>");
        req.getRequestDispatcher("/WEB-INF/LoginForm.jsp").forward(req,res);

    }
}
