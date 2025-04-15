<%@ page import="com.db.Employee, com.dao.EmployeeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Employee e = EmployeeDAO.getEmployeeById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            width: 350px;
            transition: all 0.3s ease;
        }

        .form-container:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus, input[type="email"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
            transition: all 0.3s ease, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .dark {
            background: linear-gradient(to right, #232526, #414345) !important;
            color: #f0f0f0 !important;
        }

        .dark .form-container {
            background: rgba(44, 44, 44, 0.85);
        }

        .dark input[type="text"], .dark input[type="email"] {
            background-color: #2a2a2a;
            color: white;
            border: 1px solid #555;
        }

        .dark input[type="submit"] {
            background-color: #666;
        }

        .dark input[type="submit"]:hover {
            background-color: #888;
        }

        .dark-mode-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
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

    <div class="dark-mode-toggle">
        <label class="switch">
            <input type="checkbox" id="modeToggle" onchange="toggleDarkMode()">
            <span class="slider"></span>
        </label>
    </div>

    <div class="form-container">
        <h2>Edit Student</h2>
        <form action="UpdateEmployeeServlet" method="post">
            <input type="hidden" name="id" value="<%= e.getId() %>">
            <input type="text" name="name" value="<%= e.getName() %>" required>
            <input type="email" name="email" value="<%= e.getEmail() %>" required>
            <input type="text" name="department" value="<%= e.getDepartment() %>" required>
            <input type="submit" value="Update Employee">
        </form>
    </div>
</body>
</html>
