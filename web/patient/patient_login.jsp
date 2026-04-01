

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
 if(session.getAttribute("patientid")!=null)
 {
     response.sendRedirect("patient_dashboard.jsp");
     return;
 }
%>

<!DOCTYPE html>
<html>
<head>
<title>Patient Login</title>

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
}
</style>

</head>

<body>

<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-4">

<div class="card">
    
<div class="card-header text-center bg-primary text-white">
<h4>Patient Login</h4>
</div>

<div class="card-body">

<form action="../loginPatientServlet" method="post">

<div class="form-group">
<label>Email</label>
<input type="email" class="form-control" placeholder="Enter email" name="email" required>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" class="form-control" placeholder="Enter Password" name="password" required>
</div>

<button type="submit" class="btn btn-success btn-block">
Login
</button>

</form>

<div class="text-center mt-3">
<small>New Patient? <a href="patient_register.jsp">Register Here</a></small>
</div>

</div>

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
