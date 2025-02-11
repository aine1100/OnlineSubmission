package com.submission.mis.onlinesubmissionmis.controller;

import com.submission.mis.onlinesubmissionmis.model.Assignment;
import com.submission.mis.onlinesubmissionmis.model.Teacher;
import com.submission.mis.onlinesubmissionmis.service.AssignmentService;
import com.submission.mis.onlinesubmissionmis.service.TeacherService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class AssignmentController extends HttpServlet {
    private final AssignmentService assignmentService = new AssignmentService();
    private final TeacherService teacherService = new TeacherService();

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Get all assignments
//        List<Assignment> assignments= assignmentService.getAssignment();
//        for(Assignment assignment:assignments){
//            System.out.println(assignment);
//        }
////        req.setAttribute("assignments",assignments);
//        List<Assignment> assignment= assignmentService.getAssignment();
//        for(Assignment a:assignment){
//            req.setAttribute("stuTitle",a.getTitle());
//            req.setAttribute("stuCourse",a.getCourse());
//            req.setAttribute("desc",a.getDescription());
//            req.setAttribute("tr",a.getTeacher().getFirstName()+" "+a.getTeacher().getLastName());
//        }
//        req.getRequestDispatcher("/WEB-INF/teacherDashboard..jsp").forward(req, res);
        List<Assignment> assignments = assignmentService.getAssignment();
        req.setAttribute("assignments", assignments);
        req.getRequestDispatcher("/WEB-INF/welcome.jsp").forward(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        if (session == null) {
            req.setAttribute("message", "Session expired. Please login again.");
            req.getRequestDispatcher("/WEB-INF/LoginForm.jsp").forward(req, res);
            return;
        }

        // Get managed teacher entity
        Teacher sessionTeacher = (Teacher) session.getAttribute("teacher");
        Teacher managedTeacher = teacherService.getTeacherById(sessionTeacher.getId());

        // Create assignment with managed teacher
        Assignment assignment = new Assignment(
                req.getParameter("title"),
                req.getParameter("description"),
                managedTeacher,
                req.getParameter("course")
        );

        assignmentService.addAssignment(assignment);
        req.setAttribute("assMessage", "Assignment created successfully!");
        req.getRequestDispatcher("/WEB-INF/teacherDashboard..jsp").forward(req, res);
    }
}