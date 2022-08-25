/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import utils.conexionDB;
import beans.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
    ResultSet rs;
    PreparedStatement ps;
        
     public List ListarBoleta(){
         ArrayList<Boletas> ListaBoletas = new ArrayList<>();
        
        try {
            ps = conexionDB.getConexion().prepareStatement("select * from boletas");
            rs = ps.executeQuery();
            while (rs.next()) {
            Boletas b = new Boletas();
            b.setIDBoleta(rs.getString(1));
            b.setDNI(rs.getString(2));
            b.setImpuesto(rs.getDouble(3));
            b.setFechac(rs.getString(4));
            b.setEstado(rs.getString(5));
            ListaBoletas.add(b);
            }
             
        } catch (Exception e) {
            
        }
         return ListaBoletas;
    }
      public List BuscarBoleta(String idBol) {
        ArrayList<Boletas> Boletas = new ArrayList<>();
        try {
            ps = conexionDB.getConexion().prepareStatement("select * from Boletas where IdBoleta=?");
            ps.setString(1, idBol);
            rs = ps.executeQuery();

            while (rs.next()) {
                Boletas b = new Boletas();
                b.setIDBoleta(rs.getString(1));
                b.setDNI(rs.getString(2));
                b.setImpuesto(rs.getDouble(3));
                b.setFechac(rs.getString(4));
                b.setEstado(rs.getString(5));
                Boletas.add(b);

            }

        } catch (Exception e) {
        }
        return Boletas;
    }
      public List DetallesBol(String detalles) {
        ArrayList<DetallesBoleta> Boletas = new ArrayList<>();
        try {
            ps = conexionDB.getConexion().prepareStatement("select * from detallesBoleta where IdBoleta=?");
            ps.setString(1, detalles);
            rs = ps.executeQuery();

            while (rs.next()) {
                DetallesBoleta b = new DetallesBoleta();
                b.setIDBoleta(rs.getString(1));
                b.setIDProducto(rs.getString(2));
                b.setCantidad(rs.getInt(3));
                b.setDescuento(rs.getDouble(4));
                b.setImporte(rs.getDouble(5));
                Boletas.add(b);

            }

        } catch (Exception e) {
        }
        return Boletas;
    }
     public List ListarProducto(){
         ArrayList<Productos> ListarProducto = new ArrayList<>();
        
        try {
            ps = conexionDB.getConexion().prepareStatement("select * from productos");
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos p = new Productos();
                p.setIdProducto(rs.getString(1));
                p.setNombreP(rs.getString(2));
                p.setDescP(rs.getString(3));
                p.setStock(rs.getInt(4));
                p.setPrecio(rs.getFloat(5));
                p.setGenero(rs.getString(6));
                p.setCategoria(rs.getString(7));
                p.setImagen(rs.getString(8));
                ListarProducto.add(p);
            }
                conexionDB.getConexion().close();
        } catch (Exception e) {
            
        }
         return ListarProducto;
    }

    public List BuscarP(String idProducto) {
        ArrayList<Productos> ListarProducto = new ArrayList<>();
        try {
            ps = conexionDB.getConexion().prepareStatement("select * from productos where idProducto=?");
            ps.setString(1, idProducto);
            rs = ps.executeQuery();

            while (rs.next()) {
                Productos p = new Productos();
                p.setIdProducto(rs.getString(1));
                p.setNombreP(rs.getString(2));
                p.setDescP(rs.getString(3));
                p.setStock(rs.getInt(4));
                p.setPrecio(rs.getFloat(5));
                p.setGenero(rs.getString(6));
                p.setCategoria(rs.getString(7));
                p.setImagen(rs.getString(8));
                ListarProducto.add(p);
            }

        } catch (Exception e) {
        }
        return ListarProducto;
    }
    public List BuscarUsuario(String DNI){
            ArrayList<Usuarios> listU = new ArrayList<>();
                try {
                    ps = conexionDB.getConexion().prepareStatement("select * from usuarios where dni=?");
                    ps.setString(1, DNI);
                    rs= ps.executeQuery();
                   
                    while (rs.next()) {
                       Usuarios u = new Usuarios();
                        u.setDNI(rs.getString(1));
                        u.setNombre(rs.getString(2));
                        u.setApellido(rs.getString(3));
                        u.setTelefono(rs.getString(4));
                        u.setCorreo(rs.getString(5));
                        u.setContraseña(rs.getString(6));
                        u.setRol(rs.getString(7));
                        u.setFnacimiento(rs.getString(8));
                        listU.add(u);
                      
                    }
                   
                } catch (Exception e) {
                }
        return listU;
    }
    public List ListarUsuario(){
         ArrayList<Usuarios> ListarUsuario = new ArrayList<>();
        
        try {
            ps = conexionDB.getConexion().prepareStatement("select * from usuarios");
            rs = ps.executeQuery();
            while (rs.next()) {
            Usuarios user = new Usuarios();
            user.setDNI(rs.getString(1));
            user.setNombre(rs.getString(2));
            user.setApellido(rs.getString(3));
            user.setTelefono(rs.getString(4));
            user.setCorreo(rs.getString(5));
            user.setContraseña(rs.getString(6));
            user.setRol(rs.getString(7));
            user.setFnacimiento(rs.getString(8));
            ListarUsuario.add(user);
            }
             
        } catch (Exception e) {
            
        }
         return ListarUsuario;
    }
    public List CantidadAdmin(){
         ArrayList<Usuarios> ListarUsuario = new ArrayList<>();
        
        try {
            ps = conexionDB.getConexion().prepareStatement("select * from usuarios where rol='admin'");
            rs = ps.executeQuery();
            while (rs.next()) {
            Usuarios user = new Usuarios();
            user.setDNI(rs.getString(1));
            user.setNombre(rs.getString(2));
            user.setApellido(rs.getString(3));
            user.setTelefono(rs.getString(4));
            user.setCorreo(rs.getString(5));
            user.setContraseña(rs.getString(6));
            user.setRol(rs.getString(7));
            user.setFnacimiento(rs.getString(8));
            ListarUsuario.add(user);
            }
             
        } catch (Exception e) {
            
        }
         return ListarUsuario;
    }
     public List CantidadCliente(){
         ArrayList<Usuarios> ListarUsuario = new ArrayList<>();
        
        try {
            ps = conexionDB.getConexion().prepareStatement("select * from usuarios where rol='cliente'");
            rs = ps.executeQuery();
            while (rs.next()) {
            Usuarios user = new Usuarios();
            user.setDNI(rs.getString(1));
            user.setNombre(rs.getString(2));
            user.setApellido(rs.getString(3));
            user.setTelefono(rs.getString(4));
            user.setCorreo(rs.getString(5));
            user.setContraseña(rs.getString(6));
            user.setRol(rs.getString(7));
            user.setFnacimiento(rs.getString(8));
            ListarUsuario.add(user);
            }
             
        } catch (Exception e) {
            
        }
         return ListarUsuario;
    }
    public int EliminarUsuario(String DNI){
        try {
            ps = conexionDB.getConexion().prepareStatement("delete  from usuarios where dni=?");
            ps.setString(1, DNI);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
            
        return 1;
    }
}
