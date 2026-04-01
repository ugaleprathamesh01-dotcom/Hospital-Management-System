
package com.HospitalManagementSystem.dao;

import com.HospitalManagementSystem.model.Doctor;
import com.HospitalManagementSystem.util.DbConnection;

import java.sql.*;

public class DoctorDAO {
    
    // instace of writen public static void we can write Doctor instance of void because we are create obj of Doctor.

   
    public static Doctor loginDoctor(String email,String password) 
            // public static void cha jagi Doctor lela karan khali Doctor D = null lela mnun .
    { 
        Doctor d =null;
        try{
      Connection con = DbConnection.getConnection();
      String qry ="select * from doctor where email = ? and password = ?";
      PreparedStatement pstmt = con.prepareStatement(qry);
      pstmt.setString(1, email );
      pstmt.setString(2, password);
      
      // note :- var aapan select query lila mnun executeQuery() run kele.insert asta tar executeupdate() query run kela asta.
      ResultSet rs = pstmt.executeQuery();
      
      if(rs.next())
      {
          d = new Doctor(); // ya doctor object mdhe email store kra cha ahe .
          int doctorid = rs.getInt("doctor_id");
          String fullname = rs.getString("fullname");
          String  doctoremail = rs.getString("email");
          
          d.setFullname(fullname);
          d.setDoctor_id(doctorid);
          d.setEmail(email);
          
      }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
      return d;
    }

    
    public static ResultSet getDoctorById(int doctorid)
{
    ResultSet rs = null;

    try{
        Connection con = DbConnection.getConnection();

        String qry = "SELECT * FROM doctor WHERE doctor_id=?";

        PreparedStatement pstmt = con.prepareStatement(qry);
        pstmt.setInt(1, doctorid);

        rs = pstmt.executeQuery();

    }catch(Exception e){
        e.printStackTrace();
    }

    return rs;
}

    public static boolean updateDoctor(Doctor d)
{
    try{
        Connection con = DbConnection.getConnection();

        String qry = "UPDATE doctor SET fullname=?, email=?, phone=?, experience=?, address=? WHERE doctor_id=?";

        PreparedStatement pstmt = con.prepareStatement(qry);

        pstmt.setString(1, d.getFullname());
        pstmt.setString(2, d.getEmail());
        pstmt.setString(3, d.getPhone());
        pstmt.setInt(4, d.getExperience());
        pstmt.setString(5, d.getAddress());
        pstmt.setInt(6, d.getDoctor_id());

        int row = pstmt.executeUpdate();
        System.out.println("Rows Updated: " + row); // 🔥
        return row > 0;

    }catch(Exception e){
        e.printStackTrace();
    }

    return false;
}
}
