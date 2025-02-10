<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #007bff, #0056b3);
            color: white;
            text-align: center;
        }
        .container {
            background: rgba(255, 255, 255, 0.2);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 400px;
        }
        h1 {
            font-size: 28px;
            margin-bottom: 15px;
        }
        p {
            font-size: 16px;
            margin-bottom: 20px;
        }
        .btn-group {
            display: flex;
            gap: 15px;
            justify-content: center;
        }
        .btn {
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn-login {
            background: #28a745;
            color: white;
        }
        .btn-register {
            background: #ffc107;
            color: black;
        }
        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to Online Submission Platform </h1>
    <p>Select an option to continue:</p>
    <div class="btn-group">
        <a class="btn btn-login" onclick="location.href='login.jsp'">Login</a>
        <a class="btn btn-register" href="student-register">Register</a>
    </div>
</div>
</body>
</html>
