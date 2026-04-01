
package com.HospitalManagementSystem.controller;

import com.HospitalManagementSystem.dao.DoctorDAO;
import com.HospitalManagementSystem.model.Doctor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginDoctorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginDoctorServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginDoctorServlet at " + request.getContextPath() + "</h1>");
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
           PrintWriter out = response.getWriter();
         response.setContentType("text/html;charset=UTF-8");
            String email =  request.getParameter("email");
            String pwd   =  request.getParameter("password");
            
 // phile DoctorDAO.java file bnav le tya mdhe public static void loginDoctor(String email,String password) yevda code lela nanter vapus itha eun DoctorDAO.loginDoctor(email, pwd); ha code lila.
          Doctor d =  DoctorDAO.loginDoctor(email, pwd);
          
          if(d!=null)
          {
              HttpSession session = request.getSession();
              session.setAttribute("doctorid",d.getDoctor_id());
              session.setAttribute("fullname",d.getFullname());
              
              response.sendRedirect("doctor/doctor_dashboard.jsp");
          }
          out.println("<script>alert('invalid Email or password'')</script>");
            
            // tya namter vapus DOctor.daO cha code lila nanter cha.
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
