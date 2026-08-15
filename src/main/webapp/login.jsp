<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background: white;
        height: 100vh;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .login-box {
        background: #ffffff;
        padding: 30px 35px;
        width: 320px;
        border-radius: 10px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .role-select {
        text-align: center;
        margin-bottom: 20px;
    }

    .role-select label {
        margin: 0 10px;
        font-weight: bold;
        cursor: pointer;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-size: 14px;
        color: #444;
    }

    input[type="text"],
    input[type="password"] {
        width: 93%;
        padding: 8px 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input:focus {
        outline: none;
        border-color: #667eea;
    }

    button {
        width: 100%;
        padding: 10px;
        background: #667eea;
        border: none;
        border-radius: 5px;
        color: #fff;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
    }

    button:hover {
        background: #5a67d8;
    }

    .error {
        color: red;
        text-align: center;
        margin-bottom: 15px;
        font-size: 14px;
    }
</style>

</head>
<body>

<div class="login-box">

    <h2>Login</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <%
        }
    %>

    <form action="login" method="post">

        <div class="role-select">
            <label>
                <input type="radio" name="role" value="student" checked
                       onclick="toggleLogin('student')">
                Student
            </label>

            <label>
                <input type="radio" name="role" value="admin"
                       onclick="toggleLogin('admin')">
                Admin
            </label>
        </div>

        <div id="studentDiv">
            <label>ID</label>
            <input type="text" name="id">

            <label>Password</label>
            <input type="password" name="studentPassword">

            <button type="submit">Login</button>
        </div>

        <div id="adminDiv" style="display:none;">
            <label>Username</label>
            <input type="text" name="username">

            <label>Password</label>
            <input type="password" name="adminPassword">

            <button type="submit">Login</button>
        </div>

    </form>

</div>

<script>
    function toggleLogin(type) {
        document.getElementById("studentDiv").style.display =
            (type === 'student') ? "block" : "none";

        document.getElementById("adminDiv").style.display =
            (type === 'admin') ? "block" : "none";
    }

    window.onload = function () {
        toggleLogin('student');
    };
</script>

</body>
</html>