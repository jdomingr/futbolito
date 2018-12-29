package com.futbolito.persistencia;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.futbolito.to.EquipoTO;
import com.futbolito.to.TorneoTO;
import com.mysql.jdbc.Connection;

public class TorneoDAO {
	
	private static final String READ_ALL = "select * from torneo";
	private static final String READ_PROPIOS = "select * from torneo where idUsuario=?";
	private static final String INSERT_QUERY="insert into torneo (Nombre,FechaInicio,numeroParticipantes,idCampeon,idUsuario) values (?,?,?,?,?)";
	private static final String READ_TORNEO = "select * from cancha where idTorneo=?";


	//private static final String BUSCAR_POR_ID = "select numeroParticipantes from torneo where `idTorneo`=?";
	//private static final String ACTUALIZA_CANTEQUI = "UPDATE `torneo` SET `numeroParticipantes`=? WHERE `idTorneo`=?";

	

	private static final String BUSCAR_POR_ID2 = "select numeroParticipantes from torneo where `idTorneo`=?";
	private static final String ACTUALIZA_CANTEQUI = "UPDATE `torneo` SET `numeroParticipantes`=? WHERE `idTorneo`=?";

	private static final String BUSCAR_POR_ID = "select * from torneo where idTorneo=?";


	//private static final String UPDATE_ESTADO_CANCHA = "UPDATE cancha SET Estado = ? WHERE idCancha = ?";
    private static final String DB_NAME = "futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    
    
    
    public LinkedList<TorneoTO> readAll() throws SQLException{
        LinkedList<TorneoTO> list = new LinkedList<>();
        TorneoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_ALL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new TorneoTO();
                result.setIdTorneo(rs.getInt("idTorneo"));
                result.setNombreTorneo(rs.getString("Nombre"));
                result.setFechaInicio(rs.getDate("FechaInicio"));
                result.setNumeroParticipantes(rs.getInt("numeroParticipantes"));
                result.setIdCampeon(rs.getInt("idCampeon"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TorneoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    
    public void  CrearTorneo(TorneoTO tic) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(INSERT_QUERY);
            ps.setString(1, tic.getNombreTorneo());
            ps.setDate(2, tic.getFechaInicio());
            ps.setInt(3, tic.getNumeroParticipantes());
            ps.setNull(4, tic.getIdCampeon());
            ps.setInt(5, tic.getIdUsuario());
            
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(TorneoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
    
    public LinkedList<TorneoTO> listarTorneosPropios(int id) throws SQLException{
        LinkedList<TorneoTO> list = new LinkedList<>();
        TorneoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_PROPIOS);
            ps.setInt(1, id );
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new TorneoTO();
                result.setIdTorneo(rs.getInt("idTorneo"));
                result.setNombreTorneo(rs.getString("Nombre"));
                result.setFechaInicio(rs.getDate("FechaInicio"));
                result.setNumeroParticipantes(rs.getInt("numeroParticipantes"));
                result.setIdCampeon(rs.getInt("idCampeon"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TorneoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    
    public TorneoTO buscarPorId(int id) throws SQLException{
        TorneoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(BUSCAR_POR_ID);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	result= new TorneoTO();
                result.setIdTorneo(rs.getInt("idTorneo"));
                result.setNombreTorneo(rs.getString("Nombre"));
                result.setFechaInicio(rs.getDate("FechaInicio"));
                result.setNumeroParticipantes(rs.getInt("numeroParticipantes"));
                result.setIdCampeon(rs.getInt("idCampeon"));
                result.setIdUsuario(rs.getInt("idUsuario"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return result;
    }
    
    /*
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
    
    
    */
    
    public void actualizarCantidadEquiposTorneo(int idTorneo) throws SQLException {
        Connection conn=null;
        
        TorneoTO torneito = new TorneoTO();
        torneito = buscarPorId2(idTorneo);
        int valor = torneito.getNumeroParticipantes();
        int numeroPar = valor+1;
       try{
           conn=getConnection();
           PreparedStatement ps=conn.prepareStatement(ACTUALIZA_CANTEQUI);
           ps.setInt(1,numeroPar );
           ps.setInt(2,idTorneo);
           
           ps.executeUpdate();
           
           
       }catch(SQLException ex){
           Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
       }finally{
           if(conn!=null){
               conn.close();
           }
       }
      
   	
   }
    
public TorneoTO buscarPorId2(int id) throws SQLException{
        
        TorneoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(BUSCAR_POR_ID2);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new TorneoTO();
                result.setIdTorneo(id);
                result.setNumeroParticipantes(rs.getInt("numeroParticipantes"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(TorneoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return result;
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
