package com.futbolito.persistencia;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.futbolito.to.HorarioTO;
import com.futbolito.to.JugadorTO;
import com.futbolito.to.ReservaTO;
import com.futbolito.to.verificarTO;
import com.mysql.jdbc.Connection;

public class ReservaDAO {
	
	
	private static final String READ_RESERVA_USUARIO = "select * from reserva where idUsuario=?";
	private static final String INSERT_RESERVA="insert into reserva (Usuario_idUsuario,Horario_idHorario,fecha,Hora) values (?,?,?,?)";
    private static final String DB_NAME = "futbolito";
    private static final String DELETE_RESERVA = "delete from reserva where idReserva = ?";
    private static final String RESERVADAS = "SELECT R.fecha, R.Horario_idHorario FROM reserva AS R JOIN horario AS H ON R.Horario_idHorario=H.idHorario ";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    
    
    
    public void  insertarReserva(ReservaTO tic) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(INSERT_RESERVA);
            ps.setInt(1, tic.getIdUsuario());
            ps.setInt(2, tic.getIdHorario());
            ps.setDate(3, tic.getFecha());
            ps.setString(4, tic.getHora());
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
    
    public LinkedList<ReservaTO> readAll(int id) throws SQLException{
        LinkedList<ReservaTO> list = new LinkedList<>();
        ReservaTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_RESERVA_USUARIO);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new ReservaTO();
                result.setIdReserva(rs.getInt("idReserva"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                result.setIdHorario(rs.getInt("idHorario"));
                result.setFecha(rs.getDate("fecha"));
                result.setHora(rs.getString("hora"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    
    
    
    public void cancelarReserva(int id) throws SQLException {
    	   	Connection conn=null;
    	    	
    	    	try {
    	    		conn = getConnection();
    	    		 PreparedStatement ps = conn.prepareStatement(DELETE_RESERVA);
    	    		 ps.setInt(1,id);
    	    		 ps.executeUpdate();
    	    		
    	    	}catch(Exception e) {
    	    		 Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, e);
    	    	}finally{
    	            conn.close();
    	        }
    	    }
    
    
    
    
    
    public LinkedList<verificarTO> readReservadas() throws SQLException{
        LinkedList<verificarTO> list = new LinkedList<>();
        verificarTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(RESERVADAS);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new verificarTO();
                result.setFecha(rs.getDate("fecha"));
                result.setIdHorario(rs.getInt("Horario_idHorario"));
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
