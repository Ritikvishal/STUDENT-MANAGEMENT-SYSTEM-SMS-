<%@ page import="java.util.*, com.db.Employee, com.dao.EmployeeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        .dark {
            background: linear-gradient(135deg, #232526, #414345);
            color: #f8f8f8;
        }

        .container-box {
            margin: 80px auto;
            max-width: 1100px;
            width: 95%;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        .dark .container-box {
            background: rgba(30, 30, 30, 0.85);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .add-btn {
            display: inline-block;
            background: linear-gradient(to right, #007bff, #0056b3);
            color: white;
            padding: 10px 20px;
            border-radius: 12px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
            margin-bottom: 20px;
        }

        .add-btn:hover {
            background: linear-gradient(to right, #0056b3, #007bff);
            transform: scale(1.03);
        }

        .dark .add-btn {
            background: linear-gradient(to right, #3399ff, #267acc);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.9);
        }

        .dark .table {
            background-color: rgba(44, 44, 44, 0.95);
            color: #f0f0f0;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .dark th {
            background-color: #3399ff;
        }

        .edit-btn, .delete-btn {
            padding: 6px 14px;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            font-weight: 500;
            transition: all 0.3s ease;
            margin-right: 5px;
        }

        .edit-btn {
            background-color: #28a745;
        }

        .edit-btn:hover {
            background-color: #1e7e34;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #a71d2a;
        }

        .dark .edit-btn {
            background-color: #4cd964;
            color: black;
        }

        .dark .edit-btn:hover {
            background-color: #3ac65c;
        }

        .dark .delete-btn {
            background-color: #ff4d4d;
        }

        .dark .delete-btn:hover {
            background-color: #cc0000;
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

        @media screen and (max-width: 768px) {
            .container-box {
                padding: 20px;
            }

            th, td {
                font-size: 14px;
                padding: 10px;
            }

            .add-btn {
                display: block;
                width: 100%;
                text-align: center;
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
    <div class="dark-mode-toggle">
        <label class="switch">
            <input type="checkbox" id="modeToggle" onchange="toggleDarkMode()">
            <span class="slider"></span>
        </label>
    </div>

    <div class="container-box">
        <h2>Student List</h2>
        <a href="add.jsp" class="add-btn">Add New Student</a>

        <table class="table">
            <thead>
                <tr>
                    <th>ID</th><th>Name</th><th>Email</th><th>Department</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Employee> list = EmployeeDAO.getAllEmployees();
                    for(Employee e : list){
                %>
                <tr>
                    <td><%= e.getId() %></td>
                    <td><%= e.getName() %></td>
                    <td><%= e.getEmail() %></td>
                    <td><%= e.getDepartment() %></td>
                    <td>
                        <a href="edit.jsp?id=<%= e.getId() %>" class="edit-btn">Edit</a>
                        <a href="DeleteEmployeeServlet?id=<%= e.getId() %>" class="delete-btn" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
