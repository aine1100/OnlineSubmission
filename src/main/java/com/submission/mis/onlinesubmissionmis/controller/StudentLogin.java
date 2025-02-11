package com.submission.mis.onlinesubmissionmis.controller;

import java.io.*;
import java.util.List;

import com.submission.mis.onlinesubmissionmis.model.Assignment;
import com.submission.mis.onlinesubmissionmis.model.Student;
import com.submission.mis.onlinesubmissionmis.service.AssignmentService;
import com.submission.mis.onlinesubmissionmis.service.StudentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "StudentLoginServlet", value = "/StudentLogin-servlet")
public class StudentLogin extends HttpServlet {
    private String message;
    StudentService service=new StudentService();
    Student student=new Student();
    AssignmentService assignmentService=new AssignmentService();


    public  StudentLogin(){}
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
       String category=request.getParameter("category");
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        if(category.equals("teacher")){
            request.getRequestDispatcher("teacher-login").forward(request,response);
        }
        if (service.login(email, password)) {
            HttpSession session = request.getSession();
            Student student = service.getStudentByEmail(email); // Fetch student details

            session.setAttribute("email", email);
            session.setAttribute("studentName", student.getFirstName() + " " + student.getLastName()); // Store full name
            session.setAttribute("successMessage", "Login successful, welcome back " + student.getFirstName());
            session.setMaxInactiveInterval(30 * 60);

            request.getRequestDispatcher("/WEB-INF/welcome.jsp").forward(request, response);
        }
        request.setAttribute("message","<p  style='color:red;'>Invalid Credentials</p>");
            request.getRequestDispatcher("/WEB-INF/LoginForm.jsp").forward(request,response);



    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/LoginForm.jsp").forward(request,response);

    }


    public void destroy() {
    }
}