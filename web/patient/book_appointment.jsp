


<%@page import="com.HospitalManagementSystem.util.DbConnection,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Book Appointment</title>

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
<div class="col-md-6">

<div class="card">

<div class="card-header bg-primary text-white text-center">
<h4>Book Appointment</h4>
</div>

<div class="card-body">

<form action="../BookAppointmentServlet" method="post">

<div class="form-group">
<label>Select Doctor</label>
<select class="form-control"  name="doctor_id" required,>
    
<option value="">-- Select Doctor --</option>
<%
  Connection con = DbConnection.getConnection();
  String qry ="select doctor_id,fullname from doctor";
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(qry);
   while(rs.next())
   {
%> <option value="<%=rs.getInt("doctor_id")%>"><%=rs.getString("fullname")%></option><%
   }
%>
</select>
</div>

<div class="form-group">
<label>Date</label>
<input type="date" class="form-control" name="appointment_date" required>
</div>

<div class="form-group">
<label>Time</label>
<input type="time" class="form-control" name="appointment_time" required>
</div>

<div class="form-group">
<label>Symptoms</label>
<textarea class="form-control" name="symptoms" rows="3"></textarea>
</div>

<button type="submit" class="btn btn-success btn-block">
Book Appointment
</button>

</form>

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

