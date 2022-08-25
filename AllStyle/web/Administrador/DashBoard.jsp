<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>plantilla || 2.0</title>
    <link rel="stylesheet" href="css/EstiloAdministrador.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">
    <link rel="stylesheet" href="css/rows.css">
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
                <a id="Login" style="cursor: pointer;color: white"><i class="fa-regular fa-user"></i> <span><%=usuario%></span></a>

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
                            <a class="nav-link active" aria-current="page" href="#">
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
                <br>
                <div class="row container centro_administrador">
                    <div class="text-center">
                        <h3 class="fw-bold"> Métricas </h3>
                    </div>
                    <a class="col-sm-3 caja bg-success" >
                        <div class="well">
                            <p>Usuarios <span class="iconify" data-icon="icon-park-outline:database-enter"></span></p>
                        </div>
                    </a>
                    <a class="col-sm-3 caja bg-success">
                        <div class="well">
                            <p>Productos <span class="iconify" data-icon="icon-park-outline:database-enter"></span></p>
                        </div>
                    </a>
                    <a  class="col-sm-3 caja bg-success">
                        <div class="well">
                             <p>Boletas <span class="iconify" data-icon="icon-park-outline:database-enter"></span></p>
                        </div>
                    </a>
                </div>
                
                
                <div class="row container centro_administrador">
                    <div class="text-center">
                        <h3 class="fw-bold"> DASHBOARD </h3>
                    </div>
                    <a class="col-sm-3 caja bg-primary " >
                        <div class="well">
                            <p>Usuarios Clientes <span class="iconify"></span></p>
                            <p><span style="font-size: 20px">( ${admin} )</span>  Usuarios Clientes</p>
                        </div>
                    </a>
                     <a class="col-sm-3 caja bg-primary " >
                        <div class="well">
                            <p>Usuarios Administradores <span class="iconify"></span></p>
                             <p><span style="font-size: 20px">( ${usuario} )</span>  Administradores</p>
                        </div>
                    </a>
                   <a class="col-sm-3 caja bg-primary " >
                        <div class="well">
                            <p>Total de Usuarios <span class="iconify"></span></p>
                             <p><span style="font-size: 20px">( ${TotalUsuario} )</span>  Total de Usuarios</p>
                        </div>
                    </a>
                    <a class="col-sm-3 caja bg-primary">
                        <div class="well">
                            <p>Productos <span class="iconify" data-icon=""></span></p>
                             <p><span style="font-size: 20px">( ${TotalProductos} )</span>  Productos</p>
                        </div>
                    </a>
                    <a  class="col-sm-3 caja bg-primary">
                        <div class="well">
                             <p>Boletas <span class="iconify" data-icon=""></span></p>
                             <p><span style="font-size: 20px">( ${TotalBoletas} ) </span> boletas Registradas</p>
                        </div>
                    </a>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
            integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
    crossorigin="anonymous"></script>
    <script src="js/dashboard.js"></script>
    <!-- link modal bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
            integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
    crossorigin="anonymous"></script>
    <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
</body>

</html>
