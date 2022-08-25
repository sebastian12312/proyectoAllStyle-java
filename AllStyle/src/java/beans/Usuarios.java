/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author sebas
 */
public class Usuarios {
     String DNI;
     String Nombre;
     String Apellido;
     String Telefono;
     String Correo;
     String Contraseña;
     String rol;
     String Fnacimiento;

    public Usuarios() {
    }

    public Usuarios(String DNI, String Nombre, String Apellido, String Telefono, String Correo, String Contraseña, String rol, String Fnacimiento) {
        this.DNI = DNI;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Contraseña = Contraseña;
        this.rol = rol;
        this.Fnacimiento = Fnacimiento;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getFnacimiento() {
        return Fnacimiento;
    }

    public void setFnacimiento(String Fnacimiento) {
        this.Fnacimiento = Fnacimiento;
    }
    
}
