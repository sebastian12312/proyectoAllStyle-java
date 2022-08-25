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
                            <a class="nav-link" onclick="servletNeutro('servletOrdenes','ListarOrdenes')">
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
                            <h4>Cantidad de Productos</h4>
                            <p>${cantidadP} </p>
                        </div>
                    </div>
                   
                   
                </div>

                        <br><br>
                <!-- tabla usuarios -->
                <div class="container" style="overflow-x:auto;">
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalInsertarLogin"> Registrar
                      Nuevo Producto</a>  <br> <br>
                        <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID Producto</th>
                                <th scope="col">Nombre Producto</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Stock</th>
                                <th scope="col">Precio unidad </th>
                                <th scope="col">Genero</th>
                                <th scope="col">Categoria</th>
                                <th scope="col">Imagen</th>
                                <th scope="col">Accion</th>

                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:forEach var="p" items="${ListProductos}">
                            <tr>               
                                <td>${p.getIdProducto()}</td>
                                <td>${p.getNombreP()}</td>
                                <td>${p.getDescP()}</td>
                                <td>${p.getStock()}</td>
                                <td>${p.getPrecio()}</td>
                                <td>${p.getGenero()}</td>
                                <td>${p.getCategoria()}</td>
                                <td> <img src="imgProductos/${p.getImagen()}" alt="Producto ${p.getIdProducto()}" style="height: 50px"/> </td>
                                <td>
                                    <a onclick="servletNeutroId('CRUDAdministrador','BuscarProducto','${p.getIdProducto()}')" class="btn btn-dark" data-bs-toggle="" data-bs-target=""> Editar </a>
                                    <a onclick="servletNeutroId('CRUDAdministrador','EliminarProducto','${p.getIdProducto()}')" class="btn btn-danger"><span data-feather="trash-2"></span> Eliminar </a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Modal Insertar usuario -->
                    <div class="modal fade" id="ModalInsertarLogin" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Registrar Nuevo Producto</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <form action="servletAgregarProducto" method="post" enctype="multipart/form-data">
                                    <div class="modal-body">
                                        <div class="">
                                            <label>ID Producto</label>
                                            <input type="text" class="form-control" name="fId">
                                        </div>
                                        <div>
                                            <label>Nombre Producto</label>
                                            <input type="text" class="form-control" name="fNombre">
                                        </div>
                                        <div>
                                            <label>Descripcion</label>
                                            <input type="text" class="form-control" name="fDescripcion">
                                        </div>
                                        <div>
                                            <label>Stock</label>
                                            <input type="text" class="form-control" name="fStock">
                                        </div>
                                        <div>
                                            <label>Precio</label>
                                            <input type="text" class="form-control" name="fPrecio">
                                        </div>
                                        <div>
                                            <label>Genero</label>                                         
                                            <select name="fGenero" class="form-control">
                                                <option value="O">Sin Especificar</option>
                                                <option value="F">Femenino</option>
                                                <option value="M">Masculino</option>
                                            </select>
                                        </div>  
                                        <div>
                                            <label>Categoria</label>                                            
                                            <select name="fCategoria" class="form-control" >
                                                <option value="Accesorios">Accesorios</option>
                                                <option value="Poleras">Poleras</option>
                                                <option value="Polo">Polo</option>
                                                <option value="Buzo">Buzo</option>
                                                <option value="Short">Short</option>
                                                <option value="Media">Media</option>
                                                <option value="Zapatilla">Zapatilla</option>                                                
                                            </select>
                                        </div>                                    
                                        <div>
                                            <label>Imagen</label>
                                            <input type="file" class="form-control" name="fImagen">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button value="InsertProducto" name="accion" class="btn btn-primary"> Registrar Producto </button>
                                        <a class="btn btn-danger" data-bs-dismiss="modal"> Cerrar</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Editar Usuario -->
                    <div class="modal fade" id="BuscarUser" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Registrar Nuevo Usuario Administrador</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <c:forEach var="var" items="${Buscar}">
                                    <form action="CRUDAdministrador" method="post">
                                    <div class="modal-body">
                                        <div class="">
                                            <label>${var.getDNI()}</label>
                                            <input type="text" class="form-control" value="">
                                        </div>
                                        <div>
                                            <label>Nombre</label>
                                            <input type="text" class="form-control" name="nombre">
                                        </div>
                                        <div>
                                            <label>Apellido</label>
                                            <input type="text" class="form-control" name="apellido">
                                        </div>
                                        <div>
                                            <label>Telefono</label>
                                            <input type="text" class="form-control" name="telefono">
                                        </div>
                                         <div>
                                            <label>Correo</label>
                                            <input type="text" class="form-control" name="correo">
                                        </div>
                                        <div>
                                            <label>contraseña</label>
                                            <input type="text" class="form-control" name="pass">
                                        </div>  
                                        <div>
                                            <label> rol </label>
                                            <select name="rol" class="form-control">
                                                <option value="admin">Admin</option>
                                                <option value="cliente">Cliente</option>
                                            </select>
                                        </div>                                    
                                        <div>
                                            <label>Fecha de Nacimiento</label>
                                            <input type="date" class="form-control" name="fnacimiento">
                                        </div>
                                    </div>
                                    <div class="modal-footer">                                        
                                        <button value="InsertProducto" name="accion" class="btn btn-primary">Registrar</button>
                                        <a class="btn btn-danger" data-bs-dismiss="modal">Cerrar</a>
                                    </div>
                                </form>
                                </c:forEach>
                                
                            </div>
                        </div>
                    </div>
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