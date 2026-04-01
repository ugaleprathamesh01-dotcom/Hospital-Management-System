

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
 if(session.getAttribute("patientid")==null)
 {
     response.sendRedirect("patient_login.jsp");
     return;
 }
%> 
<%
/* 🔥 Cache Disable logout kelavar back button ne dashboard open hota asel tar: */
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);

/* 🔐 Session Check */
if(session.getAttribute("patientid") == null){
    response.sendRedirect("patient_login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patient Dashboard</title>

<!-- Bootstrap 4 CSS -->
<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body{
    background:#f1f3f5;
}

.card{
    border:none;
    border-radius:10px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}

.dashboard-header{
    background:#007bff;
    color:white;
    padding:15px;
    border-radius:10px;
}

a{
    text-decoration:none;
}
</style>

</head>

<body>

<div class="container mt-5">

    <!-- Header -->
    <div class="dashboard-header text-center mb-4">
        <h3>Hello <%= session.getAttribute("fullname")%> 👋</h3>
        <p>Welcome To Your Dashboard</p>
    </div>

    <!-- Cards Section -->
    <div class="row">

        <div class="col-md-3 mb-3">
            <a href="book_appointment.jsp">
                <div class="card text-center p-4">
                    <h5>📅</h5>
                    <h6>Book Appointment</h6>
                </div>
            </a>
        </div>

        <div class="col-md-3 mb-3">
            <a href="view_appointment.jsp">
                <div class="card text-center p-4">
                    <h5>📋</h5>
                    <h6>View Appointment</h6>
                </div>
            </a>
        </div>

        <div class="col-md-3 mb-3">
            <a href="view_doctor.jsp">
                <div class="card text-center p-4">
                    <h5>👨‍⚕️</h5>
                    <h6>View Doctors</h6>
                </div>
            </a>
        </div>

        <div class="col-md-3 mb-3">
            <a href="patient_logout.jsp">
                <div class="card text-center p-4 bg-danger text-white">
                    <h5>🚪</h5>
                    <h6>Logout</h6>
                </div>
            </a>
        </div>
        
         <div class="col-md-3 mb-3">
            <a href="view_prescription.jsp">
                <div class="card text-center p-4">
                    <h6>View Prescription</h6>
                </div>
            </a>
        </div>

    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

