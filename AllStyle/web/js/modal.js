const Login = document.getElementById("Login");
const ventana_login = document.getElementById("ventana_login");
const CerrarVentana = document.getElementById("CerrarVentana");

const ventana_registrar = document.getElementById("ventana_registrar");
const registrarVentana = document.getElementById("registrarVentana");
const Login2 = document.getElementById("Login2");
const cerrarregister = document.getElementById("cerrarregister");
Login.addEventListener('click', ()=>{
    ventana_login.classList.add("AbrirLogin");
});
CerrarVentana.addEventListener('click', ()=>{
    ventana_login.classList.remove("AbrirLogin");
});
registrarVentana.addEventListener('click', ()=>{
    ventana_login.classList.remove("AbrirLogin");
    ventana_registrar.classList.add("AbriRegister");
});
Login2.addEventListener('click', ()=>{
    ventana_registrar.classList.remove("AbriRegister");
    ventana_login.classList.add("AbrirLogin");
});
cerrarregister.addEventListener('click', ()=>{
    ventana_login.classList.remove("AbrirLogin");
    ventana_registrar.classList.remove("AbriRegister");
});