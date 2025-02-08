package com.submission.mis.onlinesubmissionmis.controller;

import com.submission.mis.onlinesubmissionmis.model.Student;
import com.submission.mis.onlinesubmissionmis.service.StudentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

public class StudentRegistration extends HttpServlet {
    StudentService service = new StudentService();

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String category = req.getParameter("category");
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        LocalDate dob = LocalDate.parse(req.getParameter("dob"));
        int age = LocalDate.now().getYear() - dob.getYear();

        // Redirect teachers to the teacher registration page
        if (category.equals("teacher")) {
//            req.getRequestDispatcher("/teacher-register").forward(req, resp);
            return;
        }

        // Hash the password using BCrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Check if email already exists
        if (service.emailExists(email)) {
            out.print("Email Already Exists or is Used");
            return;
        }

        // Create a student object and save it
        Student student = new Student(fname, lname, email, dob, age, hashedPassword);
        service.addStudent(student);
        HttpSession session= req.getSession();
        session.setAttribute("student",student);
        session.setMaxInactiveInterval(30*60);


        // Redirect to a confirmation page
        req.getRequestDispatcher("/WEB-INF/RegisterForm.jsp").forward(req, resp);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/RegisterForm.jsp").forward(req, resp);
    }
}
