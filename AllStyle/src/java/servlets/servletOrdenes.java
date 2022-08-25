package servlets;

import beans.Boletas;
import beans.DetallesBoleta;
import beans.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.conexionDB;

@WebServlet(name = "servletOrdenes", urlPatterns = {"/servletOrdenes"})
public class servletOrdenes extends HttpServlet {

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
        int cantidad = 0;
        String direccion = null;
        try{
            PreparedStatement pstaOrdenes;
            String accion = null;
            if(request.getParameter("accion") != null){
                accion = request.getParameter("accion");
            }
            if(request.getAttribute("accion") != null){
                accion = request.getAttribute("accion").toString();
            }
            if(accion == null){
                pstaOrdenes = conexionDB.getConexion().prepareStatement("select * from boletas where dni=? order by idBoleta");     
                    pstaOrdenes.setInt(1, (int)session.getAttribute("dni"));        
                direccion = "Pages/ordenes.jsp";
            }else{
                pstaOrdenes = conexionDB.getConexion().prepareStatement("select * from boletas where estado=? order by idBoleta");     
                    pstaOrdenes.setString(1, "En Proceso");
                direccion = "Administrador/AdministracionOrdenes.jsp";
            }
            ResultSet rsOrdenes = pstaOrdenes.executeQuery(); 
            
            ArrayList<Boletas> arrayOrdenes = new ArrayList<>();                
            ArrayList<DetallesBoleta> arrayDetalles = new ArrayList<>();
                            
            if(!rsOrdenes.next()){
                arrayOrdenes = null;
                arrayDetalles = null;
            }else{
                do{    
                    cantidad++;
                    Boletas boleta = new Boletas(rsOrdenes.getString(1),
                        rsOrdenes.getString(2), rsOrdenes.getDate(3).toString(), rsOrdenes.getString(4));                
                    arrayOrdenes.add(boleta);

                    PreparedStatement pstaDetalles = conexionDB.getConexion().prepareStatement("select "
                            + "detallesboleta.idBoleta, productos.nombre, detallesboleta.cantidad, productos.precio, productos.imagen "
                            + "from detallesboleta join productos on detallesboleta.idProducto = productos.idProducto "
                            + "where detallesboleta.idBoleta=? order by productos.idProducto;");
                        pstaDetalles.setString(1, rsOrdenes.getString(1)); 
                    ResultSet rsDetalles = pstaDetalles.executeQuery();
                    while(rsDetalles.next()){
                        DetallesBoleta detalle = new DetallesBoleta(rsDetalles.getString(1), rsDetalles.getString(2),
                            rsDetalles.getInt(3), rsDetalles.getDouble(4), rsDetalles.getString(5));
                        arrayDetalles.add(detalle);
                    }                
                }while(rsOrdenes.next());    
            }
            
            for (int i = 0; i < arrayOrdenes.size(); i++) {
                System.out.println(arrayOrdenes.get(i).getIDBoleta());
            }
            for (int i = 0; i < arrayDetalles.size(); i++) {
                System.out.println(arrayDetalles.get(i).getNombreProducto());
            }
            
            conexionDB.getConexion().close();
            
            request.setAttribute("listaOrdenes", arrayOrdenes);
            request.setAttribute("listaDetalles", arrayDetalles);
            request.setAttribute("cantidad", cantidad);
                    
            request.getRequestDispatcher(direccion).forward(request, response);                            
        } catch (IOException | SQLException | ServletException e) {
            System.out.println("Error Servlet Ordenes: " + e);
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
