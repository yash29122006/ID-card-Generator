
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

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

    .dashboard {
        background: #ffffff;
        width: 360px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 12px 30px rgba(0,0,0,0.25);
        text-align: center;
    }

    h2 {
        margin-bottom: 25px;
        color: #333;
    }

    .error {
        color: red;
        margin-bottom: 15px;
        font-size: 14px;
    }

    .dashboard a {
        text-decoration: none;
    }

    .dashboard button {
        width: 100%;
        padding: 12px;
        margin-bottom: 15px;
        border: none;
        border-radius: 6px;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        background: #005157;
        color: #fff;
        transition: background 0.3s ease;
    }

    .dashboard button:hover {
        background: #083F45;
    }

    .logout-btn {
        background: #FF2B00 !important;
    }

    .logout-btn:hover {
        background: #C72300 !important;
    }
</style>

</head>
<body>

<%
    String user = (String) session.getAttribute("username");

    if (user == null) {
        request.setAttribute("error", "Session expired");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
        return;
    }
%>

<div class="dashboard">

    <h2>Admin Dashboard</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <%
        }
    %>

    <a href="addDetails.jsp">
        <button>Add Details</button>
    </a>

    <a href="updateDetails.jsp">
        <button>Edit Details</button>
    </a>

    <a href="viewDetails.jsp">
        <button>View Details</button>
    </a>

    <a href="logout">
        <button type="button" class="logout-btn">Logout</button>
    </a>

</div>

</body>
</html>
