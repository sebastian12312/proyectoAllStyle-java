package servlets;

import beans.ProductoBeans;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import utils.conexionDB;

@WebServlet(name = "servletAgregarProducto", urlPatterns = {"/servletAgregarProducto"})
public class servletAgregarProducto extends HttpServlet {

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
        
        try{                                     
            String img="";
            
            FileItemFactory file_factory = new DiskFileItemFactory();

            ServletFileUpload servlet_up = new ServletFileUpload(file_factory);

            List items = servlet_up.parseRequest(request);
            
            ArrayList array = new ArrayList<>();
            int a = 0;
            String imagen = null;              
            for(int i=0;i<items.size();i++){
                FileItem item = (FileItem) items.get(i);
                if (item.isFormField()){                    
                    array.add(item.getString());   
                }else{                   
                    String[] formato = item.getName().split("\\.");
                    imagen = array.get(0).toString() + "." + formato[1];
                    File archivo_server = new File("F:\\2022 - 1\\Análisis y Diseño de Sistemas de Información\\AllStyle\\AllStyle\\web\\imgProductos\\"+imagen);
                    item.write(archivo_server);
                }
            }
                PreparedStatement pstaAgregarProducto = conexionDB.getConexion().prepareStatement("insert into productos values(?,?,?,?,?,?,?,?)");     
                    pstaAgregarProducto.setString(1, array.get(0).toString());
                    pstaAgregarProducto.setString(2, array.get(1).toString());
                    pstaAgregarProducto.setString(3, array.get(2).toString());
                    pstaAgregarProducto.setInt(4, Integer.parseInt(array.get(3).toString()));
                    pstaAgregarProducto.setDouble(5, Double.parseDouble(array.get(4).toString()));
                    pstaAgregarProducto.setString(6, array.get(5).toString());
                    pstaAgregarProducto.setString(7, array.get(6).toString());
                    pstaAgregarProducto.setString(8, imagen);
                pstaAgregarProducto.executeUpdate();

                conexionDB.getConexion().close();       
                    
                request.setAttribute("accion", "ListarProducto");                
                request.getRequestDispatcher("CRUDAdministrador").forward(request, response);
        }catch(Exception e){
            System.out.println("Error Agregar Producto: " + e);
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
