<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Style || 2022</title>
    <link rel="stylesheet" href="css/modal.css">
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/productos.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/ec4896fd00.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="img/tshirt.png" type="image/x-icon">
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


    <div class="botones">
        <div class="boton_bar">
            <a href="#"><img src="img/bars.png" alt=""></a>
        </div>
        <div class="boton_cart">
            <a href="#" class="">
                <img src="img/cart2.png" alt="">
            </a>
            <span class="contador">10</span>
        </div>
    </div>

    <div class="contenedor_productos">
        <div class="productos_fila">    
            <%
                for (int i = 0; i < 12; i++) {
                %>
            <div class="productos">
                <img src="img/tshirt.png"  alt="Avatar" style="">
                <div class="contenido_producto">
                    <p>Producto:</p>
                    <p>Precio:</p>
                    <p>Categoria:</p> 
                   <div class="btn_productos">
                    <a id="añadir" href="#"> <i class="fa-solid fa-cart-shopping"></i> Añadir </a>
                   </div>
                </div>
            </div>
            <%
                }
                %>
        </div>       
    </div>

    <!-- Login -->
     <div class="contenedor_modal" id="ventana_login" >    
            <form action="servletLogin" class="form" method="post">
                <a id="CerrarVentana" class="cerrar_login"><img src="img/close.png" alt=""></a>
                <h1 class="titulo_login">All Style</h1>
                <div class="label input">
                    <label>Email</label>
                    <input type="text" name="fEmail">
                </div>
                <div class="label input">
                    <label>Contraseña</label>
                    <input type="password" name="fPassword">
                </div>
                <div class="btn_login">
                    <button>Iniciar Sesion</button>
                    <a id="registrarVentana">Registrar</a>
                </div>
                <p class="msg">Tu Contraseña Es privada !No lo Compartas¡</p>
            </form>    
    </div> 
    
    <!-- Register -->
    <div class="contenedor_modal_registrar" id="ventana_registrar">
        
        <form action="servletRegister" class="form_register" method="post">
              <a id="cerrarregister" class="cerrar_login"><img src="img/close.png" alt=""></a>
            <h1>Registrate En All Style</h1>
            <input type="hidden" name="fRol" value="Cliente">
            <div class="division_register">
                <div class="label input_register">
                    <label>DNI</label>
                    <input type="text" name="fDni">
                </div>
                <div class="label input_register">
                    <label>NOMBRES</label>
                    <input type="text" name="fNombres">
                </div>
            </div>
            <div class="division_register">
                <div class="label input_register">
                    <label>APELLIDOS</label>
                    <input type="text" name="fApellidos">
                </div>
                <div class="label input_register">
                    <label>TELEFONO</label>
                    <input type="text" name="fTelefono">
                </div>
            </div>
            <div class="division_register">
                <div class="label input_register">
                    <label>CORREO</label>
                    <input type="text" name="fEmail">
                </div>
                <div class="label input_register">
                    <label>CONTRASEÑA</label>
                    <input type="password" name="fPassword">
                </div>
            </div>
            <div class="division_register">
                <div class="label input_date">
                    <label>FECHA NACIMIENTO</label>
                    <input type="date">
                </div>
                
            </div>
            <div class="botones_register">
                <button type="submit">Registrar</button>
                <a id="Login2">Iniciar Sesion</a>
            </div>
        </form>
    </div>
   
    <script src="js/controlServlets.js"> </script> 
            
    <!-- Formulario para redireccionamiento -->
    <form class="d-none" name="fServletNeutro" action="" method="Post">
        <input type="hidden" name="accion" id="fInput" value=""> 
        <input type="hidden" name="fId" id="fId" value=""> 
    </form> 
    
<script src="js/modal.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>