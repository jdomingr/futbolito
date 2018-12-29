package com.futbolito.persistencia;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.futbolito.to.RecintoTO;
import com.mysql.jdbc.Connection;

public class RecintoDAO {
	
private static final String READ_ALL = "select * from recinto";
	
	
    private static final String DB_NAME = "futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    
    
    
    public LinkedList<RecintoTO> readAll() throws SQLException{
        LinkedList<RecintoTO> list = new LinkedList<>();
        RecintoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_ALL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new RecintoTO();
                result.setIdRecinto(rs.getInt("idRecinto"));
                result.setNombre(rs.getString("Nombre"));
                result.setDireccion(rs.getString("Direccion"));
                result.setTelefono(rs.getString("Telefono"));
                result.setNumeroCanchas(rs.getInt("numeroCanchas"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    
    

    public static Connection getConnection(){
        Connection conn=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=(Connection) DriverManager.getConnection(URL, USER, PASSWORD);
        }catch(ClassNotFoundException | SQLException el){
            el.printStackTrace();
            System.err.println("Quedo la parte hermano!!!");
        }
        return conn;
    }
	

}
