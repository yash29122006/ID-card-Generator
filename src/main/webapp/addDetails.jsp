
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background: white;
        margin: 0;
        padding: 40px 0;
    }

    .center-box {
        background: #ffffff;
        width: 650px;
        margin: auto;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 12px 30px rgba(0,0,0,0.25);
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
        color: #2c3e50;
    }

    h2 {
        margin-top: 25px;
        margin-bottom: 15px;
        color: #11998e;
        border-bottom: 2px solid #eee;
        padding-bottom: 5px;
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

    input:focus, select:focus {
        outline: none;
        border-color: #11998e;
    }

    select {
        background-color: #fff;
    }

    .buttons {
        margin-top: 30px;
        text-align: center;
    }

    .buttons button {
        padding: 10px 22px;
        border: none;
        border-radius: 6px;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        margin: 0 10px;
    }

    .save {
        background: #1BB325;
        color: #fff;
    }

    .save:hover {
        background: #068C0D;
    }

    .buttons button[type="button"] {
        background: #FF2B00;
        color: #fff;
    }

    .buttons button[type="button"]:hover {
        background: #C72300;
    }

    .error {
        color: red;
        text-align: center;
        margin-bottom: 15px;
        font-weight: bold;
    }

    @media (max-width: 720px) {
        .center-box {
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

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p class="error"><%= error %></p>
<%
    }
%>

<div class="center-box">

    <h1>Add Student</h1>

    <form action="SaveStudent" method="post">

        <h2>Personal Details</h2>

        <label>ID:</label>
        <input type="text" name="id" placeholder="Enter Unique University ID" required><br><br>

        <label>Name:</label>
        <input type="text" name="name" placeholder="Enter your Name" required><br><br>

        <label>Email:</label>
        <input type="email" name="email" placeholder="Enter your Email" required><br><br>

        <label>Mobile Number:</label>
        <input type="text" name="mobile_no" maxlength="15" placeholder="Enter your Phone no." required><br><br>

        <label>Blood Group:</label>
        <select name="blood_group">
            <option value="">Select Blood Group</option>
            <option value="A+">A+</option>
            <option value="A-">A−</option>
            <option value="B+">B+</option>
            <option value="B-">B−</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB−</option>
            <option value="O+">O+</option>
            <option value="O-">O−</option>
        </select><br><br>

        <h2>Academic Details</h2>

        <label>Department:</label>
        <select name="department">
            <option value="">Select Department</option>
            <option value="Computer Engineering">Computer Engineering</option>
            <option value="Mechanical Engineering">Mechanical Engineering</option>
            <option value="Artificial Intelligence & Data Science">Artificial Intelligence & Data Science</option>
            <option value="Artificial Intelligence & Machine Learning">Artificial Intelligence & Machine Learning</option>
            <option value="Civil Engineering">Civil Engineering</option>
            <option value="Information Technology">Information Technology</option>
            <option value="EXTC">EXTC</option>
        </select><br><br>

        <label>Year:</label>
        <select name="year">
            <option value="">Select Year</option>
            <option value="FE">FE</option>
            <option value="SE">SE</option>
            <option value="TE">TE</option>
            <option value="BE">BE</option>
        </select><br><br>

	<label>Division:</label>
	<select name="division" required>
    <option value="">Select Division</option>
    <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="D">D</option>
	</select><br><br>

        <label>Roll Number:</label>
        <input type="number" name="roll_no" placeholder="Enter your Roll Number" required><br><br>

        <h2>Address</h2>

        <label>City:</label>
        <input type="text" name="city" placeholder="Enter City name"><br><br>

        <label>Pincode:</label>
        <input type="text" name="pincode" maxlength="10" placeholder="Enter Pincode"><br><br>

        <label>State:</label>
        <input type="text" name="state" placeholder="Enter State"><br><br>

        <div class="buttons">
            <button type="submit" class="save">Save</button>
            <a href="adminDashboard.jsp">
                <button type="button">Back</button>
            </a>
        </div>

    </form>

</div>

</body>
</html>
