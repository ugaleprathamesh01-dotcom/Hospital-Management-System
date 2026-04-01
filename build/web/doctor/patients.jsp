<%@page import="java.sql.*"%>
<%@page import="com.HospitalManagementSystem.dao.AppointmentDAO"%>

<%
if(session.getAttribute("doctorid") == null){
    response.sendRedirect("doctor_login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>My Patients</title>

<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body{ background:#f1f3f5; }
.card{ border:none; border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.1); }
.table th{ background:#007bff; color:white; text-align:center; }
.table td{ text-align:center; }
</style>

</head>

<body>

<div class="container mt-5">
<div class="card">

<div class="card-header bg-primary text-white text-center">
<h4>My Patients</h4>
</div>

<div class="card-body">

<table class="table table-bordered table-hover">

<tr>
<th>Sr.No</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
</tr>

<%
int doctorid = (int) session.getAttribute("doctorid");

ResultSet rs = AppointmentDAO.getPatientsByDoctor(doctorid);

int count = 1;

while(rs.next()){
%>

<tr>
<td><%=count++%></td>
<td><%=rs.getString("fullname")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("phone")%></td>
</tr>

<%
}
%>

</table>

</div>
</div>
</div>

</body>
</html>