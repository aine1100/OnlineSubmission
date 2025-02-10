<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        h2 {
            text-align: center;
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .hidden {
            display: none;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 15px;
        }
        button:hover {
            background: #0056b3;
        }
    </style>
    <script>
        function toggleFields() {
            let role = document.getElementById("role").value;
            let dobField = document.getElementById("dob");
            let dobLabel = document.querySelector("label[for='dob']");
            let courseField = document.getElementById("course-group");

            if (role === "teacher") {
                dobField.style.display = "none";
                dobLabel.style.display = "none";
                dobField.removeAttribute("required"); // Remove required attribute
                courseField.classList.remove("hidden");
            } else {
                dobField.style.display = "block";
                dobLabel.style.display = "block";
                dobField.setAttribute("required", "required"); // Add required attribute back
                courseField.classList.add("hidden");
            }
        }
    </script>

</head>
<body>
<div class="container">
    <h2>Register</h2>
    <div>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.print(message);  // prints the message
            }
        %>
    </div>


    <form action="student-login" method="post">
        <label for="role">Login as:</label>
        <select id="role" name="category" onchange="toggleFields()" required>
            <option value="student">Student</option>
            <option value="teacher">Teacher</option>
        </select>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Login</button>
    </form>

</div>
</body>
</html>
