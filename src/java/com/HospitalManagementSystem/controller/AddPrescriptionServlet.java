
package com.HospitalManagementSystem.controller;
import javax.servlet.http.HttpSession;
import com.HospitalManagementSystem.dao.AppointmentDAO;
import com.HospitalManagementSystem.dao.PrescriptionDAO;
import com.HospitalManagementSystem.model.Prescription;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.jni.SSLContext;

public class AddPrescriptionServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPrescriptionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPrescriptionServlet at " + request.getContextPath() + "</h1>");
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
        
      int appointmentid = Integer.parseInt( request.getParameter("appointment_id"));
       String diagnosis = request.getParameter("diagnosis");
       String medicines = request.getParameter("medicines");
       String dosage    = request.getParameter("dosage");
       String notes     = request.getParameter("notes");
       
        // 🔥 doctor id from session
   HttpSession session = request.getSession();

if(session.getAttribute("doctorid") == null){
    response.sendRedirect("doctor_login.jsp");
    return;
}

     int doctorid = (int) session.getAttribute("doctorid");

    // 🔥 patient id from appointment table
    int patient_id = AppointmentDAO.getPatientIdByAppointment(appointmentid);
        

     
        Prescription p =new Prescription();
        p.setAppointment_id(appointmentid);
         p.setDoctor_id(doctorid);        // ✅ FIX
        p.setPatient_id(patient_id);     // ✅ FIX
        p.setDiagnosis(diagnosis);
        p.setMedicines(medicines);
        p.setDosage(dosage);
        p.setNotes(notes);
        
        
        
     boolean result = PrescriptionDAO.addPrescription(p);
      
     if(result){
    AppointmentDAO.updateStatus(appointmentid);
    response.sendRedirect("doctor/view_appointments.jsp");
      }else{
    response.getWriter().println("Insert Failed");
}
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
