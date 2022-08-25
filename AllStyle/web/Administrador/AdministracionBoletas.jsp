<%-- 
    Document   : AdministracionUsuarios
    Created on : 8 jun. 2022, 19:32:09
    Author     : sebas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

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
                <div class="row container centro_administrador">
                    <div class="col-sm-3 caja">
                        <div class="well">
                            <h4>Cantidad de Boletas</h4>
                            <p>${cantidad} </p>
                        </div>
                    </div>
                    <div class="col-sm-3 caja">
                        <div class="well">
                            <h4>Cantidad de Boletas Entregada</h4>
                            <p>${cantidadC} </p>
                        </div>
                    </div>
                    <div class="col-sm-3 caja">
                        <div class="well">
                            <h4>Cantidad de Boleta Pendiente</h4>
                            <p>${cantA} </p>
                        </div>
                    </div>
                </div>

                        <br><br>
                <!-- tabla usuarios -->
                <div class="container" style="overflow-x:auto;">
                        <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID Boleta</th>
                                <th scope="col">DNI</th>
                                <th scope="col">Impuesto</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Estado </th>
                                <th scope="col">Accion</th>                                                                
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${ListarBoletas}">
                            <tr>                            
                                <td>${b.getIDBoleta()}</td>
                                <td>${b.getDNI()}</td>
                                <td>${b.getImpuesto()}</td>
                                <td>${b.getFechac()}</td>
                                <td>${b.getEstado()}</td>
                                <td>
                                    <a href="CRUDAdministrador?Accion=BuscarBoleta&IDboleta=${b.getIDBoleta()}" class="btn btn-dark"  data-bs-toggle="" data-bs-target="" >Editar</a>
                                    <a id="" href="CRUDAdministrador?Accion=Eliminar&DNI=" class="btn btn-danger"><span data-feather="trash-2"></span>Eliminar</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Modal Insertar usuario -->
                 
                    <!-- Modal Editar Usuario -->
             
                </div>
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