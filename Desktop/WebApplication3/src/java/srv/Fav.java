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
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mycls.Userad;

/**
 *
 * @author admin
 */
public class Fav extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Fav</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Fav at " + request.getContextPath() + "</h1>");
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
          int idan=Integer.parseInt(request.getParameter("idan"));
          Connection con;
        try {
            Userad u = (Userad) request.getSession().getAttribute("user");
            con = MyUtil.seConnecter();
            PreparedStatement ps1=con.prepareStatement("select count(idan) from favoris where idan=? and userh=?");
            ps1.setInt(1, idan);
           
            ps1.setString(2, u.getUserid());
            ResultSet rs=ps1.executeQuery();
              
            if(rs.getInt(1)==0){
            PreparedStatement ps =con.prepareStatement("insert into favoris values(?,?)");
            
           
            ps.setString(1,u.getUserid() );
            ps.setInt(2, idan);
            ps.executeUpdate();
             PrintWriter out = response.getWriter();
             out.print("ajouter au liste favoris avec success");

            
            }else{
                PrintWriter out = response.getWriter();
             out.print("l annonce deja existe aux favoris");
   
             }

        } catch (Exception ex) {
            Logger.getLogger(Fav.class.getName()).log(Level.SEVERE, null, ex);
        }
         


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
        processRequest(request, response);
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
