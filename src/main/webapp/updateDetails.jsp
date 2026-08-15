<%@ page import="logic.IdLogic" %>
<%@ page import="model.IdDetails" %>
<%@ page import="javax.servlet.RequestDispatcher" %>

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
<title>Update Student</title>

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background: white;
        margin: 0;
        padding: 30px 0;
    }

    .container {
        background: #ffffff;
        width: 700px;
        margin: auto;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 12px 30px rgba(0,0,0,0.25);
    }

    h2, h3 {
        color: #2c3e50;
        border-bottom: 2px solid #eee;
        padding-bottom: 5px;
        margin-bottom: 15px;
    }

    label {
        display: inline-block;
        width: 180px;
        font-weight: bold;
        color: #333;
    }

    input, select {
        width: 60%;
        padding: 8px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input[readonly] {
        background: #f1f1f1;
    }

    input:focus, select:focus {
        outline: none;
        border-color: #2ebf91;
    }

    .search-box {
        text-align: center;
        margin-bottom: 25px;
    }

    .search-box input {
        width: 220px;
    }

    .search-box button {
        padding: 8px 15px;
        margin-left: 10px;
        border: none;
        background: #8360c3;
        color: #fff;
        border-radius: 5px;
        cursor: pointer;
    }

    .search-box button:hover {
        background: #6c4bb3;
    }

    .error {
        color: red;
        text-align: center;
        font-weight: bold;
        margin-bottom: 15px;
    }

    
.back-btn {
    padding: 10px 28px;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    background: #FF2B00;
    color: #fff;
}

.back-btn:hover {
    background: #C72300;
}
.button-row {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin-top: 30px;
}

.update-btn {
    padding: 10px 28px;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    background: #1BB325;
    color: #fff;
}

.update-btn:hover {
    background: #068C0D;
}


    @media (max-width: 760px) {
        .container {
            width: 90%;
            padding: 25px;
        }

        label {
            width: 100%;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
        }
    }
</style>

</head>
<body>

<div class="container">

<h2>Search Student by ID</h2>

<div class="search-box">
    <form method="get" action="updateDetails.jsp">
        <input type="text" name="searchId" placeholder="Enter Student ID" required>
        <button type="submit">Search</button>
    </form>
</div>

<%
IdDetails student = null;
String id = request.getParameter("searchId");

if (id != null) {
    IdLogic dao = new IdLogic();
    student = dao.getStudentById(id);

    if (student == null) {
%>
        <p class="error">Student not found</p>
<%
    }
}
%>

<% if (student != null) { %>

<h3>Edit Details</h3>

<form action="SaveStudent" method="post">

<input type="hidden" name="action" value="update">

<h2>Personal Details</h2>

<label>ID:</label>
<input type="text" name="id" value="<%= student.getId() %>" readonly><br><br>

<label>Roll No:</label>
<input type="number" name="roll_no" value="<%= student.getRoll_no() %>" readonly><br><br>

<label>Name:</label>
<input type="text" name="name" value="<%= student.getName() %>" required><br><br>

<label>Email:</label>
<input type="email" name="email" value="<%= student.getEmail() %>" required><br><br>

<label>Mobile:</label>
<input type="text" name="mobile_no" value="<%= student.getMobile_no() %>"><br><br>

<label>Blood Group:</label>
<select name="blood_group">
    <option value="">Select Blood Group</option>
    <option value="A+" <%= "A+".equals(student.getBlood_group())?"selected":"" %>>A+</option>
    <option value="A-" <%= "A-".equals(student.getBlood_group())?"selected":"" %>>A-</option>
    <option value="B+" <%= "B+".equals(student.getBlood_group())?"selected":"" %>>B+</option>
    <option value="B-" <%= "B-".equals(student.getBlood_group())?"selected":"" %>>B-</option>
    <option value="AB+" <%= "AB+".equals(student.getBlood_group())?"selected":"" %>>AB+</option>
    <option value="AB-" <%= "AB-".equals(student.getBlood_group())?"selected":"" %>>AB-</option>
    <option value="O+" <%= "O+".equals(student.getBlood_group())?"selected":"" %>>O+</option>
    <option value="O-" <%= "O-".equals(student.getBlood_group())?"selected":"" %>>O-</option>
</select><br><br>

<h2>Academic Details</h2>

<label>Department:</label>
<select name="department">
<option value="">Select Department</option>
<option value="Computer Engineering" <%= "Computer Engineering".equals(student.getDepartment())?"selected":"" %>>Computer Engineering</option>
<option value="Mechanical Engineering" <%= "Mechanical Engineering".equals(student.getDepartment())?"selected":"" %>>Mechanical Engineering</option>
<option value="Artificial Intelligence & Data Science" <%= "Artificial Intelligence & Data Science".equals(student.getDepartment())?"selected":"" %>>AI & DS</option>
<option value="Artificial Intelligence & Machine Learning" <%= "Artificial Intelligence & Machine Learning".equals(student.getDepartment())?"selected":"" %>>AI & ML</option>
<option value="Civil Engineering" <%= "Civil Engineering".equals(student.getDepartment())?"selected":"" %>>Civil Engineering</option>
<option value="Information Technology" <%= "Information Technology".equals(student.getDepartment())?"selected":"" %>>IT</option>
<option value="EXTC" <%= "EXTC".equals(student.getDepartment())?"selected":"" %>>EXTC</option>
</select><br><br>

<label>Year:</label>
<select name="year">
<option value="FE" <%= "FE".equals(student.getYear())?"selected":"" %>>FE</option>
<option value="SE" <%= "SE".equals(student.getYear())?"selected":"" %>>SE</option>
<option value="TE" <%= "TE".equals(student.getYear())?"selected":"" %>>TE</option>
<option value="BE" <%= "BE".equals(student.getYear())?"selected":"" %>>BE</option>
</select><br><br>

<label>Division:</label>
<select name="div" required>
    <option value="">Select Division</option>
    <option value="A" <%= "A".equals(student.getDiv()) ? "selected" : "" %>>A</option>
    <option value="B" <%= "B".equals(student.getDiv()) ? "selected" : "" %>>B</option>
    <option value="C" <%= "C".equals(student.getDiv()) ? "selected" : "" %>>C</option>
    <option value="D" <%= "D".equals(student.getDiv()) ? "selected" : "" %>>D</option>
</select><br><br>
<br><br>

<h2>Address</h2>

<label>City:</label>
<input type="text" name="city" value="<%= student.getCity()==null?"":student.getCity() %>"><br><br>

<label>Pincode:</label>
<input type="number" name="pincode" value="<%= student.getPincode()==0?"":student.getPincode() %>"><br><br>

<label>State:</label>
<input type="text" name="state" value="<%= student.getState()==null?"":student.getState() %>"><br><br>

<div class="button-row">
    <button type="submit" class="update-btn">Update</button>

    <a href="adminDashboard.jsp">
        <button type="button" class="back-btn">Back to Dashboard</button>
    </a>
</div>

</form>

<% } %>



</div>

</body>
</html>