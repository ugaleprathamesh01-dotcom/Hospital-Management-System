
package com.HospitalManagementSystem.controller;

import com.HospitalManagementSystem.dao.PatientDAO;
import com.HospitalManagementSystem.model.Patient;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class registerPatientServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerPatientServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerPatientServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      String fullname = request.getParameter("fullname");
      String email  =   request.getParameter("email");
      String phone =    request.getParameter("phone");
      String password = request.getParameter("password");
      String gender =   request.getParameter("gender");
      int age =      Integer.parseInt(request.getParameter("age"));
      String blood_group =  request.getParameter("blood_group");
      String address =  request.getParameter("address");
      
      // object create karta ni import kra lagte.
        Patient p = new Patient();
        p.setFullname(fullname);
        p.setEmail(email);
        p.setPhone(Long.parseLong(phone));
        p.setPassword(password);
        p.setGender(gender);
        p.setAge(age);
        p.setBlood_group(blood_group);
        p.setAddress(address);
       
        // ha khal cha ardha nanter cha code ahe patientDAO.java file mdhe e.printStacktrack(); cha nanter ithe code lila .
        PatientDAO.registerPatient(p);
        
        // [ aapan "patient/patient_login.jsp" file mdhe send krat ahe by using response.sendRedirect.]servlet kay karte client side request handle karte and response dete.
        response.sendRedirect("patient/patient_login.jsp");
    
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
