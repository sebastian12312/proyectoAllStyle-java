<%@page import="beans.CarritoBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Boleta </title>
        <link rel="stylesheet" href="../css/estilos.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
            integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/ec4896fd00.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/tshirt.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
    
    <%
        String usuario = (String)session.getAttribute("usuario");
        %>
        
    <header class="header">
        <div class="header_1">
            <div class="titulo_header">
                <a href="index.jsp">
                    <h1>All Style</h1>
                </a>
            </div>
            <div class="header_1_ul">
                <ul class="header_1_li">
                    <li> <h3> Procesar Compra </h3> </li>
                </ul>
            </div>
        </div>
        
        <div class="header_2">
            <div class="header_2_a_1" style="margin-top: 13px;">
                <a id="Login" style="cursor: pointer;" href="../servletLogin"> <i class="fa-regular fa-user"></i> <span> <%=usuario%> </span></a>
            </div>            
        </div>  
            
        

    </header>
     
    <main> 
        
        <div class="container pt-5">         
            <table class="table text-center">
                <thead>
                    <tr>
                        <th scope="col"> # </th>
                        <th scope="col"> Producto </th>
                        <th scope="col"> Nombre </th>
                        <th scope="col"> Precio Unitario </th>
                        <th scope="col"> Cantidad </th>
                        <th scope="col"> Precio Total </th>
                        <th scope="col"> Eliminar </th>
                    </tr>
                </thead>      
                <tbody>            
                    
    <%
        double precioTotal, precioFinal = 0;
        CarritoBeans carrito;
        ArrayList<CarritoBeans> arrayCarrito = (ArrayList<CarritoBeans>)session.getAttribute("carrito");
        for (int i = 0; i < arrayCarrito.size(); i++) {
            carrito = arrayCarrito.get(i);
            precioTotal = carrito.getPrecio() * carrito.getCantidad();
            precioFinal = precioFinal + precioTotal;
        %>
                
                    <tr>
                        <th scope="row"> <%=i + 1%> </th>
                        <th> <img src="../imgProductos/<%=carrito.getImagen()%>" alt="Producto <%=i + 1%>" style="height: 50px;"> </th>
                        <td> <%=carrito.getNombre()%> </td>
                        <td> <%=carrito.getPrecio()%> </td>
                        <td> 
                            <table>                                
                                <input type="text" value="<%=carrito.getCantidad()%>" min="1" class="text-center" id="inputCantidad<%=carrito.getIdProducto()%>"
                                       onchange="editarCarrito('Editar','<%=carrito.getIdProducto()%>','inputCantidad<%=carrito.getIdProducto()%>')">
                            </table>                            
                        </td>
                        <td> <%=precioTotal%> </td>
                        <td>
                            <button class="btn" onclick="editarCarrito('Eliminar','<%=carrito.getIdProducto()%>','')"> 
                                <img src="../img/close.png" alt="Eliminar"> 
                            </button>                                
                        </td>
                    </tr> 
                    
    <%
        }
    %>
    
                    <tr> 
                        <td colspan="4"> </td>
                        <th scope="row"> PRECIO TOTAL </th>
                        <td class="fw-bold"> <%=precioFinal%> </td>
                    </tr>

                </tbody>
            </table>
            <div class="row text-center pt-5"> 
                <div class="col"> 
                    <button class="btn btn-secondary" onclick="servletNeutro('../servletProductos','')"> Seguir comprando </button>
                </div>
                <div class="col">
                    <button class="btn btn-success" onclick="servletNeutro('../servletGenerarBoleta','')"> Confirmar compra </button>
                </div>
            </div> 
        </div>
            
    </main>  
    
    <!-- I: Edición del carrito de compras -->
    <div class="d-none"> 
        <form method="post" id="fEditarCarrito">
            <input type="hidden" name="fOpcion" id="fOpcion">
            <input type="hidden" name="fIdProducto" id="fIdProducto">
            <input type="hidden" name="fCantidad" id="fCantidad">
        </form>

        <script> 
            function editarCarrito(fOpcion, fIdProducto, fCantidad){
                console.log("EditarCarrito");
                document.getElementById("fOpcion").value = fOpcion;
                document.getElementById("fIdProducto").value = fIdProducto;
                if(fOpcion == "Editar"){
                    document.getElementById("fCantidad").value = document.getElementById(fCantidad).value;
                }                
                document.getElementById("fEditarCarrito").submit();                                   
            }
        </script>

        <%
            if(request.getParameter("fIdProducto") != null){
                                    System.out.println("Opcion: " + request.getParameter("fOpcion"));
                if(request.getParameter("fOpcion").equals("Eliminar")){
                    System.out.println("ELIMINAR");
                    try {
                        for (int i = 0; i < arrayCarrito.size(); i++) {
                            carrito = arrayCarrito.get(i);
                            if(carrito.getIdProducto().equals(request.getParameter("fIdProducto"))){
                                arrayCarrito.remove(i);
                            }
                        }
                        request.getRequestDispatcher("boletas.jsp").forward(request, response);  
                    } catch (Exception e) {
                        System.out.println("Error Eliminar Producto del Array: " + e);
                    }
                }else
                if(request.getParameter("fOpcion").equals("Editar")){
                    System.out.println("EDITAR");
                    try {
                        for (int i = 0; i < arrayCarrito.size(); i++) {
                            carrito = arrayCarrito.get(i);
                            if(carrito.getIdProducto().equals(request.getParameter("fIdProducto"))){
                                carrito = arrayCarrito.get(i);
                                carrito.setCantidad(Integer.parseInt(request.getParameter("fCantidad")));
                                arrayCarrito.set(i, carrito);
                            }
                        }
                        request.getRequestDispatcher("boletas.jsp").forward(request, response);
                    } catch (Exception e) {
                        System.out.println("Error Editar Producto del Array: " + e);
                    }
                }
            }
            %>
    </div> 
    <!-- F: Edición del carrito de compras -->   
        
    <script src="../js/controlServlets.js"> </script> 
            
    <!-- Formulario para redireccionamiento -->
    <form class="d-none" name="fServletNeutro" action="" method="Post">
        <input type="hidden" name="accion" id="fInput" value=""> 
        <input type="hidden" name="fId" id="fId" value=""> 
    </form>     
    </body>
</html>
