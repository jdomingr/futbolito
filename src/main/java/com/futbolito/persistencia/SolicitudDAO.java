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
import com.futbolito.to.SolicitudTO;
import com.mysql.jdbc.Connection;

public class SolicitudDAO {
	private static final String INSERT_QUERY = "INSERT INTO `solicitud`( `nombre_equipo`,accion,descripcion,estado,`id_usuario`) VALUES (?,?,?,?,?)";
    private static final String READ_SOLICITUD ="SELECT * FROM solicitud where estado = ?";
    private static final String UPDATE="UPDATE solicitud SET estado=? WHERE id_solicitud=?";
	private static final String DB_NAME = "futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    
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
    public void  CrearSolicitud(SolicitudTO tic) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(INSERT_QUERY);
            ps.setString(1, tic.getNombre_equipo());
            ps.setString(2, tic.getAccion());
            ps.setString(3, tic.getDescripcion());
            ps.setString(4, "pendiente");
            ps.setInt(5, tic.getId_usuario());
            ps.executeUpdate();       
        }catch(SQLException ex){
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
    
    public LinkedList<SolicitudTO> readAllSolicitudes() throws SQLException{
        LinkedList<SolicitudTO> list = new LinkedList<>();
        SolicitudTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_SOLICITUD);
            ps.setString(1, "pendiente");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new SolicitudTO();
                result.setId_solicitud(rs.getInt("id_solicitud"));
                result.setNombre_equipo(rs.getString("nombre_equipo"));
                result.setAccion(rs.getString("accion"));
                result.setDescripcion(rs.getString("descripcion"));
                result.setEstado(rs.getString("estado"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    
    public void  actualizarState(int id) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(UPDATE);
            ps.setString(1, "realizado");
            ps.setInt(2, id);
            
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
    

}
