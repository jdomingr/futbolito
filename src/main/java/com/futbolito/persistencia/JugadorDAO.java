package com.futbolito.persistencia;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.futbolito.to.EquipoTO;
import com.futbolito.to.JugadorTO;
import com.mysql.jdbc.Connection;

public class JugadorDAO {
	
	private static final String INSERT_QUERY = "insert into jugador (Nombre,Apellido,idEquipo) values (?,?,?)";
	private static final String READ_JUGADORES_EQUIPO = "select * from jugador where idEquipo=?";
	private static final String DELETE = "delete from jugador where idJugador=?";
	private static final String UPDATE = "UPDATE `jugador` SET `Nombre`=?,`Apellido`=? WHERE idJugador=?";
	private static final String BUSCAR_POR_ID = "select * from jugador where `idJugador`=?";
    private static final String DB_NAME = "futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    
    
    
    
    public void  insertarJugador(JugadorTO tic) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(INSERT_QUERY);
            ps.setString(1, tic.getNombre());
            ps.setString(2, tic.getApellido());
            ps.setInt(3, tic.getIdEquipo());
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
    
    public LinkedList<JugadorTO> listarJugadoresEquipo(int id) throws SQLException{
        LinkedList<JugadorTO> list = new LinkedList<>();
        JugadorTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_JUGADORES_EQUIPO);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new JugadorTO();
                result.setIdJugador(rs.getInt("idJugador"));
                result.setNombre(rs.getString("Nombre"));
                result.setApellido(rs.getString("Apellido"));
                result.setIdEquipo(rs.getInt("idEquipo"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    
    public void eliminarJugador(int id) throws SQLException {
    	Connection conn=null;
    	
    	try {
    		conn = getConnection();
    		 PreparedStatement ps = conn.prepareStatement(DELETE);
    		 ps.setInt(1,id);
    		 ps.executeUpdate();
    		
    	}catch(Exception e) {
    		 Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, e);
    	}finally{
            conn.close();
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
    public void  modificarJugador(JugadorTO tic) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(UPDATE);
            ps.setString(1, tic.getNombre());
            ps.setString(2, tic.getApellido());
            ps.setInt(3, tic.getIdJugador());
            
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
public JugadorTO buscarPorId(int id) throws SQLException{
        
        JugadorTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(BUSCAR_POR_ID);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new JugadorTO();
                result.setIdJugador(rs.getInt("idJugador"));
                result.setNombre(rs.getString("Nombre"));
                result.setApellido(rs.getString("Apellido"));
                result.setIdEquipo(rs.getInt("idEquipo"));
              
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return result;
    }
    

}
