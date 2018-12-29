package com.futbolito.persistencia;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.futbolito.to.CompetirTO;
import com.futbolito.to.JugadorTO;
import com.mysql.jdbc.Connection;

public class CompetirDAO {
	
	
	private static final String INSERT_QUERY = "insert into competir (idTorneo,idEquipo) values (?,?)";
    private static final String DB_NAME = "futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
	
	
	
	
	 public void  insertarCompetir(CompetirTO tic) throws SQLException{
	        Connection conn=null;
	        
	        try{
	            conn=getConnection();
	            PreparedStatement ps=conn.prepareStatement(INSERT_QUERY);
	            ps.setInt(1, tic.getIdTorneo());
	            ps.setInt(2, tic.getIdEquipo());
	            ps.executeUpdate();
	            
	            
	        }catch(SQLException ex){
	            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }finally{
	            if(conn!=null){
	                conn.close();
	            }
	        }
	       
	        
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
