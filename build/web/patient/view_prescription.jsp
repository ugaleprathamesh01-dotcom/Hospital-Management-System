<%@page import="java.sql.*"%>
<%@page import="com.HospitalManagementSystem.dao.PrescriptionDAO"%>

<%
if(session.getAttribute("patientid") == null){
    response.sendRedirect("patient_login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>My Prescriptions</title>

<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body{ background:#f1f3f5; }
.card{ border:none; border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.1); }
.table th{ background:#28a745; color:white; text-align:center; }
.table td{ text-align:center; }
</style>

</head>

<body>

<div class="container mt-5">
<div class="card">

<div class="card-header bg-success text-white text-center">
<h4>My Prescriptions</h4>
</div>

<div class="card-body">

<table class="table table-bordered table-hover">

<tr>
<th>Sr.No</th>
<th>Doctor</th>
<th>Date</th>
<th>Diagnosis</th>
<th>Medicines</th>
<th>Dosage</th>
<th>Notes</th>
</tr>

<%
int patientid = (int) session.getAttribute("patientid");

ResultSet rs = PrescriptionDAO.getPrescriptionByPatient(patientid);

int count = 1;

while(rs.next()){
%>

<tr>
<td><%=count++%></td>
<td><%=rs.getString("doctor_name")%></td>
<td><%=rs.getString("appointment_date")%></td>
<td><%=rs.getString("diagnosis")%></td>
<td><%=rs.getString("medicines")%></td>
<td><%=rs.getString("dosage")%></td>
<td><%=rs.getString("notes")%></td>
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