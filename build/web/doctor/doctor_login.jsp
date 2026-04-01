<%
    if(session.getAttribute("doctorid")!= null)
    {
        response.sendRedirect("doctor_dashboard.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html>
<head>
<title>Doctor Login</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap 4 CSS -->
<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body{
    background:#f1f3f5;
}

/* Login Card */
.login-card{
    border:none;
    border-radius:10px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

/* Header */
.login-header{
    background:#007bff;
    color:white;
    padding:15px;
    border-radius:10px 10px 0 0;
}

/* Button */
.btn-login{
    background:#28a745;
    color:white;
}

.btn-login:hover{
    background:#218838;
}
</style>

</head>

<body>

<div class="container">

    <div class="row justify-content-center align-items-center" style="height:100vh;">

        <div class="col-md-4">

            <div class="card login-card">

                <div class="login-header text-center">
                    <h4>Doctor Login</h4>
                </div>

                <div class="card-body">

                    <form action="../LoginDoctorServlet" method="post">

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                        </div>

                        <button type="submit" class="btn btn-login btn-block">
                            Login
                        </button>

                    </form>

                </div>

                <div class="text-center mb-3">
                    <small>© 2026 Hospital System</small>
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


