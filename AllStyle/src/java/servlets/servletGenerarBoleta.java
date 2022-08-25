package servlets;

import beans.CarritoBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.conexionDB;

@WebServlet(name = "servletGenerarBoleta", urlPatterns = {"/servletGenerarBoleta"})
public class servletGenerarBoleta extends HttpServlet {

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
        HttpSession session = request.getSession();        
        
        ArrayList<CarritoBeans> arrayCarrito = (ArrayList<CarritoBeans>)session.getAttribute("carrito");
            Date date = new Date();
            long fechaDate = date.getTime();
            int fechaActual = date.getDate();
            java.sql.Date fechaSql = new java.sql.Date(fechaActual);
            int idBoleta = 0;
            System.out.println("SQL Date: " + fechaActual);
        try {
            
            PreparedStatement pstaContador = conexionDB.getConexion().prepareStatement("select count(*) from boletas");
            ResultSet rsContador = pstaContador.executeQuery();
            while(rsContador.next()){
                idBoleta = rsContador.getInt(1) + 1;
            }
            PreparedStatement pstaBoleta = conexionDB.getConexion().prepareStatement("insert into boletas values(?,?,?,?)");     
                pstaBoleta.setInt(1, idBoleta);
                pstaBoleta.setInt(2, (int)session.getAttribute("dni"));
                pstaBoleta.setDate(3, fechaSql);
                pstaBoleta.setString(4, "En Proceso");
            pstaBoleta.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error Crear Boleta: " + e);
        }
        try {
            for (int i = 0; i < arrayCarrito.size(); i++) {
                CarritoBeans carrito = arrayCarrito.get(i);
                PreparedStatement pstaDetalleBoleta = conexionDB.getConexion().prepareStatement("insert into detallesboleta values(?,?,?,?)");     
                    pstaDetalleBoleta.setInt(1, idBoleta);
                    pstaDetalleBoleta.setString(2, carrito.getIdProducto());
                    pstaDetalleBoleta.setInt(3, carrito.getCantidad());
                    pstaDetalleBoleta.setDouble(4, carrito.getCantidad() * carrito.getPrecio());
                pstaDetalleBoleta.executeUpdate();
            }
            conexionDB.getConexion().close();    
        } catch (Exception e) {
            System.out.println("Error Crear Detalle: " + e);
        }                        
        request.getRequestDispatcher("index.jsp").forward(request, response);        
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
