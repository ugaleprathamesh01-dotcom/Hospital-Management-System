
package com.HospitalManagementSystem.dao;

import com.HospitalManagementSystem.util.DbConnection;
import java.sql.*;


public class AppointmentDAO {
    
    public static boolean bookAppointment (int doctorid,int patientid, String date,String time,String symptoms)
    {  
        try{
       Connection con = DbConnection.getConnection();
       String qry = "insert into appointment(doctor_id,patient_id,appointment_date, appointment_time,symptoms) values(?,?,?,?,?)";
       
        PreparedStatement pstmt =  con.prepareStatement(qry);
        pstmt.setInt(1, doctorid);
        pstmt.setInt(2, patientid);
        pstmt.setString(3, date);
        pstmt.setString(4, time);
        pstmt.setString(5, symptoms);
      int row =  pstmt.executeUpdate();
      
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
       public static ResultSet getAppointmentsByDoctor(int doctorid)
       {   
           ResultSet rs = null;
           try{
               Connection con = DbConnection.getConnection();
               String qry = "select a.appointment_id, p.fullname, a.appointment_date, a.appointment_time, a.symptoms, a.status  " +
                         "FROM appointment a JOIN patient p ON a.patient_id = p.patient_id WHERE a.doctor_id=?";
               
               PreparedStatement pstmt = con.prepareStatement(qry);
               pstmt.setInt(1, doctorid);
               
               rs = pstmt.executeQuery();
               return rs;
           }
           catch(Exception e)
           {
               e.printStackTrace();
           }
           return rs;
       }
       
         public static boolean updateStatus(int appointment_id)
{
    try{
        Connection con = DbConnection.getConnection();

        String qry = "UPDATE appointment SET status='Approved' WHERE appointment_id=?";

        PreparedStatement pstmt = con.prepareStatement(qry);
        pstmt.setInt(1, appointment_id);

        int row = pstmt.executeUpdate();

        return row > 0;

    }catch(Exception e){
        e.printStackTrace();
    }

    return false;
}

   public static int getPatientIdByAppointment(int appointment_id)
{
    int patient_id = 0;

    try{
        Connection con = DbConnection.getConnection();

        String qry = "SELECT patient_id FROM appointment WHERE appointment_id=?";

        PreparedStatement pstmt = con.prepareStatement(qry);
        pstmt.setInt(1, appointment_id);

        ResultSet rs = pstmt.executeQuery();

        if(rs.next()){
            patient_id = rs.getInt("patient_id");
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return patient_id;
}
   
     public static ResultSet getPatientsByDate(int doctorid, String from, String to)
{
    ResultSet rs = null;

    try{
        Connection con = DbConnection.getConnection();

        String qry = "SELECT DISTINCT p.fullname, a.appointment_date " +
                     "FROM appointment a " +
                     "JOIN patient p ON a.patient_id = p.patient_id " +
                     "WHERE a.doctor_id=? AND a.appointment_date BETWEEN ? AND ?";

        PreparedStatement pstmt = con.prepareStatement(qry);
        pstmt.setInt(1, doctorid);
        pstmt.setString(2, from);
        pstmt.setString(3, to);

        rs = pstmt.executeQuery();

    }catch(Exception e){
        e.printStackTrace();
    }

    return rs;
}
     public static ResultSet getPatientsByDoctor(int doctorid)
{
    ResultSet rs = null;

    try{
        Connection con = DbConnection.getConnection();

        String qry = "SELECT DISTINCT p.patient_id, p.fullname, p.email, p.phone " +
                     "FROM appointment a " +
                     "JOIN patient p ON a.patient_id = p.patient_id " +
                     "WHERE a.doctor_id=?";

        PreparedStatement pstmt = con.prepareStatement(qry);
        pstmt.setInt(1, doctorid);

        rs = pstmt.executeQuery();

    }catch(Exception e){
        e.printStackTrace();
    }

    return rs;
}
 }

