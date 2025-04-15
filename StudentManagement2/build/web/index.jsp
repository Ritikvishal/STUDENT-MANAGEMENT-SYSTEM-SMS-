<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate.css for beautiful animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet"/>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            color: #212529;
            transition: background-color 0.4s, color 0.4s;
           
        }

        .dark-mode {
            background-color: #121212;
            color: #e6e6e6;
        }

        .toggle-container {
            text-align: right;
            padding: 10px 30px 0 0;
            background-color: #343a40;
        }

        .toggle-container input {
            display: none;
        }

        .toggle-label {
            background-color: #000000;
            border-radius: 50px;
            cursor: pointer;
            display: inline-block;
            height: 30px;
            width: 60px;
            position: relative;
            border: 2px solid #fff;
        }

        .toggle-label::after {
            content: '';
            background-color: #ffffff;
            border-radius: 50%;
            position: absolute;
            top: 3px;
            left: 3px;
            height: 24px;
            width: 24px;
            transition: transform 0.3s ease;
        }

        input:checked + .toggle-label::after {
            transform: translateX(30px);
        }

        nav {
            background: linear-gradient(90deg, #000000, #343a40);
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav a {
            color: #ffffff;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 500;
            font-size: 1rem;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #0dcaf0;
        }

        .hero-section {
            background: url("Image/profile_image.jpg") no-repeat center center;
            background-size: cover;
            height: 90vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.7);
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            text-align: center;
            color: #fff;
            opacity: 0;
            animation: fadeInUp 1s ease-in-out forwards;
        }

        .hero-content h1 {
            font-size: 3.5rem;
            font-weight: 700;
            text-shadow: 2px 2px 8px #000000;
        }

        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 25px;
            color: #dddddd;
        }

        .btn-primary {
            background: linear-gradient(135deg, #007bff, #00bfff);
            border: none;
            padding: 12px 28px;
            font-size: 1.1rem;
            border-radius: 30px;
            transition: 0.3s ease-in-out;
            color: #ffffff;
            font-weight: bold;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #0056b3, #00aaff);
            color: #ffffff;
            box-shadow: 0 6px 16px rgba(0, 123, 255, 0.5);
        }

        @keyframes fadeInUp {
            from {
                transform: translateY(40px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        footer {
            background-color: #212529;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 2rem;
            }

            .hero-content p {
                font-size: 1rem;
            }

            nav {
                flex-direction: column;
                align-items: flex-start;
            }

            nav a {
                margin: 10px 0 0;
            }

            .toggle-container {
                text-align: center;
                padding: 10px;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="shadow">
        <div><strong>Student Management System</strong></div>
        <div>
            <a href="index.jsp">Home</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </nav>

    <!-- Dark Mode Toggle -->
    <div class="toggle-container">
        <input type="checkbox" id="darkToggle">
        <label for="darkToggle" class="toggle-label"></label>
    </div>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="overlay"></div>
        <div class="hero-content animate__animated animate__fadeInUp">
            <h1>Welcome to Student Management</h1>
            <p>Simple. Bold. Efficient.</p>
            <a href="login.jsp" class="btn btn-primary">Get Started</a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        © 2025 Student Management System
    </footer>

    <!-- Scripts -->
    <script>
        const toggle = document.getElementById('darkToggle');
        toggle.addEventListener('change', () => {
            document.body.classList.toggle('dark-mode');
        });
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
