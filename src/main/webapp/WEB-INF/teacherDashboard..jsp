<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

<%
    String successMessage = (String) request.getAttribute("assMessage");
    String errorMessage = (String) request.getAttribute("inputMessage");
%>

<% if (successMessage != null) { %>
<div id="successMessage" class="fixed top-4 left-1/2 transform -translate-x-1/2 bg-green-500 text-white py-2 px-4 rounded shadow-md">
    <%= successMessage %>
</div>
<script>
    setTimeout(() => document.getElementById("successMessage").style.display = "none", 3000);
</script>
<% } %>

<% if (errorMessage != null) { %>
<div class="fixed top-4 left-1/2 transform -translate-x-1/2 bg-red-500 text-white py-2 px-4 rounded shadow-md">
    <%= errorMessage %>
</div>
<% } %>

<div class="flex h-screen">
    <!-- Sidebar -->
    <div class="w-64 bg-blue-900 text-white p-5">
        <h2 class="text-2xl font-bold">Teacher Dashboard</h2>
        <ul class="mt-6">
            <li class="py-2 px-4 hover:bg-blue-700 rounded cursor-pointer">Home</li>
            <li class="py-2 px-4 hover:bg-blue-700 rounded cursor-pointer">My Assignments</li>
            <li class="py-2 px-4 hover:bg-blue-700 rounded cursor-pointer">Submitted Assignments</li>
            <li class="py-2 px-4 hover:bg-blue-700 rounded cursor-pointer">Create Assignment</li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="flex-1 p-6">
        <!-- Navbar -->
        <%
            HttpSession sessionObj = request.getSession(false);
            String teacherName = (sessionObj != null) ? (String) sessionObj.getAttribute("teacherName") : "teacher";
        %>

        <div class="flex justify-between bg-white p-4 shadow rounded mb-6">
            <h2 class="text-xl font-semibold">Dashboard</h2>
            <div class="text-gray-700">Welcome, <%= teacherName %></div>
        </div>

        <!-- Dashboard Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-white p-6 shadow rounded-lg">
                <h3 class="text-lg font-semibold">Total Assignments</h3>
                <p class="text-2xl font-bold">10</p> <%-- Replace with dynamic value --%>
            </div>
            <div class="bg-white p-6 shadow rounded-lg">
                <h3 class="text-lg font-semibold">Submitted Assignments</h3>
                <p class="text-2xl font-bold">7</p> <%-- Replace with dynamic value --%>
            </div>
            <div class="bg-white p-6 shadow rounded-lg">
                <h3 class="text-lg font-semibold">Pending Submissions</h3>
                <p class="text-2xl font-bold">3</p> <%-- Replace with dynamic value --%>
            </div>
        </div>

        <!-- Create Assignment Section -->
        <div class="mt-8 bg-white p-6 shadow rounded-lg">
            <h3 class="text-lg font-semibold">Create New Assignment</h3>
            <form class="mt-4" action="add-assignment" method="post">
                <label class="block text-gray-700">Assignment Title</label>
                <input type="text" class="w-full p-2 border rounded mt-2" name="title" required>

                <label class="block text-gray-700">Assignment Course</label>
                <input type="text" class="w-full p-2 border rounded mt-2" name="course" required>

                <label class="block text-gray-700 mt-4">Description</label>
                <textarea class="w-full p-2 border rounded mt-2" name="description" required></textarea>

                <button class="mt-4 bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700">Create</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
