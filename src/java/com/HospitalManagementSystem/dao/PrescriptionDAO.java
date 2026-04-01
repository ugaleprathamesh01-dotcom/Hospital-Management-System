package com.HospitalManagementSystem.dao;

import com.HospitalManagementSystem.model.Prescription;
import com.HospitalManagementSystem.util.DbConnection;
import java.sql.*;

public class PrescriptionDAO {

    public static boolean addPrescription(Prescription p)
    {
        try{
            Connection con = DbConnection.getConnection();

            String qry = "INSERT INTO prescription "
                       + "(appointment_id, doctor_id, patient_id, diagnosis, medicines, dosage, notes) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pstmt = con.prepareStatement(qry);

            pstmt.setInt(1, p.getAppointment_id());
            pstmt.setInt(2, p.getDoctor_id());
            pstmt.setInt(3, p.getPatient_id());
            pstmt.setString(4, p.getDiagnosis());
            pstmt.setString(5, p.getMedicines());
            pstmt.setString(6, p.getDosage());
            pstmt.setString(7, p.getNotes());

            int row = pstmt.executeUpdate();

            return row > 0;

        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }
    public static ResultSet getPrescriptionByPatient(int patient_id)
{
    ResultSet rs = null;

    try{
        Connection con = DbConnection.getConnection();

        String qry = "SELECT p.prescription_id, p.diagnosis, p.medicines, p.dosage, p.notes, " +
                     "d.fullname AS doctor_name, a.appointment_date " +
                     "FROM prescription p " +
                     "JOIN doctor d ON p.doctor_id = d.doctor_id " +
                     "JOIN appointment a ON p.appointment_id = a.appointment_id " +
                     "WHERE p.patient_id=?";

        PreparedStatement pstmt = con.prepareStatement(qry);
        pstmt.setInt(1, patient_id);

        rs = pstmt.executeQuery();

    }catch(Exception e){
        e.printStackTrace();
    }

    return rs;
}
}