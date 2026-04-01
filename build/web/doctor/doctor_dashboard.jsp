<%
    if(session.getAttribute("doctorid")== null)
    {
        response.sendRedirect("doctor_login.jsp");
        return;
    }
%>
<%
/* 🔥 Cache Disable */
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);

/* 🔐 Session Check */
if(session.getAttribute("doctorid") == null){
    response.sendRedirect("doctor_login.jsp");
    return;
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Dashboard</title>

    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body{
            background:#f1f3f5;
        }

        .navbar{
            background:#007bff;
        }

        .navbar-brand, .nav-link{
            color:white !important;
        }

        .card{
            border:none;
            border-radius:10px;
            box-shadow:0 4px 15px rgba(0,0,0,0.1);
        }

        .welcome-box{
            background:#28a745;
            color:white;
            padding:20px;
            border-radius:10px;
        }

        .dashboard-card{
            transition:0.3s;
        }

        .dashboard-card:hover{
            transform:translateY(-5px);
        }
    </style>
</head>

<body>

<%
    String fullname = (String) session.getAttribute("fullname");
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">Doctor Panel</a>
    
    <div class="ml-auto">
        <a href="doctor_logout.jsp" class="btn btn-danger btn-sm">Logout</a>
    </div>
</nav>

<div class="container mt-4">

    <!-- Welcome Section -->
    <div class="welcome-box text-center mb-4">
        <h3>Welcome Doctor <%=fullname%> 👨‍⚕️</h3>
        <p>Manage your appointments and patients easily</p>
    </div>

    <!-- Dashboard Cards -->
    <div class="row">

        <div class="col-md-4 mb-3">
            <div class="card dashboard-card p-4 text-center">
                <h5>📅 View Appointments</h5>
                <p>Check all your scheduled appointments</p>
                <a href="view_appointments.jsp" class="btn btn-primary">
                    View
                </a>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card dashboard-card p-4 text-center">
                <h5>👨‍👩‍👧 Patients</h5>
                <p>View patient details and history</p>
                <a href="patients.jsp" class="btn btn-primary">
                    View
                </a>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card dashboard-card p-4 text-center">
                <h5>⚙️ Profile</h5>
                <p>Manage your personal information</p>
                <a href="profile.jsp" class="btn btn-primary">
                    Edit
                </a>
            </div>
        </div>

    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

