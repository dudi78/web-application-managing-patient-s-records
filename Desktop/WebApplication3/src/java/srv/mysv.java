/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package srv;

import appl.pk.MyUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class mysv extends HttpServlet {

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
        response.setContentType("text/html");
       
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        ServletContext context=request.getServletContext();

        String nom=request.getParameter("nom");
        String prenom =request.getParameter("prenom");
        int age =Integer.parseInt(request.getParameter("age"));

        if(nom!=""&&nom!=null && prenom!=""&&prenom!=null &&  age!=0){
              
           session.setAttribute("valeur", prenom);
           
           context.setAttribute("context_nom", nom);
        out.println(" welcome user request "+nom+"  qui vie a"  +prenom+ "  et elle a  "+age);
        out.println("valeur de session"+"  "+ (String)session.getAttribute("valeur"));
        out.println("valeur de application"+"  "+ (String)context.getAttribute("context_nom"));
      
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
          
         String param=request.getParameter("mimi");
          if(!param.equals("")){
            
          this.getServletContext().getRequestDispatcher("/anotherpage.html").forward(request, response);

            } else{
                  this.getServletContext().getRequestDispatcher("/index.html").forward(request, response);
              

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
