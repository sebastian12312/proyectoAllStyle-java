/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.conexionDB;

@WebServlet(name = "servletRegister", urlPatterns = {"/servletRegister"})
public class servletRegister extends HttpServlet {

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
        processRequest(request, response);
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
        
        try {
            PreparedStatement pstaRegister = conexionDB.getConexion().prepareStatement("insert into usuarios values(?,?,?,?,?,?,?)");
                pstaRegister.setInt(1, Integer.parseInt(request.getParameter("fDni")));
                pstaRegister.setString(2, request.getParameter("fNombres"));
                pstaRegister.setString(3, request.getParameter("fApellidos"));
                pstaRegister.setInt(4, Integer.parseInt(request.getParameter("fTelefono")));
                pstaRegister.setString(5, request.getParameter("fEmail"));
                pstaRegister.setString(6, request.getParameter("fPassword"));
                pstaRegister.setString(7, request.getParameter("fRol"));
            pstaRegister.executeUpdate();
            
            conexionDB.getConexion().close();
            
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.out.println("Excepción Register: " + e);
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
