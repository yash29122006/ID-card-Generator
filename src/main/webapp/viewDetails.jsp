
<%@ page import="java.util.List" %>
<%@ page import="logic.IdLogic" %>
<%@ page import="model.IdDetails" %>

<%
String user = (String) session.getAttribute("username");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Students</title>

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #f4f6f9;
        margin: 0;
        padding: 30px;
    }

    h2 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 20px;
    }

    .table-container {
        background: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        min-width: 1000px;
    }

    th, td {
        padding: 10px 12px;
        text-align: center;
        font-size: 14px;
        border-bottom: 1px solid #ddd;
    }

    th {
        background: #2ebf91;
        color: #fff;
        position: sticky;
        top: 0;
        z-index: 1;
    }

    tr:nth-child(even) {
        background: #f9f9f9;
    }

    tr:hover {
        background: #eefaf6;
    }

    .delete-link {
        color: #e74c3c;
        font-weight: bold;
        text-decoration: none;
    }

    .delete-link:hover {
        text-decoration: underline;
    }

    .no-records {
        text-align: center;
        font-weight: bold;
        color: #999;
    }

    .back-btn {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 22px;
        background: #FF2B00;
        color: #fff;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
    }

    .back-btn:hover {
        background: #C72300;
    }
</style>

</head>
<body>

<h2>All Student Details</h2>

<div class="table-container">

<%
IdLogic dao = new IdLogic();
List<IdDetails> list = dao.getAllStudents();

if(list == null || list.size() == 0){
%>
    <p class="no-records">No records found</p>
<%
} else {
%>

<table>

<tr>
    <th>ID</th>
    <th>Roll No</th>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>Department</th>
    <th>Year</th>
    <th>Division</th>
    <th>Blood Group</th>
    <th>City</th>
    <th>Pincode</th>
    <th>State</th>
    <th>Delete</th>
</tr>

<%
for(IdDetails s : list){
%>

<tr>
    <td><%= s.getId() %></td>
    <td><%= s.getRoll_no() %></td>
    <td><%= s.getName() %></td>
    <td><%= s.getEmail() %></td>
    <td><%= s.getMobile_no() %></td>
    <td><%= s.getDepartment() %></td>
    <td><%= s.getYear() %></td>
    <td><%= s.getDiv() %></td>
    <td><%= s.getBlood_group() %></td>
    <td><%= s.getCity() %></td>
    <td><%= s.getPincode() %></td>
    <td><%= s.getState() %></td>

    <td>
        <a class="delete-link"
           href="SaveStudent?action=delete&id=<%= s.getId() %>"
           onclick="return confirm('Are you sure you want to delete this record?');">
           Delete
        </a>
    </td>
</tr>

<%
}
%>

</table>

<%
}
%>

</div>

<a href="adminDashboard.jsp" class="back-btn">Back</a>

</body>
</html>
