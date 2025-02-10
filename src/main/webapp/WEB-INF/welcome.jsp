<%@ page import="jakarta.servlet.http.HttpSession" %>
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
<% sessionObj.removeAttribute("successMessage"); %>
<% } %>

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

        <!-- Dashboard Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="bg-white p-6 shadow rounded-lg">
                <h3 class="text-lg font-semibold">Total Assignments</h3>
                <p class="text-2xl font-bold">5</p>
            </div>
            <div class="bg-white p-6 shadow rounded-lg">
                <h3 class="text-lg font-semibold">Pending Assignments</h3>
                <p class="text-2xl font-bold">2</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
