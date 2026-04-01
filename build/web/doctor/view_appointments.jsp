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
<title>Doctor Appointments</title>

<!-- Bootstrap 4 -->
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

.table th{
    background:#007bff;
    color:white;
    text-align:center;
}

.table td{
    text-align:center;
    vertical-align: middle !important;
}
</style>

</head>

<body>

<div class="container mt-5">
<div class="card">

<div class="card-header bg-primary text-white text-center">
<h4>My Appointments</h4>
</div>

<div class="card-body">

<table class="table table-bordered table-hover">

<!-- ? TABLE HEADER -->
<thead>
<tr>
    <th>Sr.No</th>
    <th>ID</th>
    <th>Patient Name</th>
    <th>Date</th>
    <th>Time</th>
    <th>Symptoms</th>
    <th>Status</th>
    <th>Action</th>
</tr>
</thead>

<tbody>

<%
int doctorid = (int) session.getAttribute("doctorid");
ResultSet rs = AppointmentDAO.getAppointmentsByDoctor(doctorid);

int count = 1;

if(rs != null){
while(rs.next()){
%>

<tr>
    <td><%=count++%></td>
    <td><%= rs.getInt("appointment_id") %></td>
    <td><%= rs.getString("fullname") %></td>
    <td><%= rs.getString("appointment_date") %></td>
    <td><%= rs.getString("appointment_time") %></td>
    <td><%= rs.getString("symptoms") %></td>

    <!-- ? STATUS COLOR -->
    <td>
        <%
        String status = rs.getString("status");

        if("Pending".equalsIgnoreCase(status)){
        %>
            <span class="badge badge-warning p-2">Pending</span>
        <%
        } else if("Approved".equalsIgnoreCase(status)){
        %>
            <span class="badge badge-success p-2">Approved</span>
        <%
        } else {
        %>
            <span class="badge badge-danger p-2">Cancelled</span>
        <%
        }
        %>
    </td>

    <!-- ? ACTION BUTTON -->
    <td>
        <a href="add_prescription.jsp?aid=<%= rs.getInt("appointment_id") %>"class="btn btn-sm btn-primary">Prescription </a>
    </td>
</tr>

<%
}
}else{
%>

<tr>
    <td colspan="8">No Appointments Found</td>
</tr>

<%
}
%>

</tbody>

</table>

</div>
</div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>