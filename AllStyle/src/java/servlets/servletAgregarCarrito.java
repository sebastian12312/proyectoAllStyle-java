package servlets;

import beans.CarritoBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "servletAgregarCarrito", urlPatterns = {"/servletAgregarCarrito"})
public class servletAgregarCarrito extends HttpServlet {

    CarritoBeans carrito;
    
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
        
        ArrayList<CarritoBeans> arrayCarrito;
        if(session.getAttribute("carrito") == null){
            arrayCarrito = new ArrayList<>(); 
            arrayCarrito.add(añadirProducto(request));
        }else{
            arrayCarrito = (ArrayList<CarritoBeans>)session.getAttribute("carrito");
            int cont = buscarProducto(arrayCarrito, request);            
            if(cont >= 0){
                aumentarProducto(arrayCarrito, cont);
            }else{
                arrayCarrito.add(añadirProducto(request));
            }
        }        
            session.setAttribute("carrito", arrayCarrito);
        request.getRequestDispatcher("servletProductos").forward(request, response);
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
    
    private CarritoBeans añadirProducto(HttpServletRequest request){
        carrito = new CarritoBeans(
            request.getParameter("fId"),
            request.getParameter("fNombre"),
            Double.parseDouble(request.getParameter("fPrecio")),
            1,
            request.getParameter("fImagen")
        );
        return carrito;
    }

    private int buscarProducto(ArrayList<CarritoBeans> arrayCarrito, HttpServletRequest request){
        for (int i = 0; i < arrayCarrito.size(); i++) {                
            carrito = arrayCarrito.get(i);
            if(request.getParameter("fId").equals(carrito.getIdProducto())){
                return i;
            }
        }
        return -1;
    }
    
    private void aumentarProducto(ArrayList<CarritoBeans> arrayCarrito, int i){
        carrito = arrayCarrito.get(i);        
        carrito.setCantidad(carrito.getCantidad() + 1);
        arrayCarrito.set(i, carrito);
    }
}

