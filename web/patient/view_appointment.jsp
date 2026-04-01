<%@page import="com.HospitalManagementSystem.util.DbConnection,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>View Appointment</title>

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
            background:#343a40;
            color:white;
        }

        .badge-pending{
            background:orange;
            color:white;
        }

        .badge-approved{
            background:green;
            color:white;
        }

        .badge-cancelled{
            background:red;
            color:white;
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

            <table class="table table-bordered table-hover text-center">
                <tr>
                    <th>Sr.No</th>
                    <th>Doctor Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Symptoms</th>
                    <th>Status</th>
                    
                </tr>

                <%
                int patientid = (int) session.getAttribute("patientid");

                Connection con = DbConnection.getConnection();

                String qry = "select d.fullname, a.appointment_date, a.appointment_time,a.symptoms, a.status from appointment a JOIN doctor d on a.doctor_id = d.doctor_id where a.patient_id = ?";

                PreparedStatement pstmt = con.prepareStatement(qry);
                pstmt.setInt(1, patientid);

                ResultSet rs = pstmt.executeQuery();
                int count=1;

                while(rs.next())
                {
                %>  
                <tr>
                    <td><%= count++ %></td>
                    <td><%=rs.getString("fullname")%></td>
                    <td><%=rs.getString("appointment_date")%></td>
                    <td><%=rs.getString("appointment_time")%></td>
                    <td><%=rs.getString("symptoms")%></td>
                    
                    <td>
                        <%
                        String status = rs.getString("status");

                        if("Pending".equalsIgnoreCase(status)){
                        %>
                            <span class="badge badge-warning">Pending</span>
                        <%
                        } else if("Approved".equalsIgnoreCase(status)){
                        %>
                            <span class="badge badge-success">Approved</span>
                        <%
                        } else {
                        %>
                            <span class="badge badge-danger">Cancelled</span>
                        <%
                        }
                        %>
                    </td>
                </tr>
                <% } %>

            </table>

            <div class="text-center mt-3">
                <small>Patient ID: <%= patientid %></small>
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


              
