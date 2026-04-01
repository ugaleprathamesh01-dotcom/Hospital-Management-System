
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
if(session.getAttribute("doctorid") == null){
    response.sendRedirect("doctor_login.jsp");
    return;
}

// appointment id URL मधून घे
int appointment_id = Integer.parseInt(request.getParameter("aid"));
int doctor_id = (int) session.getAttribute("doctorid");
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Prescription</title>

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
</style>

</head>

<body>

<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-6">

<div class="card">

<div class="card-header bg-primary text-white text-center">
<h4>Add Prescription</h4>
</div>

<div class="card-body">

<!-- ✅ FORM -->
<form action="../AddPrescriptionServlet" method="post">

<!-- hidden fields -->
<input type="hidden" value="<%= request.getParameter("aid") %>"name="appointment_id" >
<input type="hidden" name="doctor_id" value="<%=doctor_id%>">

<div class="form-group">
<label>Diagnosis</label>
<input type="text" name="diagnosis" class="form-control" required>
</div>

<div class="form-group">
<label>Medicines</label>
<textarea name="medicines" class="form-control" rows="3" required></textarea>
</div>

<div class="form-group">
<label>Dosage</label>
<textarea name="dosage" class="form-control" rows="2" required></textarea>
</div>

<div class="form-group">
<label>Notes</label>
<textarea name="notes" class="form-control" rows="2"></textarea>
</div>

<button type="submit" class="btn btn-success btn-block">
💊 Save Prescription
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