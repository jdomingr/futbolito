package com.futbolito.persistencia;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.futbolito.to.CanchaTO;
import com.futbolito.to.EquipoTO;
import com.futbolito.to.PartidoTO;
import com.mysql.jdbc.Connection;

public class CanchaDAO {
	
	private static final String READ_ALL = "select * from cancha";
	private static final String READ_CANCHA = "select * from cancha where idRecinto=?";
	private static final String UPDATE_ESTADO_CANCHA = "UPDATE cancha SET Estado = ? WHERE idCancha = ?";
	private static final String BUSCAR_POR_ID = "select * from cancha where `idCancha`= ?";
    private static final String DB_NAME = "futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    
    
    
    public LinkedList<CanchaTO> readAll(int id) throws SQLException{
        LinkedList<CanchaTO> list = new LinkedList<>();
        CanchaTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_CANCHA);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new CanchaTO();
                result.setIdCancha(rs.getInt("idCancha"));
                result.setNumero(rs.getInt("Numero"));
                result.setEstado(rs.getString("Estado"));
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
    
    
    public void  actualizarEstadoCancha(CanchaTO can) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(UPDATE_ESTADO_CANCHA);
            ps.setString(1, can.getEstado());
            ps.setInt(2, can.getIdCancha()); 
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
    
    public CanchaTO buscarPorId(int id) throws SQLException{
        
    	CanchaTO result = null;
           Connection conn=null;
           try {
               conn = getConnection();
               PreparedStatement ps = conn.prepareStatement(BUSCAR_POR_ID);
               ps.setInt(1,id);
               ResultSet rs = ps.executeQuery();
               while(rs.next()){
               	 result= new CanchaTO();
               	 result.setIdCancha(rs.getInt("idCancha"));
               	 result.setNumero(rs.getInt("Numero"));
               	 result.setEstado(rs.getString("Estado"));
               	 result.setIdRecinto(rs.getInt("idRecinto"));
                   
               }
           } catch (SQLException ex) {
               Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
           } finally{
               conn.close();
           }
           return result;
       }
	


}
