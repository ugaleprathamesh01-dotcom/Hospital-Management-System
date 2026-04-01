

<%@page import="com.HospitalManagementSystem.util.DbConnection,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>View Doctors</title>

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

.table th{
    background:#007bff;
    color:white;
    text-align:center;
}

.table td{
    text-align:center;
}

.doctor-icon{
    font-size:22px;
    color:#007bff;
}
</style>

</head>

<body>

<div class="container mt-5">

    <div class="card">
        
        <div class="card-header bg-primary text-white text-center">
            <h4>Doctor List</h4>
        </div>

        <div class="card-body">

            <table class="table table-bordered table-hover">
                
                <tr>
                    <th>Sr.No</th>
                    <th>Doctor Name</th>
                    <th>Specilization</th>
                    <th>Contact</th>
                </tr>

                <%
                Connection con = DbConnection.getConnection();

                String qry = "SELECT d.fullname, d.phone, dep.dept_name " +
                             "FROM doctor d JOIN department dep ON d.dept_id = dep.dept_id";

                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(qry);

                int count = 1;

                while(rs.next()){
                %>

                <tr>
                    <td><%=count++%></td>

                    <td>
                       
                        <%=rs.getString("fullname")%>
                        
                    </td>

                    <td>
                        <%=rs.getString("dept_name")%>
                    </td>

                    <td>
                        <%=rs.getString("phone")%>
                    </td>
                </tr>

                <% } %>

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

