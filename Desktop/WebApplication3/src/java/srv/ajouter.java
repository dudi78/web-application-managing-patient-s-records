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

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import mycls.Userad;

/**
 *
 * @author admin
 */
@MultipartConfig
public class ajouter extends HttpServlet {

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
            out.println("<title>Servlet ajouter</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ajouter at " + request.getContextPath() + "</h1>");
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

        String local = request.getParameter("local");
        String maison = request.getParameter("maison");
        String desc = request.getParameter("desc");
        String rad = request.getParameter("radgroup1");
        int prix = Integer.parseInt(request.getParameter("prix"));
        int sup = Integer.parseInt(request.getParameter("sup"));

        Part p1 = request.getPart("img1");
        Part p2 = request.getPart("img2");
        Part p3 = request.getPart("img3");
        String img1 = p1.getSubmittedFileName().substring(0, p1.getSubmittedFileName().indexOf(".")) + new SimpleDateFormat("ddmmyyyy").format(new Date()) + ".jpg";
        String img2 = p2.getSubmittedFileName().substring(0, p1.getSubmittedFileName().indexOf(".")) + new SimpleDateFormat("ddmmyyyy").format(new Date()) + ".jpg";
        String img3 = p3.getSubmittedFileName().substring(0, p1.getSubmittedFileName().indexOf(".")) + new SimpleDateFormat("ddmmyyyy").format(new Date()) + ".jpg";

        Userad us = (Userad) request.getSession().getAttribute("user");

        try {
            Connection con = MyUtil.seConnecter();

            PreparedStatement ps = con.prepareStatement("insert into details values(seq_an.nextval,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, us.getUserid());
            ps.setString(2, maison);
            ps.setInt(3, sup);
            ps.setString(4, local);
            ps.setInt(5, prix);
            ps.setString(6, img1);
            ps.setString(7, img2);
            ps.setString(8, img3);
            ps.setString(9, rad);
            ps.setString(10, desc);
            ps.executeUpdate();

            p1.write(request.getRealPath("/imgs/") + "/" + img1);
            p2.write(request.getRealPath("/imgs/") + "/" + img2);
            p3.write(request.getRealPath("/imgs/") + "/" + img3);

            response.sendRedirect("/WebApplication3/jsp/mesannonces.jsp");

        } catch (Exception ex) {
            Logger.getLogger(ajouter.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
