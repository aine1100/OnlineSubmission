<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="com.submission.mis.onlinesubmissionmis.model.Assignment" %>
<%@ page import="com.submission.mis.onlinesubmissionmis.model.Teacher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<%
    HttpSession sessionObj = request.getSession(false);
    String successMessage = (sessionObj != null) ? (String) sessionObj.getAttribute("successMessage") : null;
    if (successMessage != null) {
%>
<div id="successMessage" class="fixed top-4 left-1/2 transform -translate-x-1/2 bg-green-500 text-white py-2 px-4 rounded shadow-md">
    <%= successMessage %>
</div>
<script>
    setTimeout(() => document.getElementById("successMessage").style.display = "none", 3000);
</script>
<%
        sessionObj.removeAttribute("successMessage");
    }

    // Get assignments from request attribute
    List<Assignment> assignments = (List<Assignment>) request.getAttribute("assignments");
%>

<div class="flex h-screen">
    <!-- Sidebar -->
    <div class="w-64 bg-blue-900 text-white p-5">
        <h2 class="text-2xl font-bold">Student Dashboard</h2>
        <ul class="mt-6">
            <li class="py-2 px-4 hover:bg-blue-700 rounded cursor-pointer">Home</li>
            <li class="py-2 px-4 hover:bg-blue-700 rounded cursor-pointer">Assignments</li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="flex-1 p-6">
        <!-- Navbar -->
        <%
            String studentName = (sessionObj != null) ? (String) sessionObj.getAttribute("studentName") : "Student";
        %>

        <div class="flex justify-between bg-white p-4 shadow rounded mb-6">
            <h2 class="text-xl font-semibold">Dashboard</h2>
            <div class="text-gray-700">Welcome, <%= studentName %></div>
        </div>

        <!-- Assignments List -->
        <div class="mt-8 bg-white p-6 shadow rounded-lg">
            <h3 class="text-lg font-semibold mb-4">Your Assignments</h3>

            <% if (assignments != null && !assignments.isEmpty()) {
                for (Assignment assignment : assignments) {
                    Teacher teacher = assignment.getTeacher();
            %>
            <div class="mb-4 p-4 border rounded-lg hover:bg-gray-50">
                <div class="flex justify-between items-start">
                    <div>
                        <h4 class="font-semibold text-lg">
                            <%= assignment.getTitle() != null ? assignment.getTitle() : "Untitled Assignment" %>
                        </h4>
                        <p class="text-gray-600">
                            <%= assignment.getDescription() != null ? assignment.getDescription() : "No description available" %>
                        </p>
                        <div class="mt-2 text-sm text-gray-500">
                            <span>Course: <%= assignment.getCourse() != null ? assignment.getCourse() : "N/A" %></span>
                            <% if (teacher != null) { %>
                            <span class="ml-4">
                                        Teacher: <%= teacher.getFirstName() %> <%= teacher.getLastName() %>
                                    </span>
                            <% } %>
                        </div>
                    </div>
                    <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                        Submit
                    </button>
                </div>
            </div>
            <% }
            } else { %>
            <p class="text-gray-500">No assignments found.</p>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>