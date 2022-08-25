function servletNeutro(direccionServlet, accion){ 
    document.getElementById("fInput").value = accion;
    document.fServletNeutro.action = direccionServlet;
    document.fServletNeutro.submit();
}

function servletNeutroId(direccionServlet, accion, id){
    document.getElementById("fInput").value = accion;
    document.getElementById("fId").value = id;
    document.fServletNeutro.action = direccionServlet;
    document.fServletNeutro.submit();
}