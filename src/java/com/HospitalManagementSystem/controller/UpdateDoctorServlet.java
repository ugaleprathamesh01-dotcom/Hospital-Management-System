package com.HospitalManagementSystem.controller;

import com.HospitalManagementSystem.dao.DoctorDAO;
import com.HospitalManagementSystem.model.Doctor;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateDoctorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));
        System.out.println("Doctor ID: " + doctor_id);
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String experiance = request.getParameter("experiance");
        String address = request.getParameter("address");

        Doctor d = new Doctor();
        d.setDoctor_id(doctor_id);
        d.setFullname(fullname);
        d.setEmail(email);
        d.setPhone(phone);
        d.setExperiance(Integer.parseInt(experiance));
        d.setAddress(address);

        boolean result = DoctorDAO.updateDoctor(d);

        if(result){
            response.sendRedirect("doctor/profile.jsp");
        }else{
            response.getWriter().println("Update Failed");
        }
    }
}