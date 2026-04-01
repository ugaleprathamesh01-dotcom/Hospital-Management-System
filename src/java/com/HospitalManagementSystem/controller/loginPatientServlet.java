
package com.HospitalManagementSystem.controller;

import com.HospitalManagementSystem.dao.PatientDAO;
import com.HospitalManagementSystem.model.Patient;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class loginPatientServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginPatientServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginPatientServlet at " + request.getContextPath() + "</h1>");
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
        
        // information get krat ahe .
        // then create a object.
        // objet through set function gheun value set karnar.
        // dao file mdhe login patient le call karnar.
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        String email    =  request.getParameter("email");
        String password =  request.getParameter("password");
        
        
        
        // Note:- RegisterPatientServlet.java file mdhe jya type ne ,means je step follow kela te itha pan kru shaklo asto but Aapla 
        // patient_login cha code khup chota ahe tya mdhe two step ahe fakta email,ani password cha tya mule te method jar follow kela.
        // tar code line khup jasta hote mnun ha method follow krat ahe.
        
        // aata String password =  request.getParameter("password"); cha nanter lages ha code liha cha khal cha.
        
        // pATIENTdao. ani  lagte.loginpatient(); import kra lagte. then go toPatientDAO.java 
      Patient p =  PatientDAO.loginPatient(email,password);
      
      // var cha line cha 'patient p' ani aata khal cha line cha code patientDAO cha kam zala cha nanter kara cha.
      
      if(p!=null)
      {  
          // import HttpSession and getSession
          HttpSession session = request.getSession();
          session.setAttribute("patientid", p.getPatient_id());
          session.setAttribute("fullname", p.getFullname());
          
          response.sendRedirect("patient/patient_dashboard.jsp");
          
      }
      else
      {
         out.println("<script>alert('Invalid Email/Password')</script>"); 
         response.sendRedirect("patient/patient_login.jsp");
      }
                
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
