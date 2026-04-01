<%@page import="java.sql.*"%>
<%@page import="com.HospitalManagementSystem.dao.DoctorDAO"%>
<%@page import="com.HospitalManagementSystem.dao.AppointmentDAO"%>

<%
if(session.getAttribute("doctorid") == null){
    response.sendRedirect("doctor_login.jsp");
    return;
}

int doctorid = (int) session.getAttribute("doctorid");

ResultSet rs = DoctorDAO.getDoctorById(doctorid);
%>

<!DOCTYPE html>
<html>
<head>
<title>Doctor Profile</title>

<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body{ background:#f1f3f5; }
.card{ border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.1); }
</style>

</head>

<body>

<div class="container mt-5">

<%
if(rs.next()){
%>

<!-- ? PROFILE SECTION -->
<div class="card p-4 mb-4">

<h3 class="text-center mb-4">My Profile</h3>

<form action="../UpdateDoctorServlet" method="post">

<input type="hidden" name="doctor_id" value="<%=doctorid%>">

<div class="form-group">
<label>Full Name</label>
<input type="text" name="fullname" class="form-control"
value="<%=rs.getString("fullname")%>">
</div>

<div class="form-group">
<label>Email</label>
<input type="email" name="email" class="form-control"
value="<%=rs.getString("email")%>">
</div>

<div class="form-group">
<label>Phone</label>
<input type="text" name="phone" class="form-control"
value="<%=rs.getString("phone")%>">
</div>

<div class="form-group">
<label>Experience</label>
<input type="text" name="experiance" class="form-control"
value="<%=rs.getString("experience")%>">
</div>

<div class="form-group">
<label>Address</label>
<textarea name="address" class="form-control"><%=rs.getString("address")%></textarea>
</div>

<button class="btn btn-success btn-block">Update Profile</button>

</form>

</div>

<%
}
%>

<!-- ? PATIENT REPORT SECTION -->

<div class="card p-4">

<h4 class="mb-3">Patient Report</h4>

<form method="get" class="mb-4">
    <div class="row">
        <div class="col-md-4">
            <input type="date" name="from" class="form-control" required>
        </div>
        <div class="col-md-4">
            <input type="date" name="to" class="form-control" required>
        </div>
        <div class="col-md-4">
            <button class="btn btn-primary btn-block">Search</button>
        </div>
    </div>
</form>

<%
String from = request.getParameter("from");
String to = request.getParameter("to");

if(from != null && to != null){

    ResultSet rs2 = AppointmentDAO.getPatientsByDate(doctorid, from, to);

    int count = 0;
%>

<table class="table table-bordered">
<tr>
<th>Sr.No</th>
<th>Patient Name</th>
<th>Date</th>
</tr>

<%
    int i = 1;
    while(rs2.next()){
        count++;
%>

<tr>
<td><%=i++%></td>
<td><%=rs2.getString("fullname")%></td>
<td><%=rs2.getString("appointment_date")%></td>
</tr>

<%
    }
%>

</table>

<h5 class="text-success">Total Patients: <%=count%></h5>

<%
}
%>

</div>

</div>

</body>
</html>