package com.futbolito.persistencia;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.futbolito.to.HorarioTO;
import com.mysql.jdbc.Connection;

public class HorarioDAO {
	
	private static final String READ_ALL = "select * from horario";
	private static final String READ_HORARIO = "SELECT * FROM horario AS H JOIN Cancha AS C ON H.idCancha=C.idCancha WHERE C.idRecinto = ? ";
	
    private static final String DB_NAME = "futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    
    
    
    public LinkedList<HorarioTO> readAll(int id) throws SQLException{
        LinkedList<HorarioTO> list = new LinkedList<>();
        HorarioTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_HORARIO);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new HorarioTO();
                result.setIdHorario(rs.getInt("idHorario"));
                result.setPrecio(rs.getInt("Precio"));
                result.setHoraInicio(rs.getString("horaInicio"));
                result.setHoraFin(rs.getString("horaFin"));
                result.setIdRecinto(rs.getInt("idRecinto"));
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
