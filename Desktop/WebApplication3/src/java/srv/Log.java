/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package srv;

import appl.pk.MyUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mycls.Userad;


/**
 *
 * @author admin
 */
public class Log extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html/;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Log</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Log at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



    //   response.setContentType("text/html");
      // PrintWriter out = response.getWriter();
      
       // HttpSession session=request.getSession();
      // 
     // String user=request.getParameter("username");
     // String password =request.getParameter("password");
     // session.setAttribute("valeur", user);
            //if(!user.equals("") && !password.equals("")){
            
         // this.getServletContext().getRequestDispatcher("/menu.html").forward(request, response);

           // } else{
                  //this.getServletContext().getRequestDispatcher("/Login.html").forward(request, response);
              

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    response.setContentType("text/html");

   
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        ServletContext context=request.getServletContext();
        String user=request.getParameter("user");
        String motpass =request.getParameter("motpass");
        String rad1 =request.getParameter("radgroupe1");
        String nom=request.getParameter("nom");
        String prenom =request.getParameter("prenom");
        String gmail =request.getParameter("gmail");
        int tel =Integer.parseInt(request.getParameter("tel"));

        if(nom!=""&&nom!=null && prenom!=""&&prenom!=null && motpass!=""&&motpass!=null && gmail!=""&&gmail!=null && user!=""&&user!=null  &&  tel!=0){
             
             Connection con = null;
             try {
                 con = MyUtil.seConnecter();
                 
           
           PreparedStatement  ps = con.prepareStatement("insert into users values(?,?,?,?,?,?)" );
           
              ps.setString(1,user);
              ps.setString(2, nom);
              ps.setString(3, prenom);
              ps.setInt(4, tel);
              ps.setString(5, motpass);
              ps.setString(6, gmail);
              ps.executeUpdate();
              session.setAttribute("user",new Userad(user));
              this.getServletContext().getRequestDispatcher("//jsp/Mennu.jsp").forward(request, response);
               
             } catch (Exception ex) {
                 Logger.getLogger(ag.class.getName()).log(Level.SEVERE, null, ex);
             }
       
    }  
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
