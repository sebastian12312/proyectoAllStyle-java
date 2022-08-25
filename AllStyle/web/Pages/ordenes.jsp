<%@page import="beans.DetallesBoleta"%>
<%@page import="beans.Boletas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Ordenes </title>
        <link rel="stylesheet" href="css/estilos.css">
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
                    <li><a onclick="servletNeutro('servletProductos','')"> Productos </a></li>
                    <li><a href="#">Contacto</a></li>
                    <li><a href="#">Nosotros</a></li>
                </ul>
            </div>

        <%
            if(usuario == null){
            %>
        
        </div>
        <div class="header_2">
            <div class="header_2_a_1">
                <a id="Login" style="cursor: pointer;"><i class="fa-regular fa-user"></i> <span> Iniciar Sesion </span></a>
            </div>
            <div class="header_2_a_2">
                <a href="#"> <img src="img/cart.png" alt=""><span>(10)</span></a>
            </div>
        </div>

        <%
            }else{
            %>
                        
            <ul class="header_1_li">
                <li><a onclick="servletNeutro('servletOrdenes','')"> Ordenes </a></li>
            </ul>
        </div>
            
        <div class="header_2">
            <div class="header_2_a_1" style="margin-top: 13px;">
                <a id="Login" style="cursor: pointer;" href="servletLogin"><i class="fa-regular fa-user"></i> <span> <%=usuario%> </span></a>
            </div>
            <div class="header_2_a_2">
                <a href="#" onclick="AbrirNav()"> <img src="img/bars.png" alt=""> </a>
            </div>
        </div>  
            
        <%
            }
        %>

    </header>
     
    <main> 
        
        <%
            if(request.getAttribute("listaOrdenes") == null){
            %>
        
            <div class="container pt-5"> 
                <h1> Aún no se han realizado órdenes de compra </h1>  
            </div>
            
        <%
            }else{
            %>
        
        <div class="container pt-5">         
            <table class="table text-center">
                <thead>
                    <tr>
                        <th scope="col"> # </th>
                        <th scope="col"> Fecha </th>
                        <th scope="col"> Estado </th>
                        <th scope="col"> Detalles </th>
                    </tr>
                </thead>      
                <tbody>            
                    
            <%
                Boletas ordenes;
                ArrayList<Boletas> arrayOrdenes = (ArrayList<Boletas>)request.getAttribute("listaOrdenes");
                ArrayList<DetallesBoleta> arrayDetalles = (ArrayList<DetallesBoleta>)request.getAttribute("listaDetalles");
                
                DetallesBoleta detalle = arrayDetalles.get(0);
                for (int i = 0; i < arrayOrdenes.size(); i++) {
                    ordenes = arrayOrdenes.get(i);
                %>
                
                    <tr>
                        <th scope="row"> <%=i + 1%> </th>
                        <td> <%=ordenes.getFechac()%> </td>
                        <td> <%=ordenes.getEstado()%> </td>
                        <td>                                 
                            <a onclick="expandirDetalles('trOrden<%=i%>')"> <img src="img/bars.png" alt="Expandir" style="height: 25px;"> </a>                         
                        </td>
                    </tr> 
                        
                    <tr class="trOrden<%=i%>" style="display: none;"> 
                        <td colspan="5"> 
                            <table class="table"> 
                                <thead> 
                                    <tr> 
                                        <th scope="row"> Producto </th>
                                        <th scope="row"> Imagen </th>
                                        <th scope="row"> Cantidad </th>
                                        <th scope="row"> Precio Unitario </th>
                                        <th scope="row"> Precio Total </th>
                                    </tr>
                                </thead>
                            
                <%                       
                    double importeFinal = 0;
                    for (int contDetalle = 0; contDetalle < arrayDetalles.size(); contDetalle++) {                          
                        detalle = arrayDetalles.get(contDetalle);
                        if(detalle.getIDBoleta().equals(ordenes.getIDBoleta())){
                            importeFinal += detalle.getCantidad() * detalle.getPrecio();
                    %>
                                        
                                <tr> 
                                    <td> <%=detalle.getNombreProducto()%> </td>
                                    <td> <img src="imgProductos/<%=detalle.getImagen()%>" alt="Producto" style="height: 50px;"> </td>
                                    <td> <%=detalle.getCantidad()%> </td>
                                    <td> <%=detalle.getPrecio()%> </td>
                                    <td> <%=detalle.getCantidad() * detalle.getPrecio()%> </td>
                                </tr>
                                        
                <%                       
                        }
                    }
                    %>
                    
                                <tr> 
                                    <td colspan="3"> </td>
                                    <td class="fw-bold"> Importe Final </td>
                                    <td> <%=importeFinal%> </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                
                    
            <%
                }            
                %>

                </tbody>
            </table>             
        </div>
            
        <%
            }
            %>
                   
    </main>  
            
    <script type="text/javascript">
        function expandirDetalles(nameClass){   
            var trClass = document.getElementsByClassName(nameClass).item(0);
            if(trClass.style.display == ""){
                trClass.style.display = "none";
            }else{
                trClass.style.display = "";
            }
        }
    </script>
    
    <script src="../js/controlServlets.js"> </script> 
            
    <!-- Formulario para redireccionamiento -->
    <form class="d-none" name="fServletNeutro" action="" method="Post">
        <input type="hidden" name="accion" id="fInput" value=""> 
        <input type="hidden" name="fId" id="fId" value=""> 
    </form>     
    </body>
</html>
