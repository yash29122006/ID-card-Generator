<%@ page import="model.IdDetails" %>
<%
    IdDetails s = (IdDetails) request.getAttribute("studentData");
    if (s == null) {
%>
<h3>No data found</h3>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

<style>
    :root {
        --card-width: 420px;
        --card-height: 290px;
        --pink-main: #ff3f7a;
        --pink-light: #fff1f6;
    }

    body {
        font-family: "Segoe UI", Tahoma, sans-serif;
        background: white;
        margin: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 30px 0;
    }

    h2 {
        margin-bottom: 30px;
        color: #d81b60;
        font-weight: 700;
    }

    .card-row {
        display: flex;
        gap: 40px;
        justify-content: center;
        flex-wrap: wrap;
        margin-bottom: 40px;
    }

    .id-card {
        width: var(--card-width);
        height: var(--card-height);
        background: var(--pink-light);
        border-radius: 16px;
        border: 2px solid #ff4f86;
        box-shadow: 0 14px 30px rgba(0,0,0,0.15);
        overflow: hidden;
        display: flex;
        flex-direction: column;
    }

    .card-header {
        background: var(--pink-main);
        color: #fff;
        text-align: center;
        padding: 16px;
        font-size: 18px;
        font-weight: 700;
        letter-spacing: 1px;
    }

    .card-body-front {
        display: flex;
        gap: 16px;
        padding: 18px 20px;
        flex: 1;
    }

    .profile-placeholder {
        width: 110px;
        height: 130px;
        background: #e0e0e0;
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .profile-placeholder img {
        width: 70px;
        opacity: 0.5;
    }

    .id-details {
        font-size: 14px;
        line-height: 1.6;
    }

    .id-label {
        font-weight: 600;
        color: #333;
    }

    .card-footer {
        height: 65px;             
        background: #ffd6e4;
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
        padding: 12px 22px 10px;
    }

    .signature-box {
        text-align: center;
        width: 45%;
    }

    .signature-line {
        border-top: 1.5px solid #333;
        width: 120px;
        margin: 0 auto 6px;    
    }

    .signature-text {
        font-size: 12px;
        font-weight: 600;
        color: #333;
    }

    .card-body-back {
        padding: 16px 20px;
        flex: 1;
        font-size: 13px;
    }

    .section-title {
        font-weight: 700;
        color: #d81b60;
        margin: 10px 0 6px;
        font-size: 12px;
        text-transform: uppercase;
    }

    .field {
        display: flex;
        justify-content: space-between;
        padding: 6px 0;
        border-bottom: 1px dashed #e0e0e0;
    }

    .field:last-child {
        border-bottom: none;
    }

    .label {
        font-weight: 600;
        color: #444;
    }

    .value {
        color: #222;
        max-width: 60%;
        text-align: right;
        word-break: break-word;
    }

    .logout a {
        display: inline-block;
        padding: 14px 40px;
        background: #ff1744;
        color: white;
        text-decoration: none;
        border-radius: 30px;
        font-weight: 600;
    }

    .logout a:hover {
        background: #c4001d;
    }

    @media (max-width: 950px) {
        .card-row {
            flex-direction: column;
        }
    }
    
    .download a {
    display: inline-block;
    padding: 14px 40px;
    background: #2ebf91;  
    color: white;
    text-decoration: none;
    border-radius: 30px;
    font-weight: 600;
}

.download a:hover {
    background: #239974;
}

.button-row {
    display: flex;
    gap: 20px;
    justify-content: center;
    margin-top: 20px;
}
</style>
</head>

<body>

<h2>Student Dashboard</h2>

<div class="card-row">

    <!-- FRONT CARD -->
    <div class="id-card">
        <div class="card-header">STUDENT IDENTITY CARD</div>

        <div class="card-body-front">
            <div class="profile-placeholder">
                <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png">
            </div>

            <div class="id-details">
                <div><span class="id-label">Name:</span> <%= s.getName() %></div>
                <div><span class="id-label">Roll No:</span> <%= s.getRoll_no() %></div>
                <div><span class="id-label">Department:</span> <%= s.getDepartment() %></div>
                <div><span class="id-label">Year:</span> <%= s.getYear() %></div>
                <div><span class="id-label">Division:</span> <%= s.getDiv() %></div>
                <div><span class="id-label">Blood Group:</span> <%= s.getBlood_group() %></div>
            </div>
        </div>

        <div class="card-footer">
            <div class="signature-box">
                <div class="signature-line"></div>
                <div class="signature-text">Student Signature</div>
            </div>
            <div class="signature-box">
                <div class="signature-line"></div>
                <div class="signature-text">Authority Signature</div>
            </div>
        </div>
    </div>

    <!-- BACK CARD -->
    <div class="id-card">
        <div class="card-header">STUDENT DETAILS</div>

        <div class="card-body-back">
            <div class="section-title">Personal Details</div>
            <div class="field"><span class="label">ID</span><span class="value"><%= s.getId() %></span></div>
            <div class="field"><span class="label">Email</span><span class="value"><%= s.getEmail() %></span></div>
            <div class="field"><span class="label">Mobile</span><span class="value"><%= s.getMobile_no() %></span></div>

            <div class="section-title">Address Details</div>
            <div class="field"><span class="label">City</span><span class="value"><%= s.getCity() %></span></div>
            <div class="field"><span class="label">State</span><span class="value"><%= s.getState() %></span></div>
            <div class="field"><span class="label">Pincode</span><span class="value"><%= s.getPincode() %></span></div>
        </div>
    </div>

</div>

<div class="button-row">

    <div class="logout">
        <a href="logout">Logout</a>
    </div>

    <div class="download">
        <a href="${pageContext.request.contextPath}/downloadIdCard">
            Download ID Details
        </a>
    </div>

</div>

</body>
</html>
