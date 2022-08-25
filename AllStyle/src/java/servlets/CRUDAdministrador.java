/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import DAO.AdminDAO;
import beans.Boletas;
import beans.DetallesBoleta;
import beans.Productos;
import beans.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.conexionDB;

/**
 *
 * @author sebas
 */
@WebServlet(name = "CRUDAdministrador", urlPatterns = {"/CRUDAdministrador"})
public class CRUDAdministrador extends HttpServlet {
    List usuario = new ArrayList();
    List cantC = new ArrayList();
    List cantA = new ArrayList();
    List p = new ArrayList();
    List Bol = new ArrayList();
    List detalles = new ArrayList();
    DetallesBoleta detB  = new DetallesBoleta();
    Boletas boletas = new Boletas();
    Productos productos = new Productos();
    Usuarios user= new Usuarios();
    AdminDAO adao = new AdminDAO();
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
        PreparedStatement ps;
        ResultSet rs;
        String Accionar = request.getParameter("accion");          
        String id = request.getParameter("fId");
        
        if(request.getAttribute("accion") != null){
            String AccionarAt = request.getAttribute("accion").toString();
            Accionar = AccionarAt;
        }
        
        switch(Accionar){
            case "Dashboard":
                request.getRequestDispatcher("Administrador/DashBoard.jsp").forward(request, response);
                break;
            //PRODUCTOS   
            case "ListarProducto":
                p = adao.ListarProducto();
                request.setAttribute("cantidadP", p.size());
                request.setAttribute("ListProductos", p);
                request.getRequestDispatcher("Administrador/AdministracionProducto.jsp").forward(request, response);
                break;
            case "BuscarProducto": 
                p = adao.BuscarP(id);
                request.setAttribute("Buscar", p);
                request.getRequestDispatcher("Administrador/EditarProducto.jsp").forward(request, response);
                break;
            case "EditarProducto":
                try {
                PreparedStatement pstaEditarProducto = conexionDB.getConexion().prepareStatement("update productos set nombre=?, descripcion=?, stock=?, precio=?, genero=?, categoria=?, imagen=? where idProducto=?");  
                    pstaEditarProducto.setString(1, request.getParameter("fNombre"));
                    pstaEditarProducto.setString(2, request.getParameter("fDescripcion"));
                    pstaEditarProducto.setInt(3, Integer.parseInt(request.getParameter("fStock")));
                    pstaEditarProducto.setDouble(4, Double.parseDouble(request.getParameter("fPrecio")));
                    pstaEditarProducto.setString(5, request.getParameter("fGenero"));
                    pstaEditarProducto.setString(6, request.getParameter("fCategoria"));
                    pstaEditarProducto.setString(7, request.getParameter("fImagen"));
                    pstaEditarProducto.setString(8, request.getParameter("fId"));
                pstaEditarProducto.executeUpdate();
                    request.setAttribute("accion", "ListarProducto");
                request.getRequestDispatcher("CRUDAdministrador").forward(request, response);
                } catch (Exception e) {
                    System.out.println("Error Editar Producto: " +e);
                }
                break;
            case "EliminarProducto":
                try {
                    ps = conexionDB.getConexion().prepareStatement("delete  from productos where idproducto=?");
                    ps.setString(1, id);
                    ps.executeUpdate();
                } catch (Exception e) {
                    System.out.println("Error Eliminar Producto: " + e);
                }
                request.setAttribute("accion", "ListarProducto");
            request.getRequestDispatcher("CRUDAdministrador").forward(request, response);
            break;
            //USUARIOS
            case "ListarUsuario":
                usuario = adao.ListarUsuario();
                cantA = adao.CantidadAdmin();
                cantC = adao.CantidadCliente();
                request.setAttribute("cantidadC", cantC.size());
                request.setAttribute("cantA", cantA.size());
                request.setAttribute("cantidad", usuario.size());
                request.setAttribute("ListUser", usuario);
                request.getRequestDispatcher("Administrador/AdministracionUsuarios.jsp").forward(request, response);
                break;
            case "RegistrarUsuario":
                try {  
                    ps = conexionDB.getConexion().prepareStatement("insert into usuarios values(?,?,?,?,?,?,?,?)");
                        ps.setString(1, request.getParameter("dni"));
                        ps.setString(2, request.getParameter("nombre"));
                        ps.setString(3, request.getParameter("apellido"));
                        ps.setString(4, request.getParameter("telefono"));
                        ps.setString(5, request.getParameter("correo"));
                        ps.setString(6, request.getParameter("pass"));
                        ps.setString(7, request.getParameter("rol"));
                        ps.setString(8, request.getParameter("fnacimiento"));
                    ps.executeUpdate();
                    request.setAttribute("accion", "ListarUsuario");
                    request.getRequestDispatcher("CRUDAdministrador").forward(request, response);
                } catch (Exception e) {
                    System.out.println("Error Registrar Usuario: " + e);
                }
                break;
            case "BuscarUsuario":
                usuario = adao.BuscarUsuario(id);
                request.setAttribute("Buscar", usuario);
                request.getRequestDispatcher("Administrador/EditarUsuario.jsp").forward(request, response);
                break;
            case "EditarUsuario":
                try {
                    ps = conexionDB.getConexion().prepareStatement("update usuarios set nombres=?,apellidos=?,telefono=?,correo=?,contraseña=?,rol=?,fNacimiento=? where dni = ?");
                    ps.setString(1, request.getParameter("nombre"));
                    ps.setString(2, request.getParameter("apellido"));
                    ps.setString(3, request.getParameter("telefono"));
                    ps.setString(4, request.getParameter("correo"));
                    ps.setString(5, request.getParameter("pass"));
                    ps.setString(6, request.getParameter("rol"));
                    ps.setString(7, request.getParameter("fnacimiento"));
                    ps.setString(8, request.getParameter("dni"));
                    ps.executeUpdate();
                    request.setAttribute("accion", "ListarUsuario");
                    request.getRequestDispatcher("CRUDAdministrador").forward(request, response);
                } catch (Exception e) {
                    System.out.println("Error Editar Usuario: " + e);
                }
                break;
            case "EliminarUsuario":
                try {
                    ps = conexionDB.getConexion().prepareStatement("delete  from usuarios where dni=?");
                    ps.setString(1, id);
                    ps.executeUpdate();
                    request.setAttribute("accion", "ListarUsuario");                        
                    request.getRequestDispatcher("CRUDAdministrador").forward(request, response);
                } catch (Exception e) {
                    System.out.println("Error Eliminar Usuario: " + e);
                }
            break;
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
