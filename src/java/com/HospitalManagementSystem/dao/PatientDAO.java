
package com.HospitalManagementSystem.dao;

import com.HospitalManagementSystem.model.Patient;
import com.HospitalManagementSystem.util.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PatientDAO {
    
    // ha khal cha (Patient p) box madhla import kele la ahe .
    public static void registerPatient(Patient p) 
    { 
      try{
           // he DbConnection.getConnection  ani   import kela ahe
      Connection con =  DbConnection.getConnection();
      String qry = "insert into patient(fullname,email,phone,password,gender,age,blood_group,address) values(?,?,?,?,?,?,?,?)";
      // he preparedStatement and con.preparedstatement() import kele la ahe .
      PreparedStatement pstmt = con.prepareStatement(qry);
      
      pstmt.setString(1,p.getFullname());
      pstmt.setString(2,p.getEmail());
      pstmt.setLong(3,p.getPhone());
      pstmt.setString(4,p.getPassword());
      pstmt.setString(5,p.getGender());
      pstmt.setInt(6,p.getAge());
      pstmt.setString(7,p.getBlood_group());
      pstmt.setString(8,p.getAddress());
      
      pstmt.executeUpdate();
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
    }
    
    // ha khal cha (Patient p) import kele la ahe .
    public static Patient loginPatient(String email,String password)
    {
        // aata hey email,and password check karnar kisi email,or password se match hota hai ya nhi for that purpose we can use if statement..
         // he DbConnection.getConnection  ani   import kela ahe
        
        Patient p = null;
        try{
     Connection con = DbConnection.getConnection();
    String qry = "select*from patient where email=? AND password=?";
    PreparedStatement pstmt = con.prepareStatement(qry);
       
    pstmt.setString(1, email);
    pstmt.setString(2, password);
    
    // resultset import kra cha var manually.
    ResultSet rs = pstmt.executeQuery();
    
    // imort kela patient .
   
    if(rs.next())
    {   
        p = new Patient();
        int id = rs.getInt("patient_id");
        String fullname = rs.getString("fullname");
        
        p.setPatient_id(id);
        p.setFullname(fullname);
    }
    }
        catch(Exception e)
        {
            e.printStackTrace();
        }
            return p;
            
    }
}
