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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import mycls.Userad;

/**
 *
 * @author admin
 */
@MultipartConfig
public class Update extends HttpServlet {

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
            out.println("<title>Servlet Update</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Update at " + request.getContextPath() + "</h1>");
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
        String local = request.getParameter("local");
        String maison = request.getParameter("maison");
        String desc = request.getParameter("desc");
        String rad = request.getParameter("radgroup1");
        int prix = Integer.parseInt(request.getParameter("prix"));
        int sup = Integer.parseInt(request.getParameter("sup"));

        Userad us = (Userad) request.getSession().getAttribute("user");

        try {
            Connection con = MyUtil.seConnecter();

            PreparedStatement ps = con.prepareStatement(" Update  details set TYPE_BIEN=?, SUPERFICIE=?, LOCALISATION=?,PRIX=?,TYPE_AN=?,DESCRI=? where id_an=? and username=? ");
            ps.setString(1, maison);
            ps.setInt(2, sup);
            
            ps.setString(3, local);
            ps.setInt(4, prix);
           
            ps.setString(5, rad);
            ps.setString(6, desc);
            ps.setInt(7, idan);
            ps.setString(8, us.getUserid());
            ps.executeUpdate();


            response.sendRedirect("/WebApplication3/jsp/mesannonces.jsp");

        } catch (Exception ex) {
            Logger.getLogger(ajouter.class.getName()).log(Level.SEVERE, null, ex);
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
