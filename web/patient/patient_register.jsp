
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Patient Registration</title>

<!-- Bootstrap 4 CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    body{
    background:#f1f3f5; 
    }
</style>

</head>

<body>

<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-6">

<div class="card">
<div class="card-header text-center bg-primary text-white">
<h4>Patient Registration</h4>
</div>

<div class="card-body">

<form action="../registerPatientServlet" method="post">

<div class="form-group">
<label>Full Name</label>
<input type="text" class="form-control" placeholder="Enter full name" name="fullname" required>
</div>

<div class="form-group">
<label>Email</label>
<input type="email" class="form-control" placeholder="Enter email" name="email" required>
</div>

<div class="form-group">
<label>Phone</label>
<input type="text" class="form-control" placeholder="Enter phone number" name="phone" required>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" class="form-control" placeholder="Enter password" name="password" required>
</div>

<div class="form-group">
<label>Gender</label><br>

<div class="form-check form-check-inline">
<input class="form-check-input" type="radio" name="gender" value="Male">
<label class="form-check-label">Male</label>
</div>

<div class="form-check form-check-inline">
<input class="form-check-input" type="radio" name="gender" value="Female">
<label class="form-check-label">Female</label>
</div>

<div class="form-check form-check-inline">
<input class="form-check-input" type="radio" name="gender" value="Other">
<label class="form-check-label">Other</label>
</div>

</div>

<div class="form-group">
<label>Age</label>
<input type="number" class="form-control" placeholder="Enter age" name="age">
</div>

<div class="form-group">
<label>Blood Group</label>
<select class="form-control" name="blood_group">
<option value="">Select Blood Group</option>
<option>A+</option>
<option>A-</option>
<option>B+</option>
<option>B-</option>
<option>AB+</option>
<option>AB-</option>
<option>O+</option>
<option>O-</option>
</select>
</div>

<div class="form-group">
<label>Address</label>
<textarea class="form-control" name="address" rows="3"></textarea>
</div>

<button type="submit" class="btn btn-success btn-block">
Register Patient
</button>

</form>

</div>
</div>

</div>
</div>
</div>

<!-- Bootstrap 4 JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>