<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("profile_image.jpg") no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(4px);
            z-index: 0;
        }

        .login-container {
            backdrop-filter: blur(12px);
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: 20px;
            padding: 40px 30px;
            width: 100%;
            max-width: 360px;
            z-index: 1;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            animation: fadeInUp 1s ease;
        }

        @keyframes fadeInUp 
            0% {
                opacity: 0;
                transform: translateY(40px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        

        .form-floating > input {
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 12px;
        }

        .form-control:focus {
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.4);
        }

        .btn-login {
            background: linear-gradient(to right, #28a745, #218838);
            border: none;
            padding: 10px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
            border-radius: 12px;
        }

        .btn-login:hover {
            background: linear-gradient(to right, #218838, #28a745);
            transform: scale(1.03);
            box-shadow: 0 4px 10px rgba(33, 136, 56, 0.5);
        }

        .dark {
            background: url("img/login-bg.jpg") no-repeat center center fixed !important;
            background-size: cover;
            color: #f0f0f0 !important;
        }

        .dark .login-container {
            background: rgba(30, 30, 30, 0.8);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .dark .form-floating > input {
            background-color: rgba(70, 70, 70, 0.7);
            color: #fff;
            border-color: #444;
        }

        .dark .btn-login {
            background: linear-gradient(to right, #444, #666);
        }

        .dark-mode-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 2;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: 0.4s;
            border-radius: 24px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 4px;
            bottom: 3px;
            background-color: white;
            transition: 0.4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            color: #0056b3;
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 25px 20px;
                max-width: 90%;
            }
        }
    </style>

    <script>
        window.onload = () => {
            const isDark = localStorage.getItem('dark-mode') === 'true';
            document.body.classList.toggle('dark', isDark);
            document.getElementById('modeToggle').checked = isDark;
        };

        function toggleDarkMode() {
            const enabled = document.getElementById('modeToggle').checked;
            document.body.classList.toggle('dark', enabled);
            localStorage.setItem('dark-mode', enabled);
        }
    </script>
</head>
<body>
<div class="overlay"></div>

<div class="dark-mode-toggle">
    <label class="switch">
        <input type="checkbox" id="modeToggle" onchange="toggleDarkMode()">
        <span class="slider"></span>
    </label>
</div>

<div class="login-container animate__animated animate__fadeInUp">
    <h2 class="text-center mb-4">Login</h2>

    <% String error = (String) request.getAttribute("errorMessage"); %>
    <% if (error != null) { %>
        <p class="text-danger fw-semibold text-center"><%= error %></p>
    <% } %>

    <form action="LogServlet" method="post">
        <div class="form-floating mb-3">
            <input type="text" name="email" class="form-control" id="email" placeholder="Email">
            <label for="email">Email</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" name="password" class="form-control" id="password" placeholder="Password">
            <label for="password">Password</label>
        </div>
        <input type="submit" class="btn btn-login w-100" value="Login">
    </form>

    <p class="text-center mt-3">Don't have an account? <a href="register.jsp">Register here</a></p>
</div>
</body>
</html>
