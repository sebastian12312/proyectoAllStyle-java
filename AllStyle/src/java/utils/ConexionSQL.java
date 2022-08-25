/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author sebas
 */
public class ConexionSQL {
    public static Connection getConexion(){
        String url="jdbc:sqlserver://localhost:1433;databaseName=AllStyle;user=sa;password=12345"; //Conexion URL
        Connection con = null ;
        try { 
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); //CONEXION AL DRIVER
            con = DriverManager.getConnection(url); //OTRA CONEXION QUE NOSE  PARA QUE SIRVE                       
            System.out.println("CONEXION EXITOSA");                         
        } catch (Exception e) {
            e.printStackTrace();
        }
          return con;
    }
}
