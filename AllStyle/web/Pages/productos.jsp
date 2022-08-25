<%@page import="beans.CarritoBeans"%>
<%@page import="beans.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.ProductoBeans"%>
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
                    <li><a href="#"> Productos </a></li>
                    <li><a href="#">Contacto</a></li>
                    <li><a href="#">Nosotros</a></li>
                </ul>
            </div>
        </div>
        
        <%
            if(usuario == null){
            %>
        
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
        
        <div class="header_2">
            <div class="header_2_a_1" style="margin-top: 13px;">
                <a id="Login" style="cursor: pointer;" href="servletLogin"><i class="fa-regular fa-user"></i> <span> <%=usuario%> </span></a>
            </div>
            <a href="#Carrito" class="d-block" data-bs-toggle="offcanvas" role="button" aria-controls="offCanvas">
                <img src="img/ALLSTYLE.png" alt="Carrito de Compras" style="height: 50px">
            </a>
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
            ArrayList<Productos> arrayProductos = (ArrayList<Productos>)request.getAttribute("listaProductos");

            for (int i = 0; i < arrayProductos.size(); i++) {    
                Productos producto = arrayProductos.get(i);
            %>
        
           
            <div class="productos">
                <img src="imgProductos/<%=producto.getImagen()%>"  alt="Avatar" style="width: auto;">
                <div class="contenido_producto">
                    <form action="servletAgregarCarrito" method="post"> 
                        <input type="hidden" name="fId" value="<%=producto.getIdProducto()%>">
                        <input type="hidden" name="fNombre" value="<%=producto.getNombreP()%>">
                        <input type="hidden" name="fPrecio" value="<%=producto.getPrecio()%>">
                        <input type="hidden" name="fImagen" value="<%=producto.getImagen()%>">
                        <p>Producto: <%=producto.getNombreP()%> </p>
                        <p>Precio: <%=producto.getPrecio()%> </p>   
                        <p>Categoria: <%=producto.getCategoria()%> </p> 
                        <p>Genero: <%=producto.getGenero()%> </p> 
                       <div class="btn_productos">
            <%
                if(usuario != null){
                %>
                
                        <button class="btn btn-success"> <i class="fa-solid fa-cart-shopping"></i> Añadir </button>
                    
            <%
                }else{
                %>

                        <button class="btn btn-success" onclick="requerirLogin()"> <i class="fa-solid fa-cart-shopping"></i> Añadir </button>
                
            <%
                }
                %>
                
                        </div>
                    </form>
                </div>
            </div>
            
        <%            
            }
            %>   
           
        <!-- Login -->
        <div class="contenedor_modal" id="ventana_login" >    
               <form action="servletLogin" class="form" method="POST">
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
                       <button type="submit">Iniciar Sesion</button>
                       <a id="registrarVentana">Registrar</a>
                   </div>
                   <p class="msg">Tu Contraseña Es privada !No lo Compartas¡</p>
               </form>    
       </div>     
            
               
        </div>       
    </div>
             
    <div class="offcanvas offcanvas-end" tabindex="-1" id="Carrito" aria-labelledby="offCanvas-label"> 
        <div class="offcanvas-header"> 
            <h5> Carrito de Compras </h5>
            <button type="button" class="btn-close" data-bs-toggle="offcanvas" aria-label="Close"> </button>
        </div>
        <div class="offcanvas-body"> 
        
            <table class="table text-center"> 
                
    <%
        if(session.getAttribute("carrito") != null){
            ArrayList<CarritoBeans> arrayCarrito = (ArrayList<CarritoBeans>)session.getAttribute("carrito");
            CarritoBeans carrito;
            
        %>
      
                <thead>
                    <tr> 
                        <th> Nombre </th>
                        <th> Precio c/u </th>
                        <th> Cantidad </th>
                        <th> Imagen </th>                    
                    </tr>
                </thead>
                <tbody> 
    <%
        int i = 0;
            for (CarritoBeans array : arrayCarrito) {
                carrito = arrayCarrito.get(i);
        %>
              
                    <tr> 
                        <td> <%=carrito.getNombre()%> </td>
                        <td> <%=carrito.getPrecio()%> </td>
                        <td> <%=carrito.getCantidad()%> </td>
                        <td> <img src="imgProductos/<%=carrito.getImagen()%>" alt="Producto<%=carrito.getIdProducto()%>" style="height: 25px"> </td>
                    </tr>
          
    <%
                i++;
            }
        }
        %>
                </tbody>
            </table>
        </div>                
        <div class="offcanvas-footer"> 
        
    <%
        if(session.getAttribute("carrito") != null){
        %>
            
            <div class="container text-center pb-2"> 
                <a class="btn btn-success" href="Pages/boletas.jsp"> Continuar </a>
            </div>
        
    <%
        }
        %>
        </div>
    </div>        
            
            
    <script> 
        function requerirLogin(){
            window.alert("Para realizar compras es necesario logearse.");
        }   
    </script>
   
    
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
