<%@page import="beans.DetallesBoleta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Boletas"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>plantilla || 2.0</title>
    <link rel="stylesheet" href="css/administrador.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">
    <link rel="stylesheet" href="css/EstiloAdministrador.css">
    <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2.min.css">

</head>

<body>
    
     <%
        String usuario = (String)session.getAttribute("usuario");
    %>
    
    <header class="header">
        <div class="header_1">
            <div class="titulo_header">
                <a href="#">
                    <h1>All Style</h1>
                </a>
            </div>

        </div>

        <div class="header_2">
            <div class="header_2_a_1">
                        <a id="Login" style="cursor: pointer;"><i class="fa-regular fa-user"></i> <span>
           <%=usuario%>
                    </span></a>

            </div>
            <div class="">

            </div>
        </div>


    </header>
    <!-- CONTENEDOR 1 -->
    <div class="container-fluid">
        <div class="row">
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column color_li">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" onclick="servletNeutro('CRUDAdministrador','Dashboard')">
                                <span data-feather="home"></span>
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">
                                <span data-feather="file"></span>
                                ORDEN
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" onclick="servletNeutro('CRUDAdministrador','ListarProducto')">
                                <span data-feather="shopping-cart"></span>
                                PRODUCTO
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" onclick="servletNeutro('CRUDAdministrador','ListarUsuario')">
                                <span data-feather="users"></span>
                                USUARIOS
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="bar-chart-2"></span>
                                REPORTES
                            </a>
                        </li>
                        <li class="nav-item cerrar_sesion">
                            <a class="nav-link" href="servletLogin">
                                <span data-feather="log-out"></span>
                                Cerrar Sesion
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- CONTENEDOR 2 -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div
                    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Dashboard</h1>


                </div>
                <div class="row container centro_administrador">
                    <div class="col-sm-3 caja">
                        <div class="well">
                            <h4>Cantidad de Ordenes</h4>
                            <p> <%=request.getAttribute("cantidad")%> </p>
                        </div>
                    </div>
                   
                   
                </div>

                        <br><br>
                <!-- tabla usuarios -->
                
        <div class="container">         
            <table class="table text-center">
                <thead>
                    <tr>
                        <th scope="col"> # </th>
                        <th scope="col"> DNI Cliente </th>
                        <th scope="col"> Fecha </th>
                        <th scope="col"> Estado </th>
                        <th scope="col"> Entregar </th>
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
                        <th> <%=ordenes.getDNI()%> </th>
                        <td> <%=ordenes.getFechac()%> </td>
                        <td> <%=ordenes.getEstado()%> </td>
                        <td> 
                            <a onclick="servletNeutro('servletEntregar', '<%=ordenes.getIDBoleta()%>')">
                                <img src="img/cart.png" alt="Entregar Productos" style="height: 25px;">                                
                            </a>
                        </td>

                        <td>                                 
                            <a onclick="expandirDetalles('trOrden<%=i%>')"> <img src="img/bars.png" alt="Expandir" style="height: 25px;"> </a>                         
                        </td>
                                            </tr> 
                        
                    <tr class="trOrden<%=i%>" style="display: none;"> 
                        <td colspan="6"> 
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
                
            </main>
        </div>
    </div>
            
    <script src="js/controlServlets.js"> </script> 
            
    <!-- Formulario para redireccionamiento -->
    <form class="d-none" name="fServletNeutro" action="" method="Post">
        <input type="hidden" name="accion" id="fInput" value=""> 
        <input type="hidden" name="fId" id="fId" value=""> 
    </form> 
    
    <script type="text/javascript">
        function expandirDetalles(nameClass){   
            var trClass = document.getElementsByClassName(nameClass).item(0);
            if(trClass.style.display == ""){
                trClass.style.display = "none";
            }else{
                trClass.style.display = "";
            }
        }
        function asd(){
            console.log("asasd");
        }
    </script>
                        
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
        integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
        integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
        crossorigin="anonymous"></script>
    <script src="js/dashboard.js"></script>
    <!-- link modal bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>