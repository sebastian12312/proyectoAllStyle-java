<%-- 
    Document   : EditarUsuario
    Created on : 8 jun. 2022, 23:40:33
    Author     : sebas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
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
            String usuario = (String) session.getAttribute("usuario");
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
        <div class="container-fluid">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
                    <div class="position-sticky pt-3">
                        <ul class="nav flex-column color_li">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="CRUDAdministrador?Accion=Dashboard">
                                    <span data-feather="home"></span>
                                    Dashboard
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="file"></span>
                                    ORDEN
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="shopping-cart"></span>
                                    PRODUCTO
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
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
                                <a class="nav-link" href="#">
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
                 
                        <form action="CRUDAdministrador" method="post" class="container">
                            
                            <div class="modal-body">
                               <c:forEach var="b" items="${BuscarBoleta}">
                                   <div> 
                                   <label for="">IDBOLETA</label>
                                       <input type="text" class="form-control" name="" value="${b.getIDBoleta()}" readonly="">
                                   </div>
                                <div>
                                    <label for="">DNI</label>
                                    <input type="text" class="form-control" name="" value="${b.getDNI()}" readonly="">
                                </div>
                                <div>
                                    <label for="">Fecha</label>
                                    <input type="text" class="form-control" name="" value="${b.getImpuesto()}" readonly="">
                                    
                                </div>
                                <div>
                                    <label for="">Fecha de compra</label>
                                    <input type="date" class="form-control" name="" value="${b.getFechac()}" readonly="">
                                </div>
                                <div>
                                    <label for="">Estado</label>
                                   
                                    <select class="form-control">
                                        <option value="${b.getEstado()}">Estado: ${b.getEstado()}</option>
                                        <option value="ENTREGADO">ENTREGADO</option>
                                        <option value="PENDIENTE">PENDIENTE</option>
                                    </select>
                                </div>
                                
                                </c:forEach>
                               <c:forEach var="d" items="${detalles}">
                                   <div>
                                       <label for="">IDBOLETA</label>
                                       <input type="text" class="form-control" name="" value="${d.getIDBoleta()}" readonly="">
                                   </div>   
                                   <div>
                                       <label for="">ID PRODUCTO</label>
                                       <input type="text" class="form-control" name="" value="${d.getIDProducto()}" readonly="">
                                   </div>    <div>
                                       <label for="">CANTIDAD</label>
                                       <input type="text" class="form-control" name="" value="${d.getCantidad()}" readonly="">
                                   </div>    <div>
                                       <label for="">DESCUENTA</label>
                                       <input type="text" class="form-control" name="" value="${d.getDescuento()}" readonly="">
                                   </div>   
                                   <div>
                                       <label for="">IMPORTE</label>
                                       <input type="text" class="form-control" name="" value="${d.getImporte()}" readonly="">
                                   </div>               
                               </c:forEach>
                            </div>
                                 
                            <div class="">
                                <input type="submit" value="Editar" name="Accion" class="btn btn-primary">
                                  <a  href="CRUDAdministrador?Accion=ListarBoleta" class="btn btn-danger" >Regresar</a>
                            </div>
                        </form>
                  
                     

                    <!-- tabla usuarios -->

                </main>
            </div>
        </div>


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
